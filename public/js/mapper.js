const metricsToSoundNames = {
  "Forest": {
    "HTTP requests per second": {
      "sound": "forest",
      "type": "normally_audible",
      "multiplier": 1.0
    },
    "HTTP 503 errors": {
      "sound": "monkeys_loud",
      "type": "normally_silent",
      "multiplier": 1.2
    },
    "Database slow queries per second": {
      "sound": "crows",
      "type": "normally_silent",
      "multiplier": 1.0
    },
    "Database SELECT statements per second": {
      "sound": "stream",
      "type": "normally_audible",
      "multiplier": 1.5
    },
    "Resque low queue latency": {
      "sound": "frogs_insects",
      "type": "normally_audible",
      "multiplier": 0.15
    },
    "Deploy": {
      "sound": "happy_goat",
      "type": "normally_silent",
      "multiplier": 0.5
    },
    "Resque jobs performed per second": {
      "sound": "wind",
      "type": "normally_audible",
      "multiplier": 0.0075
    }
  },
  "Ocean": {
    "HTTP requests per second": {
      "sound": "ocean_beach",
      "type": "normally_audible",
      "multiplier": 1.0
    },
    "HTTP 503 errors": {
      "sound": "man_drowning",
      "type": "normally_silent",
      "multiplier": 1.0
    },
    "Database slow queries per second": {
      "sound": "crows",
      "type": "normally_silent",
      "multiplier": 1.0
    },
    "Database SELECT statements per second": {
      "sound": "seagulls_loop",
      "type": "normally_audible",
      "multiplier": 0.5
    },
    "Resque low queue latency": {
      "sound": "parrot",
      "type": "normally_audible",
      "multiplier": 0.8
    },
    "Deploy": {
      "sound": "ship_horn_oneshot",
      "type": "normally_silent",
      "multiplier": 1.0
    },
    "Resque jobs performed per second": {
      "sound": "dolphins",
      "type": "normally_audible",
      "multiplier": 0.7
    }
  }
}
