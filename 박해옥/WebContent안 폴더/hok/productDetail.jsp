<%@page import="hok.ProductBean"%>
<%@page import="hok.UtilMgr"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="hok.ProductMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	int proNum=UtilMgr.parseInt(request, "proNum");
	ProductBean pbean = pMgr.getProduct(proNum);
%>
<html>
<head>
<title>NaverMall ProDetail</title>
<script src="script.js"></script>
</head>
<body bgcolor="#ECF6CE" topmargin="100">
<%@include file="top.jsp"%>
<form name="cart" action="cartProc.jsp">
<table width="75%" align="center" bgcolor="#FFFF99" border="1">
<tr>
<td width="20%">
<img src="data/<%=pbean.getProImg() %>" height="200" width="200">
</td>
<td width="70" valign="top">
<table>
<tr><br></tr>
<tr><td><b>��ǰ�̸� : <%=pbean.getName()%>     �� �� : </b></td></tr>
<tr><td><b>�ǸŰ��� : <%=pbean.getPrice()%>     ��ǰ����� : <%=pbean.getProDay() %> </b></td></tr>
<tr><td><b>���� : <%=pbean.getProAm() %>    �Ǹŷ� : <%=pbean.getSalAm() %>     ���: 
<%=pbean.getStock() %></b></td></tr>
<tr><td> <input type="submit" value="�����ı�"> &nbsp; &nbsp;
 <input type="submit" value="�����ϱ�"> &nbsp;&nbsp;
 <input type="submit" value="�Ǹ�������"></td></tr>
</table>
</td>
<td width="10" align="center">
<input type="button" style="width:50pt;height:80pt;" value="�ֹ� �ϱ�">
</td>
</tr>
<tr><td colspan="3" align="center">�󼼼���<br>
<<input type="file" value="data/<%=pbean.getFilename() %>"></td></tr>
</table>
</form>
</body>
</html>