<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="joinmember.MemberMgr" %>

<jsp:useBean id="mgr" class="joinmember.MemberMgr"/>
<jsp:useBean id="bean" class="joinmember.MemberBean"/>
    
<%

request.setCharacterEncoding("EUC-KR");
String cPath = request.getContextPath();
String id = request.getParameter("id");
String pswd1 = request.getParameter("pw");
String msg = "로그인에 실패 하였습니다.";

boolean result = mgr.loginMember(id,pswd1);
if(result){
  session.setAttribute("idKey",id);
  msg = "로그인에 성공 하였습니다.";
}
%>
<script>
alert("<%=msg%>");
if(<%=result%>){
	
  location.href = "index.jsp";
}
else
  location.href = "login.jsp";
</script>