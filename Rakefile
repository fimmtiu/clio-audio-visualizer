require "json"
require "dotenv/load"
require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

def set_variance(variance_key, value)
  file_path = ENV['VARIANCES_FILE_PATH']

  current = JSON.parse(File.read(file_path))

  File.open(file_path, "w") do |file|
    current[variance_key] = value

    file.puts current.to_json
  end
end

namespace :break do
  desc "Set selects per second to -1.0"
  task :db_selects do
    set_variance("Database SELECT statements per second", -1.0)
  end

  desc "Set slow queries per second to 1.0"
  task :db_slow_queries do
    set_variance("Database slow queries per second", 1.0)
  end

  desc "Set requeue jobs performed per second to -1.0"
  task :resque_jobs do
    set_variance("Resque jobs performed per second", -1.0)
  end

  desc "Set requeue low queue latency to 1.0"
  task :resque_latency do
    set_variance("Resque low queue latency", 1.0)
  end

  desc "Set HTTP requests per second to -1.0"
  task :http_requests do
    set_variance("HTTP requests per second", -1.0)
  end

  desc "Set HTTP 503s to 1.0"
  task :http_503s do
    set_variance("HTTP 503 errors", 1.0)
  end
end
