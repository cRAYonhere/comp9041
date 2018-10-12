(function() {
   'use strict';
   // write your code here
   const OUTPUT = document.querySelector("#output");   	
     
   function refreshTime(){

      var dateObject = new Date();

      OUTPUT.innerHTML = dateObject.getHours()+":"+dateObject.getMinutes+":"+dateObject.getSeconds();
   }   
   var interval = setInterval(refreshTime,1000);
   
   
}());
