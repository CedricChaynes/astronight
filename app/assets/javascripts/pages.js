 $(document).ready(() => {
   let messages = $('#chatbox');

   const init = {
     messages.scrollTop(messages[0].scrollHeight);
   }

 window.setTimeout(init, 50);
});
