const placesAutocomplete = () => {
  const input = document.querySelector('#address-input')
  if (input) {
    const places = require('places.js');
    const placesAutocomplete = places({
      appId: 'pl5MUZ5WV7W3',
      apiKey: 'dbe03cc82b4799b72c8c5ddaa40d97f1',
      container: document.querySelector('#address-input')
    });
  };
};


export { placesAutocomplete };
