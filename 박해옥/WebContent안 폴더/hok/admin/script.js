	function inputCheck(){

	f=document.proForm;
	if(f.proName.value.trim() ==""){
		alert("��ǰ�̸���  �Է����ּ���.");
		f.proName.focus();
		return;
	}
	
	if(f.price.value.trim()==""){
		alert("��ǰ������ �Է����ּ���.");
		f.price.focus();
		return;
	}
	
	if(f.proAm.value.trim()==""){
		alert("��ǰ������ �Է����ּ���");
		f.proAm.focus();
		return;
	}
	if(f.id.value.trim()==""){
		alert("id�� �Է����ּ���");
		f.id.focus();
		return;
	}
	
	if(f.email.value.trim()==""){
		alert("�̸��� �ּҸ� �Է����ּ���");
		f.email.focus();
		return;
	}
	
	if(f.name.value.trim()==""){
		alert("�Ǹ����̸� �Ǵ� ��ȣ�� �Է����ּ���");
		f.name.focus();
		return;
	}
	
	
	if(f.zipcode.value.trim()==""){
		alert("�����ȣ�� �Է����ּ���");
		f.zipcode.focus();
		return;
	}
	
	if(f.devAd1.value.trim()==""){
		alert("�ּҸ� �Է����ּ���");
		f.devAd1.focus();
		return;
	}
		
	if(f.proPhone.value.trim()==""){
			alert("�Ǹ��� ��ȭ��ȣ�� �Է����ּ���");
			f.proPhone.focus();
			return;
		}
	if(f.bankNa.value.trim()==""){
			alert("������� �Է����ּ���");
			f.bankNa.focus();
			return;
		}
		
	if(f.accNo.value.trim()==""){
			alert("���¹�ȣ�� �Է����ּ���");
			f.accNo.focus();
			return;
		}	
	
	if(f.accHo.value.trim()==""){
			alert("������ �̸��� �Է����ּ���");
			f.accHo.focus();
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


	

//product 

	function productDetail(proNum) {
		document.detail.proNum.value=proNum;
		document.detail.submit();
	}

	function productDelete(proNum) {
		document.del.proNum.value=proNum;
		document.del.submit();
	}

	function productUpdate(proNum){
		document.update.proNum.value=proNum;
		document.update.submit();
	}


//order

	function orderDetail(ordNum){
		document.detail.ordNum.value=ordNum;
		document.detail.submit();	
	}
	
	function orderUpdate(form){
		form.flag.value="update"
		form.submit();
	}
	
	function orderDelete(form) {
		form.flag.value="delete";
		form.submit();
	}
	

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
				if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
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

//order end