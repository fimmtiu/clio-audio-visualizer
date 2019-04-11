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

# Starting the front end

```
npm install
npm run serve
```
Then go to [http://localhost:8080/index.html](http://localhost:8080/index.html).


### Starting the back end

```
ruby -Ilib exe/audio-visualizer-back-end [-i interval] [input data file]
```

Options:
* `-i`, `--poll-interval`: Seconds to wait between polling for new data.
* `input data file`: Optional JSON file containing canned Datadog responses, for testing.

If the input data file isn't present, it will poll Datadog's API instead.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fimmtiu/clio_audio_visualizer.

## TODO

* Signal deploys going out with a happy goat sound.

* Take non-peak times into account instead of going crazy at the end of the day.

## Commands for the demo

```
exe/run_demo
```

Hit Enter whenever you're ready to start the next segment.
