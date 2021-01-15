<%@page import="member.MemberBean"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="in.QuestionMgr" />
<jsp:useBean id="bean" class="member.MemberBean" />
<%
if(session.getAttribute("id")==null){
	response.sendRedirect("../member/login.jsp?returnPage=../in/naver_question.jsp");
}else{
	String id =(String)session.getAttribute("id");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>내 프로필</title>
<link href="header.css" rel="stylesheet" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Bad Script' rel='stylesheet' type='text/css'> 
<style>
.mtd{
background: white;
color:#888;
width: 200px;
height: 50px;
font-weight: bold;
font-size: 23px;
cursor: pointer;
border: 3px solid #40c700;

}
.mtd:hover{
background: #40c700;
color:white;
}
#mtd3{
background: #40c700;
color:white;
}
</style>
<script src="Chart.js"></script>
<script>
</script>
</head>
<body>
<%@ include file="header.jsp" %> 
<div id="body">
<hr style="margin-top:0px;margin-bottom: 0px;">
</div>

<div style="background: #ddd;height: 700px;">
<div style="width: 1000px;height: 700px;background: white;margin: 0px auto;">

<h1 align="center"><%=id %> 님의 프로필</h1>
<hr style="width: 70%;height: 5px;margin-right: 150px;">

<table style="margin-left: 190px;border-spacing: 0px;margin-bottom: 0px;margin-top: 30px;">
<tr align="center">
<td class="mtd" id="mtd3"  >나의 내공</td>
<td class="mtd" onclick="location.href='profile.jsp'">나의 질문</td>
<td class="mtd" onclick="location.href='profile3.jsp'">나의 답변</td></tr>
</table>

<div style="height: 650px;margin-left: 150px;margin-top: 30px;">

<!-- <%bean = mgr.memberRead(id); %>
<h1>나의 내공</h1>
<table>
<tr><td>내공</td><td><%=bean.getInPoint() %>점</td></tr>
<tr><td>랭킹</td><td><%=bean.getGender() %>위</td></tr>
<tr><td>상위</td><td>%</td></tr>
</table>   그래프 구현 -->


</div>
</div>
</div>

<%@ include file="footer.jsp" %>
<%} %>
</body>