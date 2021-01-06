<%@page import="hok.UtilMgr"%>
<%@page import="com.mysql.jdbc.Util"%>
<%@page import="hok.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="hok.ProductMgr"/>
<html>
<head>
<title> NaverMall Admin</title>
<script src="script.js"></script>
</head>
<body bgcolor="#ECF6CE" topmargin="50">
<%@ include file="top.jsp" %>
<table width ="75%" align="center" bgcolor="#FFFF99"  >
	<tr>
		<td align="center" bgcolor="#FFFFCC">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
			<tr align="center" bgcolor="#04B431" >
				<td><font color="#FFFFFF">상품이름</font></td>
				<td><font color="#FFFFFF">가    격</font></td>
				<td><font color="#FFFFFF">날    짜</font></td>
				<td><font color="#FFFFFF">재    고</font></td>
				<td><font color="#FFFFFF">email</td>
				<td>&nbsp;</td>
			</tr>
			<%
				Vector<ProductBean> vResult = pMgr.getProductList();
				if(vResult.size() == 0){
			%>
			<tr>
				<td align="center" colspan="6">등록되 상품이 없습니다. </td>
			</tr>
			<%} else {
					for(int i=0; i<vResult.size(); i++){
						ProductBean product =vResult.get(i);
			%>
				<tr align="center">
					<td><%=product.getProName() %></td>
					<td><%=UtilMgr.intFormat(product.getPrice()) %></td>
					<td><%=product.getProDay() %></td>
					<td><%=UtilMgr.intFormat(product.getStock()) %></td>
					<td><%=product.getEmail() %></td>
					<td>
					<a href="javascript:productDetail('<%=product.getProNum() %>')">상세보기</a>
					</td>
				</tr>	
			
			<%	}//for
				}//else
			%>
			<tr>
				<td colspan="6" align="center">
					<a href="productInsert.jsp">상품등록</a>
				</td>
			</tr>
		</table>
		</td>
	</tr>	
</table>
<%@ include file="bottom.jsp" %>
<form name="detail" method="post" action="productDetail.jsp">
	<input type="hidden" name="proNum">
</form>
</body>
</html>