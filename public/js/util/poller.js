function getDataFromServer() {
  return fetch("./data.json", { cache: "no-store" })
    .then(function(response) {
      return response.json();
    })
    .then(function(data) {
      console.log("data received from server")
      return data;
    })
    .catch(function() {
      // ensure subsequent requests are still made
      console.log("oh dear: non-2xx response");
    });
}

function mapNames(eventData) {
  let nameOfSoundsAndScores = {};

  for (var k in eventData) {
    const nameOfSound = metricsToSoundNames[k];
    nameOfSoundsAndScores[nameOfSound] = eventData[k];
  }
  return nameOfSoundsAndScores;
}

function processVolumeChangesFromNewEvents(callback, errorCallback) {
  getDataFromServer(errorCallback).then(function(data) {
    if (typeof data === "undefined") {
      errorCallback();
    } else {
      const mappings = mapNames(data);
      callback(mappings);
    }
    setTimeout(processVolumeChangesFromNewEvents.bind(this, callback, errorCallback), 2000);
  });
}
