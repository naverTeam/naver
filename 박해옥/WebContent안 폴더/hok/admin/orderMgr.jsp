<%@page import="hok.UtilMgr"%>
<%@page import="hok.ProductBean"%>
<%@page import="hok.OrderBean"%>
<%@page import="java.util.Vector"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="orderMgr" class="hok.OrderMgr"/>
<jsp:useBean id="pMgr" class="hok.ProductMgr"/>
<html>
<head>
<title>NaverMall 관리자모드 주문관리</title>
<script src="script.js" ></script>
</head>
<body bgcolor="#ECF6CE" topmargin="50">
<%@ include file="top.jsp" %>
<table width="75%" align="center" bgcolor="#FFFF99">
<tr>
<td align="center" bgcolor="#FFFFCC">
	<table width="95%" align="center" bgcolor="#FFFF99" border="1">
	<tr align="center" bgcolor="#04B431">
		<td><font color="#FFFFFF">주문번호</font></td>
		<td><font color="#FFFFFF">주문자</font></td>
		<td><font color="#FFFFFF">제품</font></td>
		<td><font color="#FFFFFF">주문수량</font></td>
		<td><font color="#FFFFFF">주문금액</font></td>
		<td><font color="#FFFFFF">주문날짜</font></td>
		<td><font color="#FFFFFF">주문상태</font></td>
		<td><font color="#FFFFFF">상세보기</font></td>
	</tr>
	<%
		Vector<OrderBean> vlist=orderMgr.getOrderList();
		if(vlist.isEmpty()){
	%>
		<tr>
			<td align="center" colspan="8">주문내역이 없습니다.</td>
		</tr>
	<%}else{
				for(int i=0;i<vlist.size();i++){
					OrderBean order = vlist.get(i);//주문정보	
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
				case "1" : out.println("접수중");break;
				case "2" : out.println("접수");break;
				case "3" : out.println("입금확인");break;
				case "4" : out.println("배송준비");break;
				case "5" : out.println("배송중");break;
				default : out.println("완료");
			}
		%>
		</td>
		<td><a href="javascript:orderDetail('<%=order.getOrdNum()%>')">	상세보기</a></td>
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