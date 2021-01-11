


function inputCheck(){

	f=document.sallForm;
	if(f.ordPhone.value.trim() ==""){
		alert("주문하시는분 전화번호를 입력해주세요.");
		f.ordPhone.focus();
		return;
	}
	
	if(f.payMe.value.trim()==""){
		alert("결재방법을 입력해주세요.");
		f.payMe.focus();
		return;
	}
	
	if(f.payName.value.trim()==""){
		alert("입금자 또는 카드 명의자 이름을 입력해주세요");
		f.payName.focus();
		return;
	}
	if(f.payName.value.trim()==""){
		alert("이메일주소를 입력해주세요");
		f.email.focus();
		return;
	}
	
	if(f.zipcode.value.trim()==""){
		alert("우편번호를 입력해주세요");
		f.zipcode.focus();
		return;
	}
	
	
	if(f.devAd1.value.trim()==""){
		alert("주소를 입력해주세요");
		f.devAd1.focus();
		return;
	}
	
	if(f.devAd3.value.trim()==""){
		alert("상세주소를  입력해주세요");
		f.devAd3.focus();
		return;
	}

	if(f.devNa.value.trim()==""){
			alert("받는사람 이름을 입력해주세요");
			f.devNa.focus();
			return;
		}
	if(f.devPhone.value.trim()==""){
			alert("받는사람 전화번호 입력해주세요");
			f.devPhone.focus();
			return;
		}
		
	f.czipcode.value = document.getElementById('zipcode').value;
	f.cdevAd1.value = document.getElementById('devAd1').value;
	f.cdevAd2.value = document.getElementById('devAd2').value;
	f.cdevAd3.value = document.getElementById('devAd3').value;
	
//	alert(f.postcode.value);
//	alert(f.address.value);
//	alert(f.extraAddress.value);
//	alert(f.detailAddress.value);	

	f.submit();

	
}





function win_close(){
	self.close();
}


//Product
	function productDetail(proNum) {
		document.detail.proNum.value=proNum;
		document.detail.submit();
	}

//saller
	function sallerInfo(){
		document.frmsaller.submit();
	}
	
//Cart
	function cartUpdate(form){
		form.flag.value="update"
		form.submit();
	}
	
	function cartDelete(form) {
		form.flag.value="delete";
		form.submit();
	}

//OrderList


function execPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			var addr = '';
			var extraAddr = '';
			if (data.userSelectedType === 'R') {
				addr = data.roadAddress;
			} else {
				addr = data.jibunAddress;
			}
			if(data.userSelectedType === 'R'){
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					extraAddr += data.bname;
				}
				if(data.buildingName !== '' && data.apartment === 'Y'){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				if(extraAddr !== ''){
					extraAddr = ' (' + extraAddr + ')';
				}
					document.getElementById("devAd2").value = extraAddr;
			} else {
				document.getElementById("devAd2").value = '';
			}
			document.getElementById('zipcode').value = data.zonecode;
			document.getElementById("devAd1").value = addr;
			document.getElementById("devAd3").focus();
		}
	}).open();
}


