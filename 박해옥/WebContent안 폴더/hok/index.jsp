<%@page contentType="text/html;charset=EUC-KR"%>
<html>
<head>
<title>Simple Shopping Mall </title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#ECF6CE" topmargin="100">
<%@ include file="top.jsp" %>
<table width="75%" align="center" bgcolor="#FFFF99" height="100%">
	<%if(id != null){%>
	<tr> 
		<td align="center"><%=id%>�� �湮�� �ּż� �����մϴ�.</td>
	</tr>
	<%}else{%>
	<tr>
		<td align="center">�α��� �Ͻ� �� �̿��� �ּ���.</td>
	</tr>
	<%}%>
</table>
<%@ include file="bottom.jsp" %>
</body>
</html>  