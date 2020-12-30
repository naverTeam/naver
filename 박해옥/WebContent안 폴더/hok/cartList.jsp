<%@page import="hok.UtilMgr"%>
<%@page import="hok.ProductBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="hok.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="hok.CartMgr"/>
<jsp:useBean id="pMgr" class="hok.ProductMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	if(session.getAttribute("idKey")==null){
		response.sendRedirect("login.jsp");
		return;
	}
	
	Hashtable<Integer, OrderBean> hCart=cMgr.getCartList();
	int totalPrice = 0;
%>
<html>
<head>
<title>NaverMall CartList</title>
<!--  <script src="script.js"/>-->
<script src="script.js"></script>
</head>

<body bgcolor="#ECF6CE" topmargin="100">
<%@include file="top.jsp" %>	
<table width=75% align="center" bgcolor="#FFFF99" >
	<tr>
	<td align="center" bgcolor="#FFFFCC">
	<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr align="center" bgcolor="#04B431">
			<td><font color="#FFFFFF">��ǰ</font></td>
			<td><font color="#FFFFFF">����</font></td>
			<td><font color="#FFFFFF">����</font></td>
			<td><font color="#FFFFFF">����/����</font></td>
			<td><font color="#FFFFFF">��ȸ</font></td>
		</tr>
		<%if(hCart.isEmpty()){ %>
		<tr>
			<td colspan="5" align="center">��ٱ��ϴ� ������ϴ�.</td>
		</tr>
		<%}else{
			Enumeration<Integer> hCartKey=hCart.keys();//proNum
			while(hCartKey.hasMoreElements()){
				OrderBean order = hCart.get(hCartKey.nextElement());
				int proNum=order.getProNum();//��ǰ��ȣ
				ProductBean pbean=pMgr.getProduct(proNum);//��ǰ����
				String pName=pbean.getProName();//��ǰ�̸�
				int price=pbean.getPrice();//��ǰ����
				int ordAm=order.getOrdAm();//�ֹ�����
				int subTotal=price*ordAm;
				totalPrice+=subTotal;
				%>
				<tr align="center"	>
				<form method="post" action="cartProc.jsp">
					<input type="hidden" name="proNum" value="%=proNum%>">
					<td><%=pName%></td>
					<td><input name="ordAm" style="text-align: right;" value="<%=ordAm %>" size="3">��</td>
					<td><%=UtilMgr.monFormat(subTotal)%> ��</td>
					<td><input type="button" value="����" size="3" onclick="javascript:cartUpdate(this.form)">
					/<input type="button" value="����" size="3" onclick="javascript:cartDelete(this.form)"></td>
					<td><a href="javascript:productDetail('%=proNum%>')">�󼼺���</a></td>
					<input type="hidden" name="flag">
				</form>
			</tr>
			<%}//while%> 
			<tr>
				<td colspan="4" align="right">�� �ֹ� �ݾ�: <%=UtilMgr.monFormat(totalPrice)%>��</td>
				<td align="center"><a href="orderProc.jsp">�ֹ��ϱ�</a></td>
			</tr>
		
		   <%}//else%>
		
		
			
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
