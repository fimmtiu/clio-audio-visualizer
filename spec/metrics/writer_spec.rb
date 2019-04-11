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
      expect(File.read(filename)).to eq "{\"foo\":-0.7,\"bar\":0.0,\"baz\":1.0}\n"
    end
  end
end
