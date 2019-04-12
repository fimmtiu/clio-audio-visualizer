require "dotenv/load"

require "clio_audio_visualizer/version"
require "clio_audio_visualizer/metrics/metric"
require "clio_audio_visualizer/streams/file"
require "clio_audio_visualizer/streams/datadog"
require "clio_audio_visualizer/metrics/writer"

module ClioAudioVisualizer
  DATADOG_API = Dogapi::Client.new(ENV['DATADOG_API_KEY'], ENV['DATADOG_APPLICATION_KEY'])
end
