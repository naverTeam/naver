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
			<td><font color="#FFFFFF">주문번호</font></td>
			<td><font color="#FFFFFF">제품</font></td>
			<td><font color="#FFFFFF">주문수량</font></td>
			<td><font color="#FFFFFF">주문금액</font></td>
			<td><font color="#FFFFFF">주문날짜</font></td>
			<td><font color="#FFFFFF">주문상태</font></td>
		</tr>
		<%
			Vector<OrderBean> vlist = orderMgr.getOrderList(id);
			if(vlist.isEmpty()){
		%>	
		<tr>
			<td colspan="5" align="center">
			주문하신 물품이 없습니다. 
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
						case "1": out.print("접수중"); break;
						case "2": out.print("접수"); break;
						case "3": out.print("입금확인"); break;
						case "4": out.print("배송준비"); break;
						case "5": out.print("배송중"); break;
						case "6": out.print("완료"); break;
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