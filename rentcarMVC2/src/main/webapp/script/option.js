function reserve(form){
	if(form.dday.value === ""){
		alert("대여기간을 선택해주세요");
		return;
	}
	form.submit();
}