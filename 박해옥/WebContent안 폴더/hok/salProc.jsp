<%@page import="java.util.Enumeration"%>
<%@page import="hok.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@page import="hok.OrderMgr"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="hok.CartMgr"/>
<jsp:useBean id="pMgr" class="hok.ProductMgr"/>
<jsp:useBean id="orderMgr" class="hok.OrderMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		//세션에 있는 장바구니 리턴
		Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
		//hashtable의 키값들을 리턴
		Enumeration<Integer> hCartKey = hCart.keys();
		String msg="";
		if(!hCart.isEmpty()){
			while(hCartKey.hasMoreElements()){
				//out.println("상품번호 : " + hCartKey.nextElement() + "<br>");
				//장바구니에 주문번호 키값으로 주문객체 리턴
				OrderBean order = hCart.get(hCartKey.nextElement());
				}//while
			msg = "주문하러 갑니다. ";
		}else{
			msg="장바구니가 비었습니다.";
		}//else if
		
%>
<script>
	alert("<%=msg%>");
	location.href="salList.jsp";
</script>