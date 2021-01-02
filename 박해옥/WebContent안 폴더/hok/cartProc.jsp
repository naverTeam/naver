<!-- cartProc.jsp : 장바구니 담기 , 수정, 삭제 처리 -->
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="hok.CartMgr"/>
<jsp:useBean id="order" class="hok.OrderBean"/>
<jsp:setProperty property="*" name="order"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String id=(String)session.getAttribute("idKey");
		String stotalPrice = (String)request.getParameter("price");//판매금액
		int price = Integer.parseInt(stotalPrice);//판매금액 숫자로 전환
		int ordAm=order.getOrdAm();
		int payMent= price * ordAm;
		if(id==null){
			response.sendRedirect("login.jsp");
			return;
		}
		//누가 주문 했는지 세션에 저장된 id를 order객체에 setter한다.
		order.setPayment(payMent);
		order.setId(id);
		String flag = request.getParameter("flag");
		String msg = "";
		if(flag.equals("insert")){
			cMgr.addCart(order);
			msg="장바구니에 담았습니다. ";
		}else if(flag.equals("update")){
			cMgr.updateCart(order);
			msg="장바구니를 수정하였습니다. ";
		}else if(flag.equals("delete")){
			cMgr.deleteCart(order);
			msg="장바구니를 삭제하였습니다. ";
		}
		
%>
<script>
		//alert("<%=order.getOrdAm()%>")
		//alert("<%=order.getPayment()%>")
		alert("<%=msg%>");
		location.href="cartList.jsp";
</script>