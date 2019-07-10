import "bootstrap"
import 'mapbox-gl/dist/mapbox-gl.css'
import { placesAutocomplete } from './placesAutocomplete'
import { initMapbox, selectPin, cleanSelected } from './initMapbox'
import { launchLoader } from './launchLoader'
import { colorScores } from './colorScores'
import { initGauge } from './initGauge'
import { initStars } from './initStars'
import { hideCalendarBtn } from './hideCalendarBtn'

placesAutocomplete()
initMapbox();
hideCalendarBtn();
colorScores();
initGauge();



let markers = document.querySelectorAll('mapboxgl-popup-content')

let cards = document.querySelectorAll('.ul-cards');
console.log(cards);

cards.forEach(card => {
 card.addEventListener('mouseover', () => {
   const id = card.querySelector('[data-id]').dataset.id;
   // console.log(id);
   selectPin(id)
 });

 card.addEventListener('mouseout', () => {
   const id = card.querySelector('[data-id]').dataset.id;
   // console.log(id);
   cleanSelected(id)
 });
});

const showMoreButton = document.querySelector('#show-more');
showMoreButton.addEventListener('click', () => {
  const clickCount = parseInt(showMoreButton.dataset.count);
  const max = parseInt(showMoreButton.dataset.max);
  showMoreButton.dataset.count = clickCount + 1;
  let id = 10 * (clickCount + 1) + 1;
  const limit = 10 * (clickCount + 2)
  while ((id <= limit) && (id <= max)) {
    document.querySelector(`#event-${id}`).style.removeProperty('display');
    id += 1;
  }
})
