<%@page import="hok.UtilMgr"%>
<%@page import="hok.ProductBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="hok.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="hok.CartMgr"/>
<jsp:useBean id="pMgr" class="hok.ProductMgr"></jsp:useBean>
<%
	request.setCharacterEncoding("EUC-KR");
	if(session.getAttribute("idKey")==null){
		response.sendRedirect("login.jsp");
		return;
	}
	Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
	int totalPrice = 0;
		
%>
<html>
<head>
<title>NaverMall SallList</title>
<!--  <script src="script.js"/> 이렇게해서 안되는 경우도 있음, 아래코드가 정식 코드임-->
<script src="script.js"></script>
</head>

<body bgcolor="#ECF6CE" topmargin="100">
<%@include file="top.jsp" %>	
<table width=75% align="center" bgcolor="#FFFF99" >
	<tr>
	<td align="center" bgcolor="#FFFFCC">
	<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr align="center" bgcolor="#04B431">
			<td><font color="#FFFFFF">제품</font></td>
			<td><font color="#FFFFFF">수량</font></td>
			<td><font color="#FFFFFF">가격</font></td>
			<td><font color="#FFFFFF">조회</font></td>
		</tr>
		<%if(hCart.isEmpty()){ %>
		<tr>
			<td colspan="4" align="center">장바구니는 비었습니다.</td>
		</tr>
		<%}else{
			Enumeration<Integer> hCartKey=hCart.keys();//proNum
			while(hCartKey.hasMoreElements()){
				OrderBean order = hCart.get(hCartKey.nextElement());
				int proNum=order.getProNum();//상품번호
				ProductBean pbean=pMgr.getProduct(proNum);//상품정보
				String pName=pbean.getProName();//상품이름
				int price=pbean.getPrice();//상품가격
				int ordAm=order.getOrdAm();//주문수량
				int subTotal=price*ordAm;
				totalPrice+=subTotal;
				%>
				<tr align="center"	>
				
				    <input type="hidden" name="proNum" value="%=proNum%>">
					<td><%=pName%></td>
					<td><input name="ordAm" style="text-align: right;" value="<%=ordAm %>" size="3">개</td>
					<td><%=UtilMgr.monFormat(subTotal)%> 원</td>
					<td><a href="javascript:productDetail('%=proNum%>')">상세보기</a></td>
				
			</tr>
			<%}//while%> 
					
		   <%}//else%>
	</table>
    </td>
	</tr>
	</table>
	<table width=75% align="center" bgcolor="#FFFF99" >
	<tr>
	<td align="center" bgcolor="#FFFFCC">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
				<tr><td><b>&nbsp;&nbsp;결제금액 :<input name="payMent" style="text-align: right;" 
				value="<%=UtilMgr.monFormat(totalPrice)%>">원 </b></td></tr>
				<tr><td><b>&nbsp;&nbsp;전화번호: </b> 
				<input name="ordPhone" size="15" value="010-1111-2222"></td></tr>
				<tr><td><b>&nbsp;&nbsp;결재방법: </b>
					<select name="payMe"  >
					 	<option value="무통장입금">무통장입금</option>
					 	<option vlaue="카드결제" selected>카드결제</option>
					 	<option value="핸드폰결재">핸드폰결재</option>
					 </select>
				 </td></tr>
				 <tr><td><b>&nbsp;&nbsp;입금자명: </b> 
				<input name="payName" size="15" value="네이버"></td></tr>	
				<tr><td><b>&nbsp;&nbsp;배송지주소: </b> 
				
				<input name="zipcode" size="10" > 
				<input type="button" value="우편번호검색"><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="devAd1" size=50><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="devAd2" size="20">
				</td></tr>
				<tr><td><b>&nbsp;&nbsp;받는사람이름: </b> 
				<input name="devNa" size="15" value="네이버"></td></tr>
				<tr><td><b>&nbsp;&nbsp;받는사람전화번호: </b> 
				<input name="devPhone" size="15" value="010-1111-2222"></td></tr>
				<tr><td align="center"><a href="orderProc.jsp"><b>[결재하기]</b></a></td></tr>
	  	</table>
  		</td>
   		</tr>
	</table>
    <form name="detail" method="post" action="productDetail.jsp">
		<input type="hidden" name="proNum">
	</form>
	<%@ include file="bottom.jsp" %>
</body>
</html>
