<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="bean" class="member.MemberBean"/>
<jsp:useBean id="mgr" class="member.MemberMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String) session.getAttribute("id");
		
		String pwd = request.getParameter("pwd1");
		
		boolean flag = mgr.deleteMember(id, pwd);
		if(flag==true){	
%>
<script>
	alert("ȸ��Ż�𼺰�");
</script>
<%
		session.invalidate();
		}else{
%>
<script>
	alert("ȸ��Ż�����");
</script>
<%}%>