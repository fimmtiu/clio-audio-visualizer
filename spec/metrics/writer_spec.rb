require "spec_helper"

RSpec.describe Metrics::Writer do
  let(:filename) { "/tmp/result.json" }
  let(:now) { Time.new(2019, 4, 12) }
  subject { described_class.new(filename, now) }

  describe "#write" do
    it "writes a well-formatted JSON file" do
      metrics = [
        double(key: "foo", variance: -0.7),
        double(key: "bar", variance: 0.0),
        double(key: "baz", variance: 1.0),
      ]
      subject.write(metrics)
      expect(File.read(filename)).to eq "{\"foo\":-0.7,\"bar\":0.0,\"baz\":1.0,\"last_updated_at\":1555048800.0}\n"
    end
  end
end
