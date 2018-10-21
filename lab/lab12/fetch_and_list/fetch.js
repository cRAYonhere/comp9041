(function () {
   'use strict';
   function createNode(element) {
      return document.createElement(element);
   }
   
   function append(parent, el) {
      return parent.appendChild(el);
   }
   const ul = document.getElementById('output');
   //ul.style="width: 100%; display: flex; align-items: initial; justify-content: center";
   fetch('https://jsonplaceholder.typicode.com/users')
   .then((resp) => resp.json())
   .then(function(data) {
      for(var i = 0; i < data.length; i++){
         let div = createNode('div'); 
         let h2 = createNode('h2');
         let p = createNode('p');
         if(i%2 == 0){
            div.style="width: 50%; align-items: left;";
         } 
         else{
            div.style="width: 50%; align-items: right;";
         }
         //console.log(data[i].name,data[i].company.catchPhrase);
         
         h2.innerHTML = `${data[i].name}`;
         p.innerHTML = `${data[i].company.catchPhrase}`;
         
         append(div,h2);
         append(div,p);
         append(ul, div);
      }
   })   
   
}());
