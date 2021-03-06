const initStars = () => {
   var width = $(window).width();
   var height = $(window).height() - 200;
   var star_count = 250;

   var stars = new Array;
   let i
   for ( i=1; i<= star_count; i++ ) {

     var rand_x =  Math.floor((Math.random()*width)+1);
     var rand_y =  Math.floor((Math.random()*height)+1);
     var rand_color = Math.floor((Math.random()*10)+1);
     var speed = Math.floor((Math.random()*6)+1);


     var element = document.createElement('div');
     element.className = "star star-" + rand_color;
     element.style.left = rand_x + "px";
     element.style.top = rand_y + "px";
     element.setAttribute("data-speed", speed);
     document.body.appendChild( element );

     stars[i] = element;
   }

   var interval = setInterval(function(){

     for ( i=1; i<stars.length; i++ ) {

       var left = stars[i].style.left;
       if ( left === "0px" ) {
         stars[i].style.left = (width) + "px";
       } else {
         stars[i].style.left = parseInt( left ) - stars[i].getAttribute("data-speed") + "px";
       }
     }
   },1000/60);

   setTimeout(function() {
    clearInterval(interval);
    var allstars = document.querySelectorAll('.star')
    allstars.forEach((element) => {
    element.style.visibility = "hidden";
});
   }, 15000)
}

export { initStars }
