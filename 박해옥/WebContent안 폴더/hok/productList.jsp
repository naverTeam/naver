
<!-- productList.jsp -->
<%@page import="hok.UtilMgr"%>
<%@page import="hok.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="hok.ProductMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	Vector<ProductBean> pvlist=pMgr.getProductList();
%>
<html>
<head>
<title>NaverMall List</title>
<script src="script.js"></script>
</head>
<body bgcolor="#ECF6CE" topmargin="100">
<%@include file="mainTop.jsp" %>
<table width="75%" align="center" bgcolor="#FFFF99" border="1">
<%
for(int i=0; i<pvlist.size();i++){
	ProductBean pbean = pvlist.get(i);
%>
<tr align="center">
<td width="20%">
<img src="data/<%=pbean.getProImg() %>" height="100" width="150">
</td>
<td width="50%" valign="top" >
<table>
<tr>
<td><b>��ǰ�̸� :<%=pbean.getProName()%> </b></td>
</tr> 
<tr>
<td><b>�� ��: <%=UtilMgr.monFormat(pbean.getPrice()) %></b>��</td>
</tr>
<tr>
<td><b>������:<%=UtilMgr.monFormat(pbean.getStock()) %> </b></td>
</tr>
<tr>
<td><input type="button" value="�󼼺���" 
onclick="productDetail('<%=pbean.getProNum()%>')">
</td>
</td>
</tr>
</table>
</td>
<td width="30%" valign="top" align="left">
<b> ���� : </b><br/>
<b>����� :<%=pbean.getProDay()%> </b>
</td>
<%}%>
</table>
<form name="detail" method="post" action="productDetail.jsp">
<input type="hidden" name="proNum">
</form>
</body>
</html>