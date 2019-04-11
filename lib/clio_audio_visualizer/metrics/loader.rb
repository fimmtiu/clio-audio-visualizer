require "json"

module Metrics
  class Loader
    attr_reader :data_file

    def initialize(data_file: nil)
      @data_file = data_file
    end

    def load(file_path)
      definitions = File.read(file_path)

      JSON.parse(definitions).map do |definition|
        if data_file
          Metrics::FileReader.new(definition, data_file)
        else
          Metrics::DatadogReader.new(definition)
        end
      end
    end
  end
end
