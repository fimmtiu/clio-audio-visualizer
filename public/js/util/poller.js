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

function processVolumeChangesFromNewEvents(callback) {
  getDataFromServer().then(function(data) {
    callback(data);
    setTimeout(processVolumeChangesFromNewEvents.bind(this, callback), 2000);
  });
}
