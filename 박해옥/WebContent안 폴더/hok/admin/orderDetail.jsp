<%@page import="hok.UtilMgr"%>
<%@page import="hok.OrderBean"%>
<%@page import="hok.ProductBean"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="hok.ProductMgr"/>
<jsp:useBean id="orderMgr" class="hok.OrderMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int ordNum = Integer.parseInt(request.getParameter("ordNum"));
		OrderBean order = orderMgr.getOrderDetail(ordNum);
		ProductBean product = pMgr.getProduct(order.getProNum());
%>
<html>
<head>
<title>NaverMall 관리자모드 주문상세</title>
<script src="script.js"></script>
</head>
<body bgcolor="#ECF6CE" topmargin="50">
<%@ include file="top.jsp"%>
<form method="post" name="order" action="orderProc.jsp">
<table width="75%" align="center" bgcolor="#FFFF99">
	<tr>
		<td align="center" bgcolor="#FFFFCC">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
			<tr bgcolor="#04B431">
				<td colspan="2" align="center">
					<font color="#FFFFFF">주문상세내역</font>
				</td>
			</tr>
			<tr align="center">
				<td>고객아이디</td>
				<td><%=order.getId() %></td>
			</tr>
			<tr align="center">
				<td>주문번호</td>
				<td><%=order.getOrdNum() %></td>
			</tr>
			<tr align="center">
				<td>제품번호</td>
				<td><%=product.getProNum() %></td>
			</tr>
			<tr align="center">
				<td>제품이름</td>
				<td><%=product.getProName() %></td>
			</tr>
			<tr align="center">
				<td>제품가격</td>
				<td><%=UtilMgr.intFormat(product.getPrice()) %>원</td>
			</tr>
			<tr align="center">
				<td>주문수량</td>
				<td><%=order.getOrdAm() %></td>
			</tr>
			<tr align="center">
				<td>주문금액</td>
				<td><%=order.getPayment() %></td>
			</tr>
			<tr align="center">
				<td>재고수량</td>
				<td><%=product.getStock() %></td>
			</tr>
			<tr align="center">
				<td>주문날짜</td>
				<td><%=order.getOrdDay() %></td>
			</tr>
			<tr align="center">
				<td>주문상태</td>
				<td>
					<select name="state">
						<option value="1">접수중</option>
						<option value="2">접수</option>
						<option value="3">입금확인</option>
						<option value="4">배송준비</option>
						<option value="5">배송중</option>
						<option value="6">완료</option>
					</select>
				<script>document.order.state.value=<%=order.getState()%></script>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="button" value="수정" size="3" 
					 onclick="javascript:orderUpdate(this.form)">/
					 <input type="button" value="삭제" size="3" 
					 onclick="javascript:orderDelete(this.form)">
				</td>
			</tr>
		</table>
		<input type="hidden" name="ordNum" value="<%=order.getOrdNum()%>">
		<input type="hidden" name="flag">
		</td>
	</tr>
</table>
</form>
</body>
</html>