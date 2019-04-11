var forest_base = new Howl({
	src: ["../audio/forest_base.wav"]
});

var id1 = forest_base.play();

forest_base.fade(0, 1, 2000, id1);
