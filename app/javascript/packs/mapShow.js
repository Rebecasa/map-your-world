import 'mapbox-gl/dist/mapbox-gl.css';
import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';

const mapElement2 = document.getElementById('map-show');
const long = document.getElementById('long').innerText;
const lat = document.getElementById('lat').innerText;


if (mapElement2) { // only build a map if there's a div#map to inject into
  mapboxgl.accessToken = mapElement2.dataset.mapboxApiKey;
  const mapShoW = new mapboxgl.Map({
    container: 'map-show',
    style: 'mapbox://styles/rebecasa/cjsahct1g06q21fqyo2xbzko4',
    center: [long, lat],
    zoom: 3
  });

  const markers = JSON.parse(mapElement2.dataset.markers);

  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .addTo(map);
  })

  if (markers.length === 0) {
    map.setZoom(1);
  } else if (markers.length === 1) {
    map.setZoom(14);
    map.setCenter([markers[0].lng, markers[0].lat]);
  } else {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach((marker) => {
      bounds.extend([marker.lng, marker.lat]);
    });
    map.fitBounds(bounds, { duration: 0, padding: 75 })
  }

  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
      .setHTML(marker.infoWindow.content))
      .addTo(map);
  })
}
