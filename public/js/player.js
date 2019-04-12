function adjustVolumesFromEvents(soundConfigs) {
	// always establish a base volume, in case it was previously silenced
	Howler.volume(0.3);

	for (var name in soundConfigs) {
		if (actors[name]) {
			const currentVolume = actors[name].volume();

			if (hasPayloadRefreshed()) {
				console.log("setting volume on actor");
				const type = soundConfigs[name].type;

				targetVol = getTargetVolume(type, name, soundConfigs);
				actors[name].fade(currentVolume, targetVol, 250);
				if (actors[name].playing() && actors[name].loop()) {
					console.log("name:", name, "currentVolume:", currentVolume, "newVolume:", targetVol)
					actors[name].fade(currentVolume, targetVol, 250);
				} else if (!actors[name].playing()) {
					console.log("name:", name, "currentVolume:", currentVolume)
					actors[name].play();
				}
			}
		}
	}
}

function getTargetVolume(type, name, soundConfigs) {
	if (type == "normally_audible") {
		targetVol = scaleVolume(soundConfigs[name].volume, -1, 1, 0, 1)
	} else {
		targetVol = Math.abs(soundConfigs[name].volume)
	}
	return targetVol * soundConfigs[name].multiplier;
}

function scaleVolume(num, in_min, in_max, out_min, out_max, event_type){
	return (num - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

function switchTheme() {
	Howler.unload(); // stop all playing sounds

	const themeName = event.target.value;
	beginSoundscape(themeName);
}

function errorCallback() {
	Howler.volume(0);
}

function loadForest() {
	actors["forest"].play();
	actors["stream"].play();
	actors["frogs_insects"].play();
	actors["monkeys_loud"].play();
	actors["crows"].play();
	actors["wind"].play();

	actors["forest"].fade(0, 0.5, 500);
	actors["stream"].fade(0, 0.5, 500);
	actors["frogs_insects"].fade(0, 0.5, 500);
	actors["wind"].fade(0, 0.5, 500);
}

function loadOcean() {
	actors["ocean_beach"].play();
	actors["seagulls_loop"].play();
	actors["dolphins"].play();
	actors["man_drowning"].play();
	actors["sea_lions"].play();
	actors["parrot"].play();

	actors["ocean_beach"].fade(0, 0.5, 500);
	actors["seagulls_loop"].fade(0, 0.5, 500);
	actors["dolphins"].fade(0, 0.5, 500);
	actors["parrot"].fade(0, 0.5, 500);
}

function beginSoundscape(themeName) {
	Howler.volume(0.3);
	loadActors();

	let mapper = metricsToSoundNames["Forest"];

	if (themeName == "Ocean") {
		mapper = metricsToSoundNames["Ocean"];
		loadOcean();
	} else {
		loadForest();
	}

	processVolumeChangesFromNewEvents(adjustVolumesFromEvents, errorCallback, mapper);
}

beginSoundscape();
