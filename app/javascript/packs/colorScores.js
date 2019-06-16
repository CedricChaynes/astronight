const colorScores = () => {
  const polScore = Number(document.querySelector('#pol-score').dataset.score)
  const moonScore = Number(document.querySelector('#moon-score').dataset.score)
  const astroScore = Number(document.querySelector('#astro-score').dataset.score)
  const cloudScore = Number(document.querySelector('#cloud-score').dataset.score)

  if (polScore < 5) {
    document.querySelector('#pol-score').classList.add('red');
  } else if (polScore > 8) {
    document.querySelector('#pol-score').classList.add('green');
  } else {
    document.querySelector('#pol-score').classList.add('orange');
  }

  if (moonScore < 5) {
    document.querySelector('#moon-score').classList.add('red');
  } else if (moonScore > 8) {
    document.querySelector('#moon-score').classList.add('green');
  } else {
    document.querySelector('#moon-score').classList.add('orange');
  }

  if (astroScore < 5) {
    document.querySelector('#astro-score').classList.add('red');
  } else if (astroScore > 8) {
    document.querySelector('#astro-score').classList.add('green');
  } else {
    document.querySelector('#astro-score').classList.add('orange');
  }

  if (cloudScore < 5) {
    document.querySelector('#cloud-score').classList.add('red');
  } else if (cloudScore > 8) {
    document.querySelector('#cloud-score').classList.add('green');
  } else {
    document.querySelector('#cloud-score').classList.add('orange');
  }

}
export {colorScores}
