<%@page import="hok.UtilMgr"%>
<%@page import="hok.ProductBean"%>
<%@page import="hok.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="orderMgr" class="hok.OrderMgr"/>
<jsp:useBean id="pMgr" class="hok.ProductMgr"/>
<html>
<head>
<title>NaverMall �����ڸ�� �ֹ�����</title>
<script src="script.js" ></script>
</head>
<body bgcolor="#ECF6CE" topmargin="50">
<%@ include file="top.jsp" %>
<table width="75%" align="center" bgcolor="#FFFF99">
<tr>
<td align="center" bgcolor="#FFFFCC">
	<table width="95%" align="center" bgcolor="#FFFF99" border="1">
	<tr align="center" bgcolor="#04B431">
		<td><font color="#FFFFFF">�ֹ���ȣ</font></td>
		<td><font color="#FFFFFF">�ֹ���</font></td>
		<td><font color="#FFFFFF">��ǰ</font></td>
		<td><font color="#FFFFFF">�ֹ�����</font></td>
		<td><font color="#FFFFFF">�ֹ��ݾ�</font></td>
		<td><font color="#FFFFFF">�ֹ���¥</font></td>
		<td><font color="#FFFFFF">�ֹ�����</font></td>
		<td><font color="#FFFFFF">�󼼺���</font></td>
	</tr>
	<%
		Vector<OrderBean> vlist=orderMgr.getOrderList();
		if(vlist.isEmpty()){
	%>
		<tr>
			<td align="center" colspan="8">�ֹ������� �����ϴ�.</td>
		</tr>
	<%}else{
				for(int i=0;i<vlist.size();i++){
					OrderBean order = vlist.get(i);//�ֹ�����	
					ProductBean product =pMgr.getProduct(order.getProNum());
	%>
	<tr align="center">
		<td><%=order.getOrdNum() %></td>
		<td><%=order.getId() %></td>
		<td><%=product.getProName() %></td>
		<td><%=order.getOrdAm() %></td>
		<td><%=UtilMgr.monFormat(order.getPayment() )%></td>
		<td><%=order.getOrdDay() %></td>
		<td>
		<%
			switch(order.getState()){
				case "1" : out.println("������");break;
				case "2" : out.println("����");break;
				case "3" : out.println("�Ա�Ȯ��");break;
				case "4" : out.println("����غ�");break;
				case "5" : out.println("�����");break;
				default : out.println("�Ϸ�");
			}
		%>
		</td>
		<td><a href="javascript:orderDetail('<%=order.getOrdNum()%>')">	�󼼺���</a></td>
	</tr>		
	<%
				}//for
		}//else
	%>
	</table>
</td>
</tr>
</table>
<%@ include file="bottom.jsp" %>
<form name="detail" method="post"  action="orderDetail.jsp">
		<input type="hidden" name="ordNum">
</form>
</body>
</html>