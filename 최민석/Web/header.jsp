<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>네이버 지신</title>
<style>

.naver{
cursor:pointer;
border:0;
outline:0;
width:90px;height:30px;
background: url("naver2.png");
background-size:90px 30px;
margin-left: 300px;
margin-top:30px;
}
.in{
cursor:pointer;
border:0;
outline:0;
width:70px;height:30px;
background: url("naver.png");
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
.search{
cursor:pointer;
border:0;
outline:0;
width:35px;
height:27px;
 position: absolute;
    top: 42px;
    left: 650px;
background: url("search.png");
background-size:35px 27px;
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
background: url("menubar.png");
background-size:30px 30px;
 position: absolute;
    top: 46px;
    left: 1560px;
}
</style>
</head>
<body>
<form>
<input type="button" class="naver" onclick="location.href='naver.com' ">
<input type="button" class="in" onclick="location.href='naverin.jsp' ">
<input type="text" class="text" style="margin-top: 30px">
<input type="button" class="search">
<button class="login">로그인</button>
<input type="button" class="menubar">
</form>
<hr style="margin-top: 20px; border-color:rgb(255,255,255); opacity: 0.3;" >

</body>
</html>