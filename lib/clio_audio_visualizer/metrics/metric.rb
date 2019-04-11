module Metrics
  class Metric
    attr_reader :value

    def initialize(definition)
      @definition = definition
    end

    def datadog_query
      @definition["metric"]
    end

    # The function that is called when processing the results from datadog
    def process_results(results)
      op = @definition["metric"][0,3]
      pointlist = results.dig(1, "series", 0, "pointlist") || []
      pointlist.map!(&:last)

      case op
      when "sum"
        pointlist.sum
      when "avg"
        pointlist.last
      when "max"
        pointlist.max
      else
        0
      end
    end

    def load(from, to)
      raise NotImplementedError
    end

    # The key this metric will be saved to in the resulting json
    def key
      @definition["name"].downcase.gsub(/\s/, "_")
    end
  end
end
