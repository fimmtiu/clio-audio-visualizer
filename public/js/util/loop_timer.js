function callFunctionOnArrayElementsAfterInterval(array, callback, interval) {
    var newLoopTimer = new LoopTimer(function (time) {
        var element = array.shift();
        callback(element, time - start);
        array.push(element);
    }, interval);

    var start = newLoopTimer.start();
};

// Timer
function LoopTimer(render, interval) {
    var timeout;
    var lastTime;

    this.start = startLoop;
    this.stop = stopLoop;

    // Start Loop
    function startLoop() {
        timeout = setTimeout(createLoop, 0);
        lastTime = Date.now();
        return lastTime;
    }

    // Stop Loop
    function stopLoop() {
        clearTimeout(timeout);
        return lastTime;
    }

    // The actual loop
    function createLoop() {
        var thisTime = Date.now();
        var loopTime = thisTime - lastTime;
        var delay = Math.max(interval - loopTime, 0);
        timeout = setTimeout(createLoop, delay);
        lastTime = thisTime + delay;
        render(thisTime);
    }
}