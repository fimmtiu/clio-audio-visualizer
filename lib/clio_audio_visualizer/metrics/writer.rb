require 'json'

module Metrics
  class Writer
    def self.write(metrics)
      summary = {}

      metrics.each do |metric|
        summary[metric.key] = metric.value
      end

      File.open(ENV['METRICS_FILE'], 'w') do |file|
        file.puts(summary.to_json)
      end
    end
  end
end
