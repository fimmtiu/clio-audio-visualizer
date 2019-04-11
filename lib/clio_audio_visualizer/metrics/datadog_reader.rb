module Metrics
  class DatadogReader < Metric
    def read_data(from, to)
      DATADOG_API.get_points(datadog_query, from, to)
    end
  end
end
