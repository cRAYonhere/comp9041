(function () {
   'use strict';
   function createNode(element) {
      return document.createElement(element);
   }
   
   function append(parent, el) {
      return parent.appendChild(el);
   }

   function postsFunc(user, posts, ulPosts) {
      //console.log(posts);
      for(var i = 0; i < posts.length; i++){
         if(user.id == posts[i].userId){
            let li = createNode('li');
            li.innerHTML = posts[i].title;
            append(ulPosts,li);
         }
      }  
         
   }

   const ulOutput = document.getElementById('output');
   ulOutput.style="width: 100%; display: flex; align-items: initial; justify-content: center";
   
   const urlUsers = 'https://jsonplaceholder.typicode.com/users';
   const urlPosts = 'https://jsonplaceholder.typicode.com/posts';
   
   var posts;
   fetch(urlPosts)
   .then((resp) => resp.json())
   .then(function(data){
      posts = data;
      //console.log(posts);
   })
   .catch(function(error) {
      console.log(error);
   })

   fetch(urlUsers)
   .then((resp) => resp.json())
   .then(function(data) {
      for(var i = 0; i < data.length; i++){
         
         let divUser = createNode('div');
         divUser.classList.add('user');
 
         let h2 = createNode('h2');
         let p = createNode('p');
         let ulPosts = createNode('ul');
         ulPosts.classList.add('posts');

         //console.log(data[i].name,data[i].company.catchPhrase);
         
         h2.innerHTML = `${data[i].name}`;
         p.innerHTML = `${data[i].company.catchPhrase}`;
         
         //console.log(posts); 
         postsFunc(data[i],posts,ulPosts);

         append(divUser,h2);
         append(divUser,p);
         append(divUser,ulPosts);
         append(ulOutput, divUser);
         
      }
   })   
   
}());
