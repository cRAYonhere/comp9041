(function() {
   'use strict';
   var OUTPUT = document.querySelector("#output");
   
   function hideClass(){
      OUTPUT.classList.toggle("hide");
   }

   var hideMe = setInterval(hideClass, 2000);
}());
