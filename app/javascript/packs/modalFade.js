import $ from 'jquery';

const modalFade = () => {
  const modal = $('.modal');
  $('.show-modal').click(function() {
   modal.fadeIn();
  });

  $('.close-modal').click(function() {
   modal.fadeOut();
  });
}

export { modalFade };
