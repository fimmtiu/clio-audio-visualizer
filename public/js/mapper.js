const metricsToSoundNames = {
  "Forest": {
    "HTTP requests per second": {
      "sound": "forest",
      "type": "normally_audible"
    },
    "HTTP 503 errors": {
      "sound": "monkeys_loud",
      "type": "normally_silent"
    },
    "Database slow queries per second": {
      "sound": "crows",
      "type": "normally_silent"
    },
    "Database SELECT statements per second": {
      "sound": "stream",
      "type": "normally_audible"
    },
    "Resque low queue latency": {
      "sound": "frogs_insects",
      "type": "normally_audible"
    },
    "Deploy": {
      "sound": "happy_goat",
      "type": "normally_silent"
    },
    "Resque jobs performed per second": {
      "sound": "wind",
      "type": "normally_audible"
    }
  },
  "Ocean": {
    "HTTP requests per second": {
      "sound": "ocean_beach",
      "type": "normally_audible"
    },
    "HTTP 503 errors": {
      "sound": "man_drowning",
      "type": "normally_silent"
    },
    "Database slow queries per second": {
      "sound": "crows",
      "type": "normally_silent"
    },
    "Database SELECT statements per second": {
      "sound": "seagulls_loop",
      "type": "normally_audible"
    },
    "Resque low queue latency": {
      "sound": "parrot",
      "type": "normally_audible"
    },
    "Deploy": {
      "sound": "ship_horn_oneshot",
      "type": "normally_silent"
    },
    "Resque jobs performed per second": {
      "sound": "dolphins",
      "type": "normally_audible"
    }
  }
}
