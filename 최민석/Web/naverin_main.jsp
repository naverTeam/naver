<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>네이버 지식iN</title>
<style>

.naver{
cursor:pointer;
border:0;
outline:0;
width:90px;height:30px;
background: url("img/naver2.png");
background-size:90px 30px;
margin-left: 300px;
margin-top:30px;
}
#toon{
border:0;
outline:0;
width:170px;height:40px;
background: url("img/toon.png");
background-size:170px 40px;
 position: absolute;
  top: -161px;
    left: 146px;
}
#reserv{
border:0;
outline:0;
width:170px;height:40px;
background: url("img/reserv.png");
background-size:170px 40px;
 position: absolute;
  top: -161px;
    left: 146px;
}
#pay{
border:0;
outline:0;
width:170px;height:40px;
background: url("img/pay.jpg");
background-size:170px 40px;
 position: absolute;
     top: -161px;
    left: 146px;
}
#nain{
border:0;
outline:0;
width:160px;height:40px;
background: url("img/nain.jpg");
background-size:160px 40px;
 position: absolute;
    top: -161px;
    left: 156px;
}
.in{
cursor:pointer;
border:0;
outline:0;
width:70px;height:30px;
background: url("img/naver.png");
background-size:70px 30px;
}
.text{
width:200px;
height:25px;
border-color: #00d205;
 position: absolute;
    top: 10px;
    left: 480px;
        border-style: solid;
     outline-color :#00d205  !important;
     outline-style: solid;
}
.text:focus{
border-color:#00d205;
}
.search{
cursor:pointer;
border:0;
outline:0;
width:35px;
height:27px;
 position: absolute;
    top: 42px;
    left: 650px;
background: url("img/search.png");
background-size:35px 27px;
}
#loginset{
position : relative;
}
.login{
cursor:pointer;
border:1;
outline:none;
border-color:#BBBBBB;
width:70px;
height:30px;
margin-left: 1000px;
background-color: white;
border-style: solid;
}
.menubar{
cursor:pointer;
border:0;
outline:0;
width:30px;height:30px;
background: url("img/menubar.png");
background-size:30px 30px;
 position: absolute;
    top: -5px;
    left: 1080px;
}
.submenubar{
margin-left: 260px;
margin-top:0px;
border-spacing:40px 0px;
}
.td{
color:#666666;
margin-left: 50px;
padding-bottom: 15px;
padding-top:15px;
border-bottom:3px solid white;
}
.td:hover{
border-bottom:3px solid #00d205;
cursor:pointer;
color: #00d205;
}
hr{
background-color: #dddddd;
height:1px;
border:0px;
}
#tdbtn{
position : relative;
}
#write{
cursor:pointer;
border:0;
outline:0;
width:30px;
height:30px;
position: absolute;
    top: 11px;
    left: 6px;
background: url("img/write.png");
background-size:30px 30px;
}
#naver1{
cursor:pointer;
border:0;
outline:0;
width:70px;height:20px;
background: url("img/naver2.png");
background-size:70px 20px;
padding-top: 20px;
}
.test{
border:0;
outline:0;
background:url('img/main.png');
width:100%;
height:700px;
background-size:100% 700px;
}
#footer{
color: #cccccc;
}
.footerText{
color:#444444;
}
.footerText:hover{
color:#40c700;
cursor: pointer;
text-decoration: underline;
}
video#bgvid {
width: 316px;
   border-radius: 30px;
    }
#content{
 background-color: #BBBBBB;
 }
.relative{
position : relative;
}
#margin{
 margin-left: 300px;
 }
</style>
</head>

<!--메인 배너-->
<form>
<div>
<input type="button" class="naver" onclick="location.href='naver.com' ">
<input type="button" class="in" onclick="location.href='naverin.jsp' ">
<input type="text" class="text" style="margin-top: 30px">
<input type="submit" class="search" value="">
<span id="loginset">
<button class="login">로그인</button>
<input type="button" class="menubar">
</span>
<hr style="margin-top: 20px;margin-bottom:0px;">
</div>
</form>

<!--메뉴바 -->
<div>
<table class="submenubar">
	<tr>
		<td class="td" align="center" width="20px">홈</td>
		<td class="td" align="center" width="40px">Q&A</td>
		<td class="td" align="center" width="70px">답변하기</td>
		<td class="td" align="center" width="50px">베스트</td>
		<td class="td" align="center" width="90px">명예의 전당</td>
		<td style="border-left: 1px solid #cccccc;"></td>
		<td class="td" align="center" width="50px">프로필</td>
		<td width="500px"></td>
		<td id="tdbtn" align="right" width="100px" style="padding-right:25px;
		background-color:#40c700;color:white;cursor:pointer;">
		<button id="write"></button>질문하기</td>
	</tr>
</table>
</div>

<hr style="margin-top:0px">

<div id="content">
<span class="relative" id="margin">
<video autoplay loop muted  id="bgvid">
        <source src="img/read.mp4" type="video/mp4">
    </video>
    <button id="nain"></button>
    </span>
    
  <span class="relative">  
<video autoplay loop muted  id="bgvid">
        <source src="img/toon.mp4" type="video/mp4">
    </video>
<button id="toon"></button>
</span>

<span class="relative">
<video autoplay loop muted  id="bgvid">
        <source src="img/reserv.mp4" type="video/mp4">
    </video>
<button id="reserv"></button>
</span>

<span class="relative">
<video autoplay loop muted  id="bgvid">
        <source src="img/food.mp4" type="video/mp4">
    </video>
<button id="pay"></button>
</span>

</div>
<footer>
<hr>
	<br><span id="footer" style="margin-left: 550px;font-size: 14px;">
	<a class="footerText">네이버 이용약관</a> &nbsp;&nbsp;&nbsp;|
	&nbsp;&nbsp;&nbsp;<a class="footerText"> 지식iN 서비스</a> &nbsp;&nbsp;&nbsp;|
	&nbsp;&nbsp;&nbsp; <a class="footerText">운영정책개인정보 </a>&nbsp;&nbsp;&nbsp;| 
	&nbsp;&nbsp;&nbsp;<a class="footerText">처리방침게시중단요청서비스</a>&nbsp;&nbsp;&nbsp; |
	&nbsp;&nbsp;&nbsp;<a class="footerText"> 지식iN 고객센터</a>
	</span>
	<br><br>
	<span align="center" style="font-size:12px;display: flex;margin-left: 750px; ">
	<button id="naver1"></button>
	 &nbsp;Copyright  &nbsp; <strong>NAVER Corp.</strong>  &nbsp;All Rights Reserved.</span>
	<br><br><br>
</footer>
</html>