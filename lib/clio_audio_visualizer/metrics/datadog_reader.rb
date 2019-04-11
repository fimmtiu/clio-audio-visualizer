require "dogapi"

module Metrics
  class DatadogReader < Metric
    DATADOG_API = Dogapi::Client.new(ENV['DATADOG_API_KEY'], ENV['DATADOG_APPLICATION_KEY'])

    def read_data(from, to)
      DATADOG_API.get_points(datadog_query, from, to)
    end

    def done?
      false
    end
  end
end
