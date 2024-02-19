function setThumbnail(event) {
	let fr = new FileReader();
	 
	fr.onload = event => {
		let img = document.getElementById("fileview");
	 	img.setAttribute("src",event.target.result);
	}
	fr.readAsDataURL(event.target.files[0]);
}


function check(form){
	if(!form.name.value.trim()){
		alert("차량의이름을 입력해주세요");
		form.name.focus();
		return;
	}
	if(form.category.value === ""){
		alert("차종을 선택 해주세요");
		return;
	}
	if(!form.price.value.trim()){
		alert("차량의 가격을 입력해주세요");
		form.price.focus();
		return;
	}
	if(form.usepeople.value ===""){
		alert("인승을 선택 해주세요");
		return;
	}
	if(!form.totalQty.value.trim()){
		alert("차량의 수량을 입력해주세요");
		form.totalQty.focus();
		return;
	}
	if(!form.company.value.trim()){
		alert("차량의 제조사를 입력해주세요");
		form.company.focus();
		return;
	}
	if(!form.info.value.trim()){
		alert("차량의 정보를 입력해주세요");
		form.info.focus();
		return;
	}
	let inputImg = document.querySelector("#uploadFile");//업로드한 이미지
	let maxSize = 5 * 1024 * 1024; //5mb
	if(inputImg.size == 0 || inputImg.size > maxSize){
		alert("파일 크기를 확인해주세요.");
		return;
	}
	
	form.submit();
}
