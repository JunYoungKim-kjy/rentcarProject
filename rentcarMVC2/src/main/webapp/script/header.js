const $header = document.getElementById("header");
window.addEventListener('scroll', ()=>{
	if(window.scrollY > 5){
		$header.classList.add("fix");
	}else{
		$header.classList.remove("fix");
	}
});