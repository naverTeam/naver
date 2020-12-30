<%@ page  contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>질문하기</title>
<link href="header.css" rel="stylesheet" type="text/css">
<style>



input[type="radio"] {
    display:none;
}
input[type="radio"]:hover +  label span{
 border:2px solid #40c700;
}
input[type="radio"] + label span {
    display:inline-block;
    width:19px;
    height:19px;
    margin:-2px 10px 0 0;
    vertical-align:middle;
    border:2px solid gray;
    cursor:pointer;
}
input[type="radio"]:checked + label span {
 border:2px solid #40c700;
    background:url(img/check.jpg) top no-repeat;
    background-size: cover;
}
input[type="radio"]:checked + label{
color:#40c700;
font-weight: bold;
}

#body{
background-color: #eee;
}
#title{
margin-left: 100px;
position: relative;
width: 900px;
height: 100%;
background-color:white;
margin: 30px auto;
border: 1px solid #aaa;
}
#titletext{
width: 590px;
height: 40px;
 position: absolute;
    top: 70px;
    left: 220px;
    border: 2px solid #888;
    
}
#titletext:focus {
	border: 2px solid #40c700;
	outline: none;
}
#textarea{
margin-left: 100px;
margin-top: 30px;
}
#ta{
background-color: aliceblue;
border: 2px solid #888;

}
#ta:focus{
border: 2px solid #40c700;
outline: none;
}
#next{
color:#40c700;
width: 100px;
height: 50px;
background-color:white;
border: 2px solid #777;
 border-radius: 7px;
 position: absolute;
 top:800px;
 left:900px;
 cursor: pointer;
}
#next:hover{
background-color: aliceblue;
}
#tag{
border: 1px solid #888;
width: 720px;
height: 100px;
display:none;
}
#tag:hover{
border: 2px solid #40c700;
}
#taglabel{
margin-left:20px;
font-weight: bold;
font-size: 20px;
}
#tagtext{
margin-top:30px;
width: 400px;
height: 30px;
}
#add{
background-color: white;
border: 1px solid #ccc;
width:80px;
height: 40px;
outline: none;
cursor: pointer;
}
#point{
border: 1px solid #888;
width: 720px;
height: 100px;
margin-top: 50px;
display:none;
}
#point:hover{
border: 2px solid #40c700;
}
#pointlabel{
margin-left:20px;
font-weight: bold;
font-size: 20px;
}
#pointtext{
margin-top:30px;
width: 400px;
height: 30px;
}
#addpoint{
background-color: white;
border: 1px solid #ccc;
width:80px;
height: 40px;
outline: none;
cursor: pointer;
}
#directory{
border: 1px solid #888;
width: 720px;
height: 310px;
margin-top: 50px;
display:none;
}
#directory:hover{
border:2px solid #40c700;
}
#directory label{
font-size: 20px;
}
#directory label:hover{
color:#40c700;
font-weight:bold;
}
#directory label:focus{
color:red;
}
radio:hover{
background-color: red;
}
#submit{
color:#40c700;
width: 100px;
height: 50px;
background-color:white;
border: 2px solid #777;
 border-radius: 7px;
 display:block;
 cursor: pointer;
 margin-left: 300px;
 margin-top: 50px;
 margin-bottom: 50px;
 display:none;
}
#submit:hover{
background-color: aliceblue;
}

#s1{float:left;width:33%;margin-left: 10px;margin-top: 20px;}
#s2{float:left;width:33%;margin-top: 20px;}
#s3{float:left;width:30%;margin-top: 20px;}
.filebox input[type="file"] {
 /* 파일 필드 숨기기 */ position: absolute;
  width: 1px; height: 1px; padding: 0;
   margin: -1px; overflow: hidden;
    clip:rect(0,0,0,0); border: 0; }
    
.filebox label {
 display: inline-block;
 padding: .5em .75em;
 color: #40c700; font-size: inherit;
 line-height: normal;
 vertical-align: middle;
 background-color: #fdfdfd;
 cursor: pointer;
 border: 2px solid #777;
 margin-bottom:120px;
 border-radius: .25em; }
 
 .filebox label:hover{
 background-color: aliceblue;
 }
.filebox .upload-name {
 display: inline-block;
 padding: .5em .75em;
 /* label의 패딩값과 일치 */ font-size: inherit;
 font-family: inherit;
 line-height: normal;
 vertical-align: middle;
 background-color: #f5f5f5;
 border: 1px solid #ebebeb;
 border-bottom-color: #e2e2e2;
 border-radius: .25em;
 -webkit-appearance: none;
 /* 네이티브 외형 감추기 */ -moz-appearance: none;
 appearance: none; 
  margin-bottom:120px;}

</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	var fileTarget = $('.filebox .upload-hidden');
	
	fileTarget.on('change', function(){ // 값이 변경되면
		if(window.FileReader){ // modern browser
			var filename = $(this)[0].files[0].name;
		} else { // old IE
			var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
			}
	// 추출한 파일명 삽입
	$(this).siblings('.upload-name').val(filename);
	});
	});
function next() {
	var e = document.getElementById("next");
	e.style.display = 'none';
	var e = document.getElementById("tag");
	e.style.display = 'block';
	var e = document.getElementById("directory");
	e.style.display = 'block';
	var e = document.getElementById("point");
	e.style.display = 'block';
	var e = document.getElementById("submit");
	e.style.display = 'block';
}
function dir(id) {
	var e = document.getElementById(id);
	e.style.color = '#40c700';
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="body">
<form id="Frm" method="post" action="question" enctype="multipart/form-data">
<hr style="margin-top:0px;margin-bottom: 20px;">
<div id="title">
<div>
<img  src="img/question.png" style="width: 40px;height: 40px;margin-top: 70px;
margin-left:100px;border-radius: 10px;">
<a style="font-size: 23px;color:#40c700;font-weight: 900;">질문</a>
<input type="text" name="title" id="titletext">
</div>
<div id="textarea">
<textarea id="ta" rows="25" cols="99"
 name="content" placeholder=" 
    
    궁금한 내용을 질문해 주세요."></textarea><br>

<div class="filebox"> 
<input type="text" class="upload-name" value="파일선택" disabled="disabled">
<label for="ex_filename">업로드</label> 
<input type="file" id="ex_filename" class="upload-hidden">
</div>

<div id="tag">
<a id="taglabel">태그</a> <input type="text" id="tagtext">
<input type="button" value="추가" id="add">
</div>

<div id="directory">
<h2 style="margin-left: 30px;">카테고리</h2>
<hr style="width: 80%;height: 3px;">
<span id="s1">
<input type="radio" id="1" name="directory" value="교육,학문" name="directory">
<label for="1" id="l1"><span></span>교육,학문</label><br>
<input type="radio" id="2" name="directory" value="컴퓨터통신" name="directory">
<label for="2"><span></span>컴퓨터통신</label><br>
<input type="radio" id="3" name="directory" value="게임" name="directory">
<label for="3"><span></span>게임</label><br>
<input type="radio" id="4" name="directory" value="엔터테이먼트,예술" name="directory">
<label for="4"><span></span>엔터테이먼트,예술</label><br>
<input type="radio" id="5" name="directory" value="생활" name="directory">
<label for="5"><span></span>생활</label><br>
<input type="radio" id="6" name="directory" value="건강" name="directory">
<label for="6"><span></span>건강</label><br>
<input type="radio" id="7" name="directory" value="사회,정치" name="directory">
<label for="7"><span></span>사회,정치</label><br>
</span>
<span id="s2">
<input type="radio" id="8" name="directory" value="경제" name="directory">
<label for="8"><span></span>경제</label><br>
<input type="radio" id="9" name="directory" value="여행" name="directory">
<label for="9"><span></span>여행</label><br>
<input type="radio" id="10" name="directory" value="스포츠,레저" name="directory">
<label for="10"><span></span>스포츠,레저</label><br>
<input type="radio" id="11" name="directory" value="쇼핑" name="directory">
<label for="11"><span></span>쇼핑</label><br>
<input type="radio" id="12" name="directory" value="연애,결혼" name="directory">
<label for="12"><span></span>연애,결혼</label><br>
<input type="radio" id="13" name="directory" value="자동차" name="directory">
<label for="13"><span></span>자동차</label><br>
<input type="radio" id="14" name="directory" value="직업,취업" name="directory">
<label for="14"><span></span>직업,취업</label><br>
</span>
<span id="s3">
<input type="radio" id="15" name="directory" value="안드로이드폰" name="directory">
<label for="15"><span></span>안드로이드폰</label><br>
<input type="radio" id="16" name="directory" value="사람과 그룹" name="directory">
<label for="16"><span></span>사람과 그룹</label><br>
<input type="radio" id="17" name="directory" value="대학 입시,진학" name="directory">
<label for="17"><span></span>대학 입시,진학</label><br>
<input type="radio" id="18" name="directory" value="자동차구입" name="directory">
<label for="18"><span></span>자동차구입</label><br>
<input type="radio" id="19" name="directory" value="모바일게임" name="directory">
<label for="19"><span></span>모바일게임</label><br>
<input type="radio" id="20" name="directory" value="영어 공부,시험" name="directory">
<label for="20"><span></span>영어 공부,시험</label><br>
<input type="radio" id="21" name="directory" value="스마트폰" name="directory">
<label for="21"><span></span>스마트폰</label><br>
</span>
</div>

<div id="point">
<a id="pointlabel">추가내공</a> <input type="text" id="pointtext" name="point" placeholder="현재 보유내공 : 60">
<input type="button" value="추가" id="addpoint">
</div>

<input type="submit" id="submit" value="질문하기">
</div><!-- title -->
</form>
</div><!-- body -->
<button id="next" onclick="next()">다음</button>









<!-- my menu -->
<span id="menutable" style="display:none" >
	<table>
	<tr>
	<th colspan="4" align="left" height="10px" width="280px">
	My Menu</th>
	</tr>
		<tr>
			<td>카페</td>
			<td>블로그</td>
			<td>메일</td>
			<td>쇼핑</td>
		</tr>
		<tr>
			<td>뉴스</td>
			<td>지도</td>
			<td>포스트</td>
			<td>증권</td>
		</tr>
		<tr>
			<td>웹툰</td>
			<td>영화</td>
			<td>사전</td>
			<td>부동산</td>
		</tr>
		<tr>
			<td>게임</td>
			<td>날씨</td>
			<td>책</td>
			<td>스포츠</td>
		</tr>
	</table>
</span>
<%@ include file="footer.jsp" %>
</body>
</html>