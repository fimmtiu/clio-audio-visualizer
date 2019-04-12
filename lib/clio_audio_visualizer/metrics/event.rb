module Metrics
  class Event
    attr_reader :value

    def initialize(definition, value)
      @definition = definition
      @value = value
    end

    # The key this metric will be saved to in the resulting json
    def key
      @definition["name"]
    end

    def result
      [key, value]
    end
  end
end
