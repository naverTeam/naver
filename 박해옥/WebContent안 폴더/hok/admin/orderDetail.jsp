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
<title>NaverMall �����ڸ�� �ֹ���</title>
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
					<font color="#FFFFFF">�ֹ��󼼳���</font>
				</td>
			</tr>
			<tr align="center">
				<td>�����̵�</td>
				<td><%=order.getId() %></td>
			</tr>
			<tr align="center">
				<td>�ֹ���ȣ</td>
				<td><%=order.getOrdNum() %></td>
			</tr>
			<tr align="center">
				<td>��ǰ��ȣ</td>
				<td><%=product.getProNum() %></td>
			</tr>
			<tr align="center">
				<td>��ǰ�̸�</td>
				<td><%=product.getProName() %></td>
			</tr>
			<tr align="center">
				<td>��ǰ����</td>
				<td><%=UtilMgr.intFormat(product.getPrice()) %>��</td>
			</tr>
			<tr align="center">
				<td>�ֹ�����</td>
				<td><%=order.getOrdAm() %></td>
			</tr>
			<tr align="center">
				<td>�ֹ��ݾ�</td>
				<td><%=order.getPayment() %></td>
			</tr>
			<tr align="center">
				<td>������</td>
				<td><%=product.getStock() %></td>
			</tr>
			<tr align="center">
				<td>�ֹ���¥</td>
				<td><%=order.getOrdDay() %></td>
			</tr>
			<tr align="center">
				<td>�ֹ�����</td>
				<td>
					<select name="state">
						<option value="1">������</option>
						<option value="2">����</option>
						<option value="3">�Ա�Ȯ��</option>
						<option value="4">����غ�</option>
						<option value="5">�����</option>
						<option value="6">�Ϸ�</option>
					</select>
				<script>document.order.state.value=<%=order.getState()%></script>
				</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="button" value="����" size="3" 
					 onclick="javascript:orderUpdate(this.form)">/
					 <input type="button" value="����" size="3" 
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