<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="member.MemberMgr"/>
<jsp:useBean id="bean" class="member.MemberBean"/>
<%
		bean.setId(request.getParameter("id"));
		bean.setName(request.getParameter("name"));
		bean.setPwd(request.getParameter("pwd1"));
		bean.setBirth_yyyy(request.getParameter("birth1"));
		bean.setBirth_mm(request.getParameter("birth2"));
		bean.setBirth_dd(request.getParameter("birth3"));
		bean.setGender(request.getParameter("gender"));
		bean.setPhone(request.getParameter("phone"));
		
		String id = request.getParameter("id");	
		
		boolean result = mgr.insertMember(bean);
		if(result){%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<div id="ex1" class="modal">
  <p>�ȳ��ϼ���. ���â���� ����κ��Դϴ�.</p>
</div>
<%	response.sendRedirect("login.jsp");}%>