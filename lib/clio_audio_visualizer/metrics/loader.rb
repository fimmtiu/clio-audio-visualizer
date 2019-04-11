require "json"

module Metrics
  class Loader
    def self.load(file_path)
      definitions = File.read(file_path)

      JSON.parse(definitions).map do |definition|
        Metrics::Metric.new(definition)
      end
    end
  end
end
