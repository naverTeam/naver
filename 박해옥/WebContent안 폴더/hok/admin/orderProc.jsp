<!-- admin orderProc.jsp -->
<%@page import="hok.UtilMgr"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="orderMgr" class="hok.OrderMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		String flag = request.getParameter("flag");
		int ordNum = UtilMgr.parseInt(request,"ordNum");
		boolean result = false;
		String msg = "������ �߻��Ͽ����ϴ�. ";
		if(flag.equals("update")){
			String state = request.getParameter("state");
			result = orderMgr.updateOrder(ordNum, state);
			if(result) msg="�ֹ��� �����Ͽ����ϴ�. ";
		}else if(flag.equals("delete")){
			result = orderMgr.deleteOrder(ordNum);
			if(result) msg="�ֹ��� �����Ͽ����ϴ�. ";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "orderMgr.jsp";
</script>