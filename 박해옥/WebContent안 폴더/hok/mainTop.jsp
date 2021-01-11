

<link href="style.css" rel="stylesheet" type="text/css">
<%@ page pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("id");
	
	String log="";
	if(id == null) log ="<a href=../member/login.jsp?returnPage=../hok/productList.jsp>로그인</a>";
	else log = "<a href=../member/logout.jsp>로그아웃</a>";

	String reg="";
	if(id == null) reg ="<a href=../member/member.jsp>회원가입</a>";
	else reg = "<a href=../member/update.jsp>회원수정</a>";
%>

<div class="mainText" width="75%">Welcome NaverMall</div>

