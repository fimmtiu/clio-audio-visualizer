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
      expect(results.length).to eq 1
      expect(results.first["query"]).to eq definition["metric"]
    end
  end

  describe "#datadog_query" do
    it "returns the metric query" do
      expect(subject.datadog_query).to eq definition["metric"]
    end
  end

  describe "#load" do
    it "returns the summed value" do
      expect(subject.load(time_with_data, time_with_data + 60)).to eq 133
    end

    it "stores it in value" do
      subject.load(time_with_data, time_with_data + 60)
      expect(subject.value).to eq 133
    end
  end
end
