function loadActors() {
  window.actors = {}

  actors["crows"] = new Howl({
    src: ['./audio/forest/crows.wav'],
    volume: 0.0,
    loop: true
  });

  actors["forest"] = new Howl({
    src: ['./audio/forest/forest_base.wav'],
    volume: 0.0,
    loop: true
  });

  actors["frogs_insects"] = new Howl({
    src: ['./audio/forest/frogs_insects.wav'],
    volume: 0.0,
    loop: true
  });

  actors["goat_scream"] = new Howl({
    src: ['./audio/forest/goat_scream.wav'],
    volume: 1.0,
    loop: false
  });

  actors["happy_goat"] = new Howl({
    src: ['./audio/forest/happy_goat.wav'],
    volume: 1.0,
    loop: false
  });

  actors["monkeys_loud"] = new Howl({
    src: ['./audio/forest/monkeys_loud.wav'],
    volume: 0.0,
    loop: true
  });

  actors["stream"] = new Howl({
    src: ['./audio/forest/stream_base.wav'],
    volume: 0.0,
    loop: true
  });

  actors["wind"] = new Howl({
	src: ['./audio/forest/wind.wav'],
	volume: 0.0,
	loop: true
  });

  // OCEAN

  actors["dolphins"] = new Howl({
    src: ['./audio/ocean/dolphins.wav'],
    volume: 0.0,
    loop: true
  });

  actors["man_drowning"] = new Howl({
    src: ['./audio/ocean/man_drowning.wav'],
    volume: 0.0,
    loop: true
  });

  actors["ocean_beach"] = new Howl({
    src: ['./audio/ocean/ocean_beach.wav'],
    volume: 0.0,
    loop: true
  });

  actors["sea_lions"] = new Howl({
    src: ['./audio/ocean/sea_lions.wav'],
    volume: 0.0,
    loop: true
  });

  actors["seagulls_loop"] = new Howl({
    src: ['./audio/ocean/seagulls_loop.wav'],
    volume: 0.0,
    loop: true
  });

  actors["ship_horn_oneshot"] = new Howl({
    src: ['./audio/ocean/ship_horn_oneshot.wav'],
    volume: 1.0,
    loop: false
  });
}
