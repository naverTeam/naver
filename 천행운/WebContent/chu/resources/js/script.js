/**
 * 
 */

function check() {
		if(document.searchFrm.keyWord.value==""){
			alert("keyWord is Empty");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
}
