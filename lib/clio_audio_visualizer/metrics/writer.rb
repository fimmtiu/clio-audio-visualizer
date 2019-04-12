require 'json'

module Metrics
  class Writer
    attr_reader :file_path
    attr_reader :now

    def initialize(file_path, now = Time.now)
      @file_path = file_path
      @now = now
    end

    def write(metrics)
      summary = metrics.map { |metric| [metric.key, metric.variance] }.to_h
      summary["last_updated_at"] = now.to_f

      File.open(file_path, 'w') do |file|
        puts(summary.to_json)
        puts
        file.puts(summary.to_json)
      end
    end
  end
end
