# ClioAudioVisualizer

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/clio_audio_visualizer`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clio_audio_visualizer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clio_audio_visualizer

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

Make sure you modify the local `.env` file and set the appropriate environment variables.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Testing Metrics

Use `bin/console` to test fetching & writing metrics.

Instantiating the metrics:

```ruby
# loading from Datadog
metrics = Metrics::Loader.new.load("data/metric_definitions.json")
# loading from a local file
metrics = Metrics::Loader.new(data_file: "data/test_data.json").load("data/metric_definitions.json")
```

Fetching metric, using values over the last minute:

```ruby
metrics.first.load(Time.now - 60, Time.now)
```

Writing metrics:

```ruby
Metrics::Writer.write(metrics)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fimmtiu/clio_audio_visualizer.
