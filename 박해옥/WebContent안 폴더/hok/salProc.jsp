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
		//���ǿ� �ִ� ��ٱ��� ����
		Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
		//hashtable�� Ű������ ����
		Enumeration<Integer> hCartKey = hCart.keys();
		String msg="";
		if(!hCart.isEmpty()){
			while(hCartKey.hasMoreElements()){
				//out.println("��ǰ��ȣ : " + hCartKey.nextElement() + "<br>");
				//��ٱ��Ͽ� �ֹ���ȣ Ű������ �ֹ���ü ����
				OrderBean order = hCart.get(hCartKey.nextElement());
				}//while
			msg = "�ֹ��Ϸ� ���ϴ�. ";
		}else{
			msg="��ٱ��ϰ� ������ϴ�.";
		}//else if
		
%>
<script>
	alert("<%=msg%>");
	location.href="salList.jsp";
</script>