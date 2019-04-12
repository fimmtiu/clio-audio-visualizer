require "dotenv/load"

require "clio_audio_visualizer/version"
require "clio_audio_visualizer/metrics/metric"
require "clio_audio_visualizer/metrics/file_reader"
require "clio_audio_visualizer/metrics/file_stream"
require "clio_audio_visualizer/metrics/datadog_reader"
require "clio_audio_visualizer/metrics/datadog_stream"
require "clio_audio_visualizer/metrics/writer"
require "clio_audio_visualizer/metrics/loader"

module ClioAudioVisualizer
  DATADOG_API = Dogapi::Client.new(ENV['DATADOG_API_KEY'], ENV['DATADOG_APPLICATION_KEY'])
end
