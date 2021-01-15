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
		String msg = "로그인 실패";
		String returnPage = request.getParameter("returnPage");
		
		boolean result = mgr.loginMember(id,pwd);
		if(result){
		  session.setAttribute("id",id);
		  msg = "로그인 성공";
}
%>
<script>
<%if(result){//로그인 성공%>
	<%if(returnPage==null){//돌아갈 페이지 값이 전달되지 않았다면 %>
	
	alert("<%=msg%>");
	location.href = "../chu/index.jsp";
	
	<%}else{//돌아갈 페이지 값이 전달되었다면%>
	
	location.href = "<%=returnPage%>";
	
	<%} %>
<%}else{//로그인 실패 %>

	location.href = "login.jsp";
	
<%} %>
</script>
