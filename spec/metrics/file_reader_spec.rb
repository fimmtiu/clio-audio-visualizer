require "spec_helper"

RSpec.describe Metrics::FileReader do
  let(:time_with_data) { Time.at(1555002800) }
  let(:definition) { JSON.parse(File.read("data/metric_definitions.json")).first }
  subject { described_class.new(definition, "data/test_data_too_high.json") }

  describe "#read_data" do
    it "returns nothing if there's no data in the given range" do
      start_at = Time.now - 86_400 * 365 * 2  # 2 years ago
      expect(subject.read_data(start_at, start_at + 60).length).to eq 0
    end

    it "returns data that exists in the given range" do
      results = subject.read_data(time_with_data, time_with_data + 60)
      expect(results.length).to eq 2
      expect(results[1]["query"]).to eq definition["metric"]
    end
  end

  describe "#datadog_query" do
    it "returns the metric query" do
      expect(subject.datadog_query).to eq definition["metric"]
    end
  end

  describe "#load" do
    it "returns the most recent value" do
      expect(subject.load(time_with_data, time_with_data + 60)).to eq 90
    end

    it "stores it in value" do
      subject.load(time_with_data, time_with_data + 60)
      expect(subject.value).to eq 90
    end
  end

  describe "#variance" do
    it "returns zero if the value is between low and high" do
      expect(subject).to receive(:value).at_least(:once).and_return(42)
      expect(subject.variance).to eq 0.0
    end

    it "returns a negative value if the metric is too low" do
      expect(subject).to receive(:value).at_least(:once).and_return(38)
      expect(subject.variance).to eq -0.7
    end

    it "returns a positive value if the metric is too high" do
      expect(subject).to receive(:value).at_least(:once).and_return(53)
      expect(subject.variance).to eq 0.8
    end

    it "clamps the value to 1.0 if the metric is really, really high" do
      expect(subject).to receive(:value).at_least(:once).and_return(31337)
      expect(subject.variance).to eq 1.0
    end

    it "clamps the value to -1.0 if the metric is really, really low" do
      expect(subject).to receive(:value).at_least(:once).and_return(0)
      expect(subject.variance).to eq -1.0
    end
  end
end
