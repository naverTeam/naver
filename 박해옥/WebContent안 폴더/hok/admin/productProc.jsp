<!-- admin��� -->
<%@page import="hok.UtilMgr"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="hok.ProductMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		//insert, update, deleteó��
		String flag = request.getParameter("flag");
		boolean result = false;
		String msg="������ �߻��Ͽ����ϴ�.";
		if(flag.equals("insert")){
			result=pMgr.insertProduct(request);
			if(result) msg="��ǰ�� ����Ͽ����ϴ�.";
		}else if(flag.equals("update")){
			result=pMgr.updateProduct(request);
			if(result) msg="��ǰ�� �����Ͽ����ϴ�.";
		}else if(flag.equals("delete")){
			result=pMgr.deleteProduct(UtilMgr.parseInt(request,"proNum"));
			if(result) msg="��ǰ�� �����Ͽ����ϴ�.";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "productMgr.jsp";
</script>