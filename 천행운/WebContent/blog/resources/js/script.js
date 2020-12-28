/*써머노트*/


/*검색*/
function check() {
		if(document.searchFrm.keyWord.value==""){
			alert("keyWord is Empty");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
}
