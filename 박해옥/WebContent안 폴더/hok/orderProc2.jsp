<%@page import="java.util.Enumeration"%>
<%@page import="hok.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@page import="hok.OrderMgr"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="hok.CartMgr"/>
<jsp:useBean id="pMgr" class="hok.ProductMgr"/>
<jsp:useBean id="orderMgr" class="hok.OrderMgr"/>
<jsp:useBean id="order1" class="hok.OrderBean"/>
<jsp:setProperty property="*" name="order1"/>
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
				//장바구니에 주문번호 키값으로 주문객체(proNum,id,ordAm) 리턴
				OrderBean order = hCart.get(hCartKey.nextElement());
				order.setPaid_amount(order1.getPaid_amount());
				order.setOrdPhone(order1.getOrdPhone());
				order.setPayMe(order1.getPayMe());
				order.setPayName(order1.getPayName());
				order.setZipcode(order1.getZipcode());
				order.setDevAddress(order1.getDevAddress());
				order.setDevName(order1.getDevName());
				order.setDevPhone(order1.getDevPhone());
				order.setApplynum(order1.getApplynum());
				order.setPaid_amount(order1.getPaid_amount());
				//db 주문처리
				orderMgr.insertOrder2(order);
				//재고 정리
				pMgr.reduceProduct(order);
				//장바구니에 주문한 상품 삭제
				cMgr.deleteCart(order);
			}//while
			msg = "주문처리 하였습니다."	;
		}else{
			msg="장바구니가 비었습니다.";
		}//else if
		
%>
<script>
	alert("<%=msg%>");
	location.href="orderList.jsp";
</script>