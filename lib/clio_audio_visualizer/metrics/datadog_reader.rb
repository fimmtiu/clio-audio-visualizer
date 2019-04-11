module Metrics
  class DatadogReader < Metric
    def load(from, to)
      results = DATADOG_API.get_points(datadog_query, from, to)
      @value = process_results(results)
    end
  end
end
