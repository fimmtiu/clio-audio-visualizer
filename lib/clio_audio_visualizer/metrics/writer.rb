require 'json'

module Metrics
  class Writer
    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def write(metrics)
      summary = metrics.map { |metric| [metric.key, metric.variance] }.to_h
      summary["written_at"] = Time.now.to_f

      File.open(file_path, 'w') do |file|
        puts(summary.to_json)
        puts
        file.puts(summary.to_json)
      end
    end
  end
end
