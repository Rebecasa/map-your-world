import mapboxgl from 'mapbox-gl';



const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/rebecasa/cjsahct1g06q21fqyo2xbzko4',
      center: [-84.518641, 39.134270],
      zoom: 9.0
    });
  }
};


export { initMapbox };
