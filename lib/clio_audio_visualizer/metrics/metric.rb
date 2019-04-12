module Metrics
  class Metric
    attr_reader :value

    def initialize(definition, points)
      @definition = definition
      @value = process_points(points)
    end

    def datadog_query
      @definition["metric"]
    end

    # The key this metric will be saved to in the resulting json
    def key
      @definition["name"]
    end

    # The function that is called when processing the results from datadog
    def process_points(points)
      op = @definition["metric"][0,3]
      points.map!(&:last)

      case op
      when "sum" then points.sum
      when "avg" then points.last
      when "max" then points.max
      else 0
      end
    end

    # How far off the expected value it is. -1.0 is really, really low; 1.0 is super high.
    # (This method is soooooooooooooooooooo ugly right now.)
    def variance
      expected, too_high, too_low = @definition.values_at("expected", "too_high", "too_low")
      return 0 if value.between?(too_low, too_high)
      difference = value - expected

      # Clamp the difference between our largest and smallest allowed values.
      max_difference = (too_high - expected) * 2
      min_difference = (too_low - expected) * 2
      difference = [difference, max_difference].min
      difference = [difference, min_difference].max

      # Translate the difference from a value to a float in the [-1.0, 1.0] range.
      if value > expected
        difference.to_f / max_difference
      else
        -(difference.to_f / min_difference)
      end
    end
  end
end
