

<link href="style.css" rel="stylesheet" type="text/css">
<%@ page pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("idKey");
	
	String log="";
	if(id == null) log ="<a href=login.jsp>�α���</a>";
	else log = "<a href=logout.jsp>�α׾ƿ�</a>";

	String reg="";
	if(id == null) reg ="<a href=member.jsp>ȸ������</a>";
	else reg = "<a href=memberUpdate.jsp>ȸ������</a>";
%>

<div class="mainText" width="75%">Welcome NaverMall</div>

