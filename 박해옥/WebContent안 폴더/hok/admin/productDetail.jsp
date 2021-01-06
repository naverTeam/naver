<%@page import="hok.ProductBean"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="hok.ProductMgr"/>
<html>
<head>
<title>NaverMall Admin</title>
<script src="script.js"></script>
</head>
<body bgcolor="#ECF6CE" topmargin="50">
<%@ include file="top.jsp" %>
<%
	int proNum=Integer.parseInt(request.getParameter("proNum"));
	ProductBean product = pMgr.getProduct(proNum);
%>
<table width="75%" align="center" bgcolor="#FFFF99">
	<tr>
		<td align="center" bgcolor="#FFFFCC">
		<table width="95%" align="center" bgcolor=""#FFFF99/ border="1">
			<tr bgcolor="#088A4B">
				<td colspan="3" align="center"><font color="#FFFFFF">
				<%=product.getProName() %></font>	</td>
			</tr>
			<tr>
				<td width="20%">
					<img src="../data/<%=product.getProImg() %>"
					height="150" width="150">
				</td>
				<td width="60%" valign="top">
				<table border="1" width="100%" height="100%">
					<tr>
						<td><b>상품이름 :</b><%=product.getProName() %></td>
					</tr>
					<tr>
						<td><b>가    격 : </b><%=product.getPrice() %></td>
					</tr>
					<tr>
						<td><b>입고날짜 : </b><%=product.getProDay() %></td>
					</tr>
					<tr>
						<td><b>재    고 : </b><%=product.getStock() %></td>
					</tr>
				</table>
				</td>
				<td width="20%" align="center">
				<a href="javascript:productUpdate('<%=product.getProNum() %>')"
				 style="background-color:#E0F2F7"><b>수정하기</b></a><br><br>
				<a href="javascript:productDelete('<%=product.getProNum() %>')"
				 style="background-color:#E0F2F7"><b>삭제하기</b></a>
				</td>
			</tr>
			<tr>
				<td colspan="3" valign="top" align="center"><b>상세설명</b><br>
				<pre height="150" width="150"><%=product.getFilename() %></pre>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<%@ include file="bottom.jsp" %>
<form name="update" method="post" action="productUpdate.jsp">
	<input type="hidden" name="proNum">
</form>
<form name="del" method="post" action="productProc.jsp?flag=delete">
	<input type="hidden" name="proNum">
</form>
</body>
</html>