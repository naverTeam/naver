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
		//���ǿ� �ִ� ��ٱ��� ����
		Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
		//hashtable�� Ű������ ����
		Enumeration<Integer> hCartKey = hCart.keys();
		String msg="";
		if(!hCart.isEmpty()){
			while(hCartKey.hasMoreElements()){
				//out.println("��ǰ��ȣ : " + hCartKey.nextElement() + "<br>");
				//��ٱ��Ͽ� �ֹ���ȣ Ű������ �ֹ���ü(proNum,id,ordAm) ����
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
				//db �ֹ�ó��
				orderMgr.insertOrder2(order);
				//��� ����
				pMgr.reduceProduct(order);
				//��ٱ��Ͽ� �ֹ��� ��ǰ ����
				cMgr.deleteCart(order);
			}//while
			msg = "�ֹ�ó�� �Ͽ����ϴ�."	;
		}else{
			msg="��ٱ��ϰ� ������ϴ�.";
		}//else if
		
%>
<script>
	alert("<%=msg%>");
	location.href="orderList.jsp";
</script>