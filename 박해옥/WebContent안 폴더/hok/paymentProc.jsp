<%@ page  contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
//applynum�� & paid_amount���� DB�� ����
		int applynum = Integer.parseInt(request.getParameter("apply_num"));
		int paid_amount = Integer.parseInt(request.getParameter("paid_amount"));
		String msg = "ī����ι�ȣ �� ���αݾ� : "+ applynum + " : "  + paid_amount;
		
%>
<script>
	alert("<%=msg%>'');
	location.href="<%=request.getContextPath()%>/hok/sallList.jsp";
</script>