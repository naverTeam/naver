<%@page import="naver.BlogBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"
				pageEncoding="EUC-KR"%>
<jsp:useBean id="bBean" class="naver.BlogBean"/>
<jsp:useBean id="bMgr" class="naver.BlogMgr"/>				
<%
		request.setCharacterEncoding("EUC-KR");
		String keyWord = request.getParameter("keyWord");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>search</title>
	<link rel="stylesheet" href="./resources/css/style.css">
	<script src="./resources/js/script.js"></script>
</head>
<body>
	<div id="root">
	
		<div id="searchBar-search">
			<a href="index.jsp" style="width: 26px; height: 26px;">
				<img src="./resources/img/logo-sm.png" alt="img" style="margin-right: 20px;">
			</a>
			<div style="border-right: 1px solid #e4e8eb; height: 23px; padding-right: 5px; margin-right: 5px;"></div>
			<form class="searchFrm" name="searchFrm" action="search.jsp">
				<input type="text" name="keyWord" value="<%=keyWord %>" style="width: 533px; height: 40px; border: none;">
				<input type="button" onclick="javascript:check()" style="width: 60px; height: 60px; border: 0;">			 
			</form>
			<div style="margin-left: 350px;">로그인</div>
		</div>
		
		<div id="categoryWrap">
			<div id="categoryBar">
				<div class="category"><a href="search.jsp?keyWord=<%=keyWord%>">통합검색</a></div>
				<div class="category"><a href="search_blog.jsp?keyWord=<%=keyWord%>">블로그</a></div>
				<div class="category">지식인</div>
				<div class="category">쇼핑</div>
				<div class="category"><a><font color="#19ce60"><strong>이미지</strong></font></a></div>
			</div>
		</div>
		
		<div id="container-search-img">
			<div style="width: 270px; height: 180px; border: 1px solid grey;">a</div>
			<div style="width: 270px; height: 180px; border: 1px solid grey;">a</div>
			<div style="width: 270px; height: 180px; border: 1px solid grey;">a</div>
			<div style="width: 270px; height: 180px; border: 1px solid grey;">a</div>
			<div style="width: 270px; height: 180px; border: 1px solid grey;">a</div>
			<div style="width: 270px; height: 180px; border: 1px solid grey;">a</div>
			<div style="width: 270px; height: 180px; border: 1px solid grey;">a</div>
			<div style="width: 270px; height: 180px; border: 1px solid grey;">a</div>
			<div style="width: 270px; height: 180px; border: 1px solid grey;">a</div>
			<div style="width: 270px; height: 180px; border: 1px solid grey;">a</div>
			<div style="width: 270px; height: 180px; border: 1px solid grey;">a</div>
			<div style="width: 270px; height: 180px; border: 1px solid grey;">a</div>
		</div>
	</div>
	
</body>
</html>