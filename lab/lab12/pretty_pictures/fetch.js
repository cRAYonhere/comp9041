(function () {
   'use strict';
   
   function createNode(element) {
      return document.createElement(element);
   }

   function append(parent, el) {
      return parent.appendChild(el);
   }
	


	function fetchImages(divIdOutput,url){
		var fetches = [];
		for(var i = 0; i < 5; i++){
			fetches.push(
				fetch(url)
				.then((resp) => resp.blob())
				.then(function(data) {
					let divImg = createNode('div');
					divImg.style.display="none";
					let img = createNode('img');
					let p = createNode('p');
					var dateObject = new Date();
					p.innerHTML="Fetched at "+dateObject.getHours() +":"+ dateObject.getMinutes();
					var objectURL = URL.createObjectURL(data);
					divImg.classList.add('img-post');
					img.src = objectURL;
					append(divImg, img);
					append(divImg, p);           
					append(divIdOutput,divImg);
				})
			)
		}
		return fetches;
	}
	
	const divIdOutput = document.getElementById('output');
	const url = 'https://cataas.com/cat';
	divIdOutput.style="width: 100%; display: flex; align-items: center; justify-content: center";
	document.addEventListener('click', function(event) {
		if(event.target.classList.contains("btn-success")){
			var fetches = fetchImages(divIdOutput,url);
			divIdOutput.innerHTML= '';
			let p = createNode('p');
			p.innerHTML = "Waiting for catass...";
			append(divIdOutput,p);
			Promise.all(fetches).then(function(){
				p.style.display="none";
				var imgDiv = divIdOutput.getElementsByClassName("img-post");
				console.log(imgDiv.length);
				for(var i = 0; i < imgDiv.length; i++){
					imgDiv[i].style.display="";
				}
			});
		}
	});
	
	
}());
