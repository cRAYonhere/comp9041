(function () {
   'use strict';
   function createNode(element){
      return document.createElement(element);
   }

   function append(parent, el){
      return parent.appendChild(el);
   }

   var deets;
   var infoClass = document.querySelector("#information");
   const url = 'http://127.0.0.1:8081/labs/lab12/tabs/planets.json'
   
   fetch(url)
   .then((resp) => resp.json())
   .then(function(data){
      //console.log(data);
      deets = data;
   })
   .catch(function(error) {
      console.log(error)
   })
   
   
   document.addEventListener('click', function (event){
      if(event.target.classList.contains("nav-link")){
         
         var tabClass = document.querySelectorAll(".nav-link");
         for(var i = 0; i < tabClass.length; i++){
            if(tabClass[i].className.includes("active")){
               tabClass[i].className="nav-link";
            }
         }

         var tabId = event.target.getAttribute('id');
         var tab = document.getElementById(tabId);
         var planet = tab.innerHTML;
         var className = tab.className;
         tab.className = className + " active";
         //console.log(planet);
         infoClass.getElementsByTagName('h2')[0].innerHTML= planet;
         var ul = infoClass.getElementsByTagName('ul');

         for(var j = 0; j < deets.length; j++){
            if(deets[j].name==planet){
               infoClass.getElementsByTagName('p')[0].innerHTML = deets[j].details;
               ul[0].innerHTML = "";
               var info = deets[j].summary;
               //console.log(info);
   
               var result = Object.keys(info).map(function(key) {
                  return [key, info[key]];
               });
               //console.log(result);
               console.log(result.length);
               for(var k = 0; k < result.length; k++){
                  let li = createNode('li');
                  let b = createNode('b');
         
                  b.innerHTML = result[k][0]+": ";
                  append(li,b);
                  li.innerHTML += result[k][1];
         
                  append(ul[0],li); 
               }
            }
         }
      }
   });
}());
