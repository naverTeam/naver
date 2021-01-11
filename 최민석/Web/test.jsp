<%@ page  contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>네이버 지식iN</title>
<link href="header.css" rel="stylesheet" type="text/css">
<style>
* { box-sizing: border-box; }
body {
  font: 16px Arial;
}
.autocomplete {
  /*the container must be positioned relative:*/
  position: relative;
  display: inline-block;
}
input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}
input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
}
input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
}
.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}
.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff;
  border-bottom: 1px solid #d4d4d4;
}
.autocomplete-items div:hover {
  /*when hovering an item:*/
  background-color: #e9e9e9;
}
.autocomplete-active {
  /*when navigating through the items using the arrow keys:*/
  background-color: DodgerBlue !important;
  color: #ffffff;
}
</style>

<body>
<form autocomplete="off" action="/action_page.php">
  <div class="autocomplete" style="width:300px;">
    <input id="myInput" type="text" name="myCountry" placeholder="Country">
  </div>
  <input type="submit">
</form>

<script>
var countries = ["Afghanistan","Albania"
,"Algeria","Andorra","Angola",
"Anguilla","Antigua &amp; Barbuda","Argentina"
,"Armenia","Aruba"];
function autocomplete(inp, arr) {
	  /*the autocomplete function takes two arguments,
	  the text field element and an array of possible autocompleted values:*/
	  var currentFocus;
	  /*execute a function when someone writes in the text field:*/
	  inp.addEventListener("input", function(e) {
	      var a, b, i, val = this.value;
	      /*지금 열려있는 목록 삭제*/
	      closeAllLists();
	      if (!val) { return false;}
	      currentFocus = -1;
	      /*값을 포함할 div 생성 */
	      a = document.createElement("DIV");  //목록 div들을 포함하는 부모 div생성
	      a.setAttribute("id", this.id + "autocomplete-list"); //mylnput autocomplete-list
	      a.setAttribute("class", "autocomplete-items");
	      this.parentNode.appendChild(a);     //텍스트필드의 자식으로 부모div를 추가하기
	      //배열중에 검색어로 시작하는 단어가 있는지 검사
	      
	      
	      for (i = 0; i < arr.length; i++) {
	        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
	        	//만약 검색어로 시작하는단어가 있다면 div 생성
	          b = document.createElement("DIV");
	        	//검색어는 볼드
	          b.innerHTML = "# <strong>" + arr[i].substr(0, val.length) + "</strong>";
	          b.innerHTML += arr[i].substr(val.length)
	          //히든으로 인풋 생성
	          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
	          //자식 div를 클릭하면 나타나는 이벤트 생성
	              b.addEventListener("click", function(e) {
					//부모 텍스트필드 밸류 = 자식요소중 인풋태그의 첫번째 밸류 입력하기 
	              inp.value = this.getElementsByTagName("input")[0].value;
				//입력후 모든 목록 제거
	              closeAllLists();
	          });
	          a.appendChild(b);
	        }
	      }
	      
	      
	  });
	  
	  
		//텍스트필드 키다운시 이벤트 생성
	  inp.addEventListener("keydown", function(e) {
	      var x = document.getElementById(this.id + "autocomplete-list");  //div를 포함하는 부모 div
	      if (x) x = x.getElementsByTagName("div");
	      if (e.keyCode == 40) {
	        //키보드 화살표 내리면 변수값 증가 40이 내려가는것 
	        currentFocus++;
	        //x라는 변수를 더 잘 보이게 합니다
	        addActive(x);
	      } else if (e.keyCode == 38) { //up
	       //키보드 업 하면 변수값 내림
	        currentFocus--;
	        addActive(x);
	      } else if (e.keyCode == 13) {
	    	  //엔터를 눌렀을떄 키가 선택되게하고 서브밋을 중단시킨다.
	        e.preventDefault();
	        if (currentFocus > -1) {
	          //마우스 클릭시 
	          if (x) x[currentFocus].click();
	        }
	      }
	  });
		
		
	  function addActive(x) {
	    /*a function to classify an item as "active":*/
	    if (!x) return false;
	    /*start by removing the "active" class on all items:*/
	    removeActive(x);
	    if (currentFocus >= x.length) currentFocus = 0;
	    if (currentFocus < 0) currentFocus = (x.length - 1);
	    /*add class "autocomplete-active":*/
	    x[currentFocus].classList.add("autocomplete-active");
	  }
	  
	  
	  
	  function removeActive(x) {
	    /*a function to remove the "active" class from all autocomplete items:*/
	    for (var i = 0; i < x.length; i++) {
	      x[i].classList.remove("autocomplete-active");
	    }
	  }
	  
	  
	  function closeAllLists(elmnt) {
	    /*모든 자동완성 목록을 삭제한다 
	    인수로 전달된것을 제외하고*/
	    var x = document.getElementsByClassName("autocomplete-items");
	    for (var i = 0; i < x.length; i++) {
	      if (elmnt != x[i] && elmnt != inp) {
	      x[i].parentNode.removeChild(x[i]);
	    }
	  }
	}
	  
	  
	/*문서 클릭시 실행 */
	document.addEventListener("click", function (e) {
	    closeAllLists(e.target);
	});
	}
	
autocomplete(document.getElementById("myInput"), countries);
</script>



</body>