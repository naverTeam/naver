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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body bgcolor="#ECF6CE" topmargin="100">
<%@include file="top.jsp" %>	

<table width=75% align="center" bgcolor="#FFFF99" >
	<tr>
	<td align="center" bgcolor="#FFFFCC">
	<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr align="center" bgcolor="#04B431">
			<td width ="25%" ><font color="#FFFFFF">제품</font></td>
			<td width ="25%" ><font color="#FFFFFF">수량</font></td>
			<td width ="25%" ><font color="#FFFFFF">가격</font></td>
			<td width ="25%" ><font color="#FFFFFF">조회</font></td>
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
					<td><%=ordAm %>개</td>
					<td><%=UtilMgr.monFormat(subTotal)%> 원</td>
					<td><input type="button" value="상세보기" style="background-color:#E0F2F7" 
						onclick="productDetail('<%=pbean.getProNum()%>')"></td>
				
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
		<!--  action="orderProc.jsp"-->
		<form name="sallForm" method="post" action="payProc2.jsp" >
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
				<tr><td width="20%" align="center"><b>결 제 금 액 </b></td>
				<td width="80%"><input name="totalPrice" value="<%=totalPrice%>" 
				style = "text-align:right;" size="10" readyonly >원</td></tr>
				<tr><td align="center"><b>전 화 번 호 </b></td> 
				<td><input name="ordPhone" size="15" ></td></tr>
				<tr><td align="center"><b>결 재 방 법 </b></td>
				<td>	<select name="payMe"  >
					 	<option value="무통장입금">무통장입금</option>
					 	<option vlaue="카드결제" selected>카드결제</option>
					 	<!--  <option value="핸드폰결재">핸드폰결재</option>-->
					 </select>
				 </td></tr>
				 <tr><td align="center"><b>입 금 자 명 </b> </td>
				<td><input name="payName" size="15" ></td></tr>	
				<tr><td align="center"><b>배송지 주소 </b> </td>
				
				<td><input   id="zipcode" size="10"  readonly > </input>
				<input type="button" onclick="execPostcode()" value="우편번호검색"  ><br>
				<input  type="text" id="devAd1" size=50  readonly><br>
				<input  type="text" id="devAd2" size="30" readonly><br>
				<input  type="text" id="devAd3" size="20" >
				</td></tr>
				<tr><td align="center"><b>받는사람이름 </b> </td>
				<td><input name="devNa" size="15" ></td></tr>
				<tr><td align="center"><b>받는사람전화번호 </b> </td>
				<td><input name="devPhone" size="15" ></td></tr>
				<tr><td align="center" colspan="2"><input type="button" onclick="inputCheck()" 
					style="background-color:#E0F2F7" value="[결재하기]"  ></td></tr>
	  	</table>
	  	
					<input type="hidden" name="czipcode">
					<input type="hidden" name="cdevAd1">
					<input type="hidden" name="cdevAd2">
					<input type="hidden" name="cdevAd3">
	</form>
  		</td>
   		</tr>
	</table>
    <form name="detail" method="post" action="productDetail.jsp">
		<input type="hidden" name="proNum">
	</form>
	<%@ include file="bottom.jsp" %>
</body>
</html>
