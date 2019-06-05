// import $ from 'jquery';

const modalFade = () => {
  const modal = document.querySelector('.modal');
  if (modal) {
    const showModal = document.querySelector('.show-modal')
    showModal.addEventListener('click', () => {
    modal.style.display = "block";
    });

    document.querySelector('.close-modal').addEventListener('click', () => {
      modal.classList.add("fade-out");
    });
  }
}

export { modalFade };
