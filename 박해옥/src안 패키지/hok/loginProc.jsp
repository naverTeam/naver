<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="member.MemberMgr" %>

<jsp:useBean id="mgr" class="member.MemberMgr"/>
<jsp:useBean id="bean" class="member.MemberBean"/>
    
<%
		request.setCharacterEncoding("EUC-KR");
		String cPath = request.getContextPath();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String msg = "�α��� ����";
		String returnPage = request.getParameter("returnPage");
		
		boolean result = mgr.loginMember(id,pwd);
		if(result){
		  session.setAttribute("id",id);
		  msg = "�α��� ����";
}
%>
<script>
<%if(result){//�α��� ����%>
	<%if(returnPage==null){//���ư� ������ ���� ���޵��� �ʾҴٸ� %>
	
	alert("<%=msg%>");
	location.href = "../chu/index.jsp";
	
	<%}else{//���ư� ������ ���� ���޵Ǿ��ٸ�%>
	
	location.href = "<%=returnPage%>";
	
	<%} %>
<%}else{//�α��� ���� %>

	location.href = "login.jsp";
	
<%} %>
</script>
