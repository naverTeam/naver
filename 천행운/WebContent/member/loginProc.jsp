<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="joinmember.MemberMgr" %>

<jsp:useBean id="mgr" class="joinmember.MemberMgr"/>
<jsp:useBean id="bean" class="joinmember.MemberBean"/>
    
<%

request.setCharacterEncoding("EUC-KR");
String cPath = request.getContextPath();
String id = request.getParameter("id");
String pswd1 = request.getParameter("pw");
String msg = "로그인 실패";

boolean result = mgr.loginMember(id,pswd1);
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