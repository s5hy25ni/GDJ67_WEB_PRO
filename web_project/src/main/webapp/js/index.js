/**
 * 
 */

document.addEventListener("DOMContentLoaded", function(){
	cardNewsRight();
	setInterval(cardNewsRight, 2000);
});

var cnt = 0;
var arr=[6, 3, 3, 5,3];

function cardNewsLeft(){
	var center = document.getElementById("center");
	center.innerHTML="";
	
	cnt--;
	if(cnt<1){
		cnt=5;
	}

	for(let i=0; i<arr[cnt-1]; i++){
		var cardNews = document.createElement("div");
		var img = document.createElement("img");
		var src ="./img/cardnews"+(cnt)+"/"+(i+1)+".jpg"; 
		
		cardNews.setAttribute("class", "cardNews");
		img.setAttribute("src", src);
		cardNews.appendChild(img);
		center.appendChild(cardNews);
	}	
}

function cardNewsRight(){
	var center = document.getElementById("center");
	center.innerHTML="";
	
	cnt++;
	
	if(cnt>5){
		cnt=1;
	}

	for(let i=0; i<arr[cnt-1]; i++){
		var cardNews = document.createElement("div");
		var img = document.createElement("img");
		var src ="./img/cardnews"+(cnt)+"/"+(i+1)+".jpg"; 
		
		cardNews.setAttribute("class", "cardNews");
		img.setAttribute("src", src);
		cardNews.appendChild(img);
		center.appendChild(cardNews);
	}	
}
