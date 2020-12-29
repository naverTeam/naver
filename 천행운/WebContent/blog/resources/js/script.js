/*��ӳ�Ʈ*/


/*�˻�*/
function check() {
		if(document.searchFrm.keyWord.value==""){
			alert("keyWord is Empty");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
}

function overlaySleep() {
	document.getElementById("overlay").style.display="none";
}

var count = 2;
function addCategory() {
	
	addFrm = document.getElementById("categorys");
	
	addedDiv = document.createElement("div");
	addedDiv.setAttribute("class","pCategory"+count);
	
	addedInput = document.createElement("input");
	addedInput.setAttribute("class","cateChange");
	addedInput.setAttribute("name","category");
	addedInput.setAttribute("placeholder","새 카테고리");
	
	addedBtn = document.createElement("input");
	addedBtn.type = "button";
	addedBtn.setAttribute("onclick","delCategory()");
	addedBtn.setAttribute("value","삭제");
	
	addFrm.appendChild(addedDiv);
	addedDiv.appendChild(addedInput);
	addedDiv.appendChild(addedBtn);
	
	count++;
}

function delCategory() {
	var p = this.parentElement;
	p.remove;
}