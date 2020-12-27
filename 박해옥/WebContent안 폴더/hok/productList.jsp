
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
<td><b>상품이름 :<%=pbean.getProName()%> </b></td>
</tr> 
<tr>
<td><b>가 격: <%=UtilMgr.monFormat(pbean.getPrice()) %></b>원</td>
</tr>
<tr>
<td><b>재고수량:<%=UtilMgr.monFormat(pbean.getStock()) %> </b></td>
</tr>
<tr>
<td><input type="button" value="상세보기" 
onclick="productDetail('<%=pbean.getProNum()%>')">
</td>
</td>
</tr>
</table>
</td>
<td width="30%" valign="top" align="left">
<b> 평점 : </b><br/>
<b>등록일 :<%=pbean.getProDay()%> </b>
</td>
<%}%>
</table>
<form name="detail" method="post" action="productDetail.jsp">
<input type="hidden" name="proNum">
</form>
</body>
</html>