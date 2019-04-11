module Metrics
  class FileReader < Metric
    def initialize(definition, file_path)
      @data = JSON.parse(File.read(file_path))
      super
    end

    def load(from, to)
      @data.select do |response|
        pointlist = response.dig(1, "series", 0, "pointlist") || []
        response["query"] == datadog_query && pointlist.any? { |point| point.first.between?(from, to) }
      end
    end
  end
end
