function getDataFromServer() {
  return fetch("./data.json")
    .then(function(response) {
      return response.json();
    })
    .then(function(data) {
      console.log("data received from server")
      return data;
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

function processVolumeChangesFromNewEvents(callback) {
  getDataFromServer().then(function(data) {
    const mappings = mapNames(data);
    callback(mappings);
    setTimeout(processVolumeChangesFromNewEvents.bind(this, callback), 2000);
  });
}
