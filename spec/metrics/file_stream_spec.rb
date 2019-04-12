require "spec_helper"

RSpec.describe Metrics::FileStream do
  let(:time_with_data) { Time.at(1555002800) }
  let(:definitions) { JSON.parse(File.read("data/metric_definitions.json")) }
  subject { described_class.new([definitions.first], "data/test_data_too_high.json") }

  describe "#read_data" do
    it "always returns a metric" do
      start_at = Time.now - 86_400 * 365 * 2  # 2 years ago
      results = subject.read_data(start_at, start_at + 60)
      expect(results.length).to eq 1
      expect(results.first.datadog_query).to eq definitions.first["metric"]
    end

    it "returns metrics with nil values if no data in given range" do
      start_at = Time.now - 86_400 * 365 * 2  # 2 years ago
      results = subject.read_data(start_at, start_at + 60)
      expect(results.first.value).to be_nil
    end

    it "returns data that exists in the given range" do
      results = subject.read_data(time_with_data, time_with_data + 60)

      expect(results.first.value).to eq 120
    end
  end
end
