import mapboxgl from 'mapbox-gl';


const mapElement = document.getElementById('map');

const markersJs = {}
let iconBase
let iconSelected


const selectPin = (id) => {
  // cleanSelected()

  const markerJs = markersJs[id]
  const element = markerJs.getElement()
  element.style.backgroundImage = `url('${iconSelected}')`;
  element.style.zIndex = `${element.style.zIndex + 1}`;
  markerJs.getElement().style.width = '80px';
  markerJs.getElement().style.height = '80px';

  // cleanSelected()
}

const cleanSelected  = (id) => {
  const markerJs = markersJs[id]
  const element = markerJs.getElement()
  element.style.backgroundImage = `url('${iconBase}')`;
  element.style.zIndex = '1';
  markerJs.getElement().style.width = '50px';
  markerJs.getElement().style.height = '50px';

}

// const cleanSelected  = () => {
//   Object.keys(markersJs).map(function(objectKey, index) {
//       const markerJs = markersJs[objectKey];
//       markerJs.getElement().style.backgroundImage = `url('${iconBase}')`;
//       markerJs.getElement().style.width = '50px';
//       markerJs.getElement().style.height = '50px';
//       element.style.zIndex = `${element.style.zIndex - 1}`;
//   });
// }

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  // console.log("coucous")
  markers.forEach((marker) => {
    console.log(marker)
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${iconBase}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '50px';
    element.style.height = '50px';
    element.style.zIndex = '1';
    element.id = marker.unique_id;
    element.style.transitionDuration = '0.5s';

    const markerJs = new mapboxgl.Marker(element)

    markerJs.setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);

    markersJs[marker.unique_id] = markerJs
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 11 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    const icons = JSON.parse(mapElement.dataset.icons);
    iconBase = icons.base
    iconSelected = icons.selected
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox, selectPin, cleanSelected };

