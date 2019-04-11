require "spec_helper"

RSpec.describe Metrics::Writer do
  let(:filename) { "/tmp/result.json" }
  subject { described_class.new(filename) }

  describe "#write" do
    it "writes a well-formatted JSON file" do
      metrics = [
        double(key: "foo", value: -0.7),
        double(key: "bar", value: 0.0),
        double(key: "baz", value: 1.0),
      ]
      subject.write(metrics)
      result = JSON.parse(File.read(filename))
      expect(result).to eq metrics.map { |m| [m.key, m.value] }.to_h
    end
  end
end
