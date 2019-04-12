# Clio Audio Visualizer

We like noise.

This is hackathon code that was thrown together in a very brief period of time and should not be used as an example of how to do anything. Not intended for production, or indeed for any serious purpose at all.

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

## TODO

* Take non-peak times into account instead of going crazy at the end of the day.

* Support EU, CA, and Grow. (Currently only supports Manage PROD-US.)

* Shark attack at the end of the demo

## Commands for the demo

```
exe/run_demo
```

Hit Enter whenever you're ready to start the next segment.
