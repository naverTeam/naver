<%@page import="hok.ProductBean"%>
<%@page import="hok.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<%	request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="orderMgr" class="hok.OrderMgr"/>
<jsp:useBean id="pMgr" class="hok.ProductMgr" />
<%
	if(session.getAttribute("id")==null){
		response.sendRedirect("../member/login.jsp");
	}
%>	
<html>
<head>
<title>NaverMall OrderList</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script src="script.js"></script>
</head>
<body bgcolor="#ECF6CE" topmargin="100">
<%@include file="top.jsp" %>
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr>
	<td align="center" bgcolor="#FFFFCC">
		<table width="95%" bgcolor="#FFFF99" border="1">
		<tr bgcolor="#04B431" align="center">
			<td><font color="#FFFFFF">�ֹ���ȣ</font></td>
			<td><font color="#FFFFFF">��ǰ</font></td>
			<td><font color="#FFFFFF">�ֹ�����</font></td>
			<td><font color="#FFFFFF">�ֹ��ݾ�</font></td>
			<td><font color="#FFFFFF">�ֹ���¥</font></td>
			<td><font color="#FFFFFF">�ֹ�����</font></td>
		</tr>
		<%
			Vector<OrderBean> vlist = orderMgr.getOrderList(id);
			if(vlist.isEmpty()){
		%>	
		<tr>
			<td colspan="5" align="center">
			�ֹ��Ͻ� ��ǰ�� �����ϴ�. 
			</td>
		</tr>	
		<%}else{
					for(int i=0; i<vlist.size(); i++){
						OrderBean order = vlist.get(i);
						int proNum = order.getProNum();
						ProductBean pbBean=pMgr.getProduct(proNum);
		%>
		<tr align="center">
			<td><%=order.getOrdNum() %></td>
			<td><a href="javascript:productDetail('<%=proNum%>')">
			<%=pbBean.getProName() %></a></td>
			<td><%=order.getOrdAm() %></td>
			<td><%=order.getPayment() %></td>
			<td><%=order.getOrdDay() %></td>
			<td> <%
					switch(order.getState()){
						case "1": out.print("������"); break;
						case "2": out.print("����"); break;
						case "3": out.print("�Ա�Ȯ��"); break;
						case "4": out.print("����غ�"); break;
						case "5": out.print("�����"); break;
						case "6": out.print("�Ϸ�"); break;
					}//switch
			%></td>	
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
 <form name="detail" method="post" action="productDetail.jsp">
<input type="hidden" name="proNum">
</form>
</body>
</html>