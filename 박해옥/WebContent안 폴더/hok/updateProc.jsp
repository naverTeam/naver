<%@page import="joinmember.MemberMgr"%>
<%@page import="joinmember.MemberBean"%>
<%@ page contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mgr" class="joinmember.MemberMgr"/>
<jsp:useBean id="bean" class="joinmember.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
		boolean result = mgr.updateMember(bean);//DB 저장
		String msg = "수정 실패";
		String url = "index.jsp";
		if (result){
			msg = "수정 성공";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>