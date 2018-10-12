(function() {
   'use strict';
   // TODO: Write some js

   document.addEventListener('click', function (event) {
      /*
         1. Listen to every click event in document
         2. If material-icons clicked then trigger action
         3. get the id of which material icon was clicked as generate content id
         4. use content id to get content object
         5. check state of content object
         6. toggle accordingly
      */

      
      if( event.target.classList.contains("material-icons") ){

         var clickedIconId = "#" + event.target.getAttribute('id'); 
         var relatedContentId = clickedIconId + "-content";
         var INFO = document.querySelector(relatedContentId);
         var state = INFO.style.visibility;
         var ICON = document.querySelector(clickedIconId);
         if (state != 'hidden'){
            INFO.style.visibility = 'hidden';
            ICON.innerHTML = "expand_more";
         } else if (state != 'visible'){
            INFO.style.visibility = 'visible';
            ICON.innerHTML = "expand_less";
         }

      }

   });
   
}());
