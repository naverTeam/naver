<%@ page contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mgr" class="joinmember.MemberMgr"/>
<jsp:useBean id="bean" class="joinmember.MemberBean"/>
<%
		bean.setId(request.getParameter("id"));
		bean.setName(request.getParameter("name"));
		bean.setPswd1(request.getParameter("pswd1"));
		bean.setPswd2(request.getParameter("pswd2"));
		bean.setBirth_yy(request.getParameter("birth_yy"));
		bean.setBirth_mm(request.getParameter("birth_mm"));
		bean.setBirth_dd(request.getParameter("birth_dd"));
		bean.setGender(request.getParameter("gender"));
		bean.setMobile(request.getParameter("mobile"));
		
	
		String msg = "가입에 실패하였습니다.";		
		
		boolean result = mgr.insertMember(bean);
		if(result){
			msg = "회원가입을 축하드립니다.";
			response.sendRedirect("login.jsp");
		}
%>
<script>
alert(<%=msg%>);
</script>