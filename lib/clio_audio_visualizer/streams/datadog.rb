require "dogapi"

module Streams
  class Datadog
    DATADOG_API = Dogapi::Client.new(ENV['DATADOG_API_KEY'], ENV['DATADOG_APPLICATION_KEY'])

    def initialize(metric_definitions)
      @metric_definitions = metric_definitions
    end

    def read_data(from, to)
      @metric_definitions.map do |metric_definition|
        response = DATADOG_API.get_points(metric_definition["metric"], from, to)
        points = response.dig(1, "series", 0, "pointlist") || []

        Metrics::Metric.new(metric_definition, points)
      end
    end

    def done?
      false
    end
  end
end
