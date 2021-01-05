<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="joinmember.MemberMgr" %>

<jsp:useBean id="mgr" class="member.MemberMgr"/>
<jsp:useBean id="bean" class="member.MemberBean"/>
    
<%

request.setCharacterEncoding("EUC-KR");
String cPath = request.getContextPath();
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String msg = "로그인 실패";

boolean result = mgr.loginMember(id,pwd);
if(result){
  session.setAttribute("id",id);
  msg = "로그인 성공";
}
%>
<script>
alert("<%=msg%>");
if(<%=result%>)
  location.href = "../chu/index.jsp";
else
  location.href = "login.jsp";
</script>