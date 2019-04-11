Howler.volume(0.3);
let actors = {}

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

actors["monkeys_quiet"] = new Howl({
	src: ['./audio/forest/monkeys_quiet.wav'],
	volume: 1.0,
	loop: true
});

actors["stream"] = new Howl({
	src: ['./audio/forest/stream_base.wav'],
	volume: 0.0,
	loop: true
});

function adjustVolumesFromEvents(soundNamesAndScores) {
	// always establish a base volume, in case it was previously silenced
	Howler.volume(0.3);

	for (var name in soundNamesAndScores) {
		if (actors[name]) {
			const currentVolume = actors[name].volume();
			console.log("setting volume on actor")
			actors[name].fade(currentVolume, soundNamesAndScores[name], 250);
		}
	}
}

function errorCallback() {
	Howler.volume(0);
}

function beginSoundscape() {
	actors["forest"].play();
	actors["stream"].play();

	actors["forest"].fade(0, 0.5, 2500)
	actors["stream"].fade(0, 0.5, 4000)

	processVolumeChangesFromNewEvents(adjustVolumesFromEvents, errorCallback);
}
