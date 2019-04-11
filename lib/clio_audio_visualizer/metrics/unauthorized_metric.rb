require_relative "metric"

module Metrics
  class UnauthorizedMetric < Metric
    def self.datadog_query
      "sum:logstash.nginx.app_clio_com.status.401{region:prod_us_a}.as_count()"
    end

    def key
      "audiohack_sum_401s"
    end

    def self.process_results(results)
      (results.dig(1, "series", 0, "pointlist") || []).reduce(0) { |sum, point| sum += point.last }
    end
  end
end
