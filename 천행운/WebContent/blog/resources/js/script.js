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

function previewBanner(event) {
	var reader = new FileReader();
	
	reader.onload = function(event){
		var banner = document.getElementById("bannerImg");
		banner.removeAttribute("style");
		banner.setAttribute("style", "background-image: url('"+event.target.result+"')");
		
	};
	reader.readAsDataURL(event.target.files[0]);
}

function previewProfile(event) {
	var reader = new FileReader();
	
	reader.onload = function(event){
		var banner = document.getElementById("profileImg");
		banner.removeAttribute("style");
		banner.setAttribute("style", "background-image: url('"+event.target.result+"')");
		
	};
	reader.readAsDataURL(event.target.files[0]);
}