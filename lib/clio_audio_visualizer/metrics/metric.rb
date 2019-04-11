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
      when "sum" then pointlist.sum
      when "avg" then pointlist.last
      when "max" then pointlist.max
      else 0
      end
    end

    def load(from, to)
      results = read_data(from, to)
      @value = process_results(results)
    end

    def read_data(_from, _to)
      raise NotImplementedError
    end

    # The key this metric will be saved to in the resulting json
    def key
      @definition["name"]
    end
  end
end
