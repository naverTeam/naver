<!-- cartProc.jsp : ��ٱ��� ��� , ����, ���� ó�� -->
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="hok.CartMgr"/>
<jsp:useBean id="order" class="hok.OrderBean"/>
<jsp:setProperty property="*" name="order"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String id=(String)session.getAttribute("idKey");
		String stotalPrice = (String)request.getParameter("price");//�Ǹűݾ�
		int price = Integer.parseInt(stotalPrice);//�Ǹűݾ� ���ڷ� ��ȯ
		int ordAm=order.getOrdAm();
		int payMent= price * ordAm;
		if(id==null){
			response.sendRedirect("login.jsp");
			return;
		}
		//���� �ֹ� �ߴ��� ���ǿ� ����� id�� order��ü�� setter�Ѵ�.
		order.setPayment(payMent);
		order.setId(id);
		String flag = request.getParameter("flag");
		String msg = "";
		if(flag.equals("insert")){
			cMgr.addCart(order);
			msg="��ٱ��Ͽ� ��ҽ��ϴ�. ";
		}else if(flag.equals("update")){
			cMgr.updateCart(order);
			msg="��ٱ��ϸ� �����Ͽ����ϴ�. ";
		}else if(flag.equals("delete")){
			cMgr.deleteCart(order);
			msg="��ٱ��ϸ� �����Ͽ����ϴ�. ";
		}
		
%>
<script>
		//alert("<%=order.getOrdAm()%>")
		//alert("<%=order.getPayment()%>")
		alert("<%=msg%>");
		location.href="cartList.jsp";
</script>