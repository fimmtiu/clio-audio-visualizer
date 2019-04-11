module Metrics
  class Metric
    attr_reader :value

    def initialize(value)
      @value = value
    end

    def self.datadog_query
      raise NotImplementedError
    end

    # The function that is called when processing the results from datadog
    def self.process_results(results)
      raise NotImplementedError
    end

    def self.from_datadog(from, to)
      results = DATADOG_API.get_points(self.datadog_query, from, to)
      new(self.process_results(results))
    end

    # The key this metric will be saved to in the resulting json
    def key
      raise NotImplementedError
    end
  end
end
