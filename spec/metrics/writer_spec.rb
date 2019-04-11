require "spec_helper"

RSpec.describe Metrics::Writer do
  subject { described_class.new("/tmp/result.json") }

end
