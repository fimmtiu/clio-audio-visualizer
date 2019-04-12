module Streams
  class File
    def initialize(metric_definitions, file_path)
      @metric_definitions = metric_definitions
      @data = JSON.parse(::File.read(file_path))
    end

    def read_data(from, to)
      next_response_set = @data.shift

      metrics = []
      # Could probably just reduce here...
      next_response_set.each do |response|

        if response[1]["events"]
          events_in_time = response[1]["events"].select do |event|
            Time.at(event["date_happened"] / 1000).between?(from, to)
          end
          metric_definition = @metric_definitions.find { |definition| definition["is_event"] }

          metrics << Metrics::Event.new(metric_definition, events_in_time.count)
        else
          metric_definition = @metric_definitions.find { |definition| definition["metric"] && definition["metric"] == response[1]["query"] }
          next if metric_definition.nil?

          pointlist = response[1].dig("series", 0, "pointlist") || []
          points = pointlist.select do |point|
            Time.at(point.first / 1000).between?(from, to)
          end

          metrics << Metrics::Metric.new(metric_definition, points)
        end
      end

      metrics
    end

    def done?
      @data.empty?
    end
  end
end
