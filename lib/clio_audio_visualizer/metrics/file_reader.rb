module Metrics
  class FileReader < Metric
    def initialize(definition, file_path)
      @data = JSON.parse(File.read(file_path))
      super(definition)
    end

    def read_data(from, to)
      result = @data.map.select do |response|
        next if response[1]["query"] != datadog_query
        pointlist = response[1].dig("series", 0, "pointlist") || []
        pointlist.any? do |point|
          Time.at(point.first / 1000).between?(from, to)
        end
      end.first
      return result || []
    end
  end
end
