require "spec_helper"

RSpec.describe Metrics::Loader do
  describe "#load" do
    it "returns file readers if a file is specified" do
      metrics = described_class.new(data_file: "data/test_data_too_high.json").load("data/metric_definitions.json")
      expect(metrics.map(&:class).uniq).to eq [Metrics::FileReader]
    end

    it "returns Datadog readers if a file isn't specified" do
      metrics = described_class.new.load("data/metric_definitions.json")
      expect(metrics.map(&:class).uniq).to eq [Metrics::DatadogReader]
    end
  end
end
