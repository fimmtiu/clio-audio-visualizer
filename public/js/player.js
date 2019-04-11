Howler.volume(0.3);
let actors = {}

actors["crowd"] = new Howl({
	src: ['./audio/crowd.mp3'],
	volume: 0.0
});

actors["monkey"] = new Howl({
	src: ['./audio/monkeys_quiet.wav'],
	volume: 0.0
});

actors["forest"] = new Howl({
	src: ['/audio/forest_base.wav'],
	volume: 0.0,
	loop: true
});

actors["stream"] = new Howl({
	src: ['./audio/stream_base.wav'],
	volume: 0.0,
	loop: true
});

actors["insects"] = new Howl({
	src: ['./audio/frogs_insects.wav']
	volume: 0.0,
	loop: true
});

function beginSoundscape() {
	actors["forest"].play();
	actors["stream"].play();

	actors["forest"].fade(0, 0.5, 2500)
	actors["stream"].fade(0, 0.5, 4000)

	processVolumeEvents();
}

function processVolumeEvents() {
	callFunctionOnArrayElementsAfterInterval(volumeEvents, function (volumeEvent) {
		for (var k in volumeEvent) {
			const currentVolume = actors[k].volume();
			console.log("setting volume on actor")
			actors[k].fade(currentVolume, volumeEvent[k], 250);
		}
	}, 5000);
}
