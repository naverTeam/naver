

<link href="style.css" rel="stylesheet" type="text/css">
<%@ page pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("id");
	
	String log="";
	if(id == null) log ="<a href=../member/login.jsp?returnPage=../hok/productList.jsp>�α���</a>";
	else log = "<a href=../member/logout.jsp>�α׾ƿ�</a>";

	String reg="";
	if(id == null) reg ="<a href=../member/member.jsp>ȸ������</a>";
	else reg = "<a href=../member/update.jsp>ȸ������</a>";
%>

<div class="mainText" width="75%">Welcome NaverMall</div>

