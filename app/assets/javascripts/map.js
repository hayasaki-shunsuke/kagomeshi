function initMap() {
  var pepabo = {
    lat: 31.578028,
    lng: 130.542754
  };
  var icon = "https://i.gyazo.com/8278cec9047b708328a96b4ba0c727a8.png";

  // drap map
  var map = new google.maps.Map(document.getElementById("map"), {
    center: {
      lat: pepabo["lat"],
      lng: pepabo["lng"]
    },
    zoom: 15
  });

  // add marker for pepabo
  new google.maps.Marker({
    position: new google.maps.LatLng({ lat: pepabo["lat"], lng: pepabo["lng"] }),
    icon: icon,
    map: map
  });

  var infoWindows = [];

  fetch("/api/restaurants.json", {
    method: "GET",
    headers: { "X-Requested-With": "XMLHttpRequest" },
    credentials: "same-origin"
  })
    .then(response => {
      return response.json();
    })
    .then(json => {
      json.forEach(function(r) {
        var infoWindow = new google.maps.InfoWindow({
          content: '<div class="info"><h3><a href="/restaurants/' + r["id"] + '">' + r["name"] + "</a></h3></div>"
        });
        infoWindows.push(infoWindow);

        var marker = new google.maps.Marker({
          position: new google.maps.LatLng({ lat: parseFloat(r["lat"]), lng: parseFloat(r["lng"]) }),
          title: r["name"],
          map: map
        });

        marker.addListener("click", function() {
          infoWindows.forEach(function(w) {
            w.close();
          });
          infoWindow.open(map, marker);
        });
      });
    })
    .catch(error => {
      console.warn("Failed to parsing", error);
    });
}
