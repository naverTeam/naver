<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="in.QuestionMgr" />
<%
		request.setCharacterEncoding("EUC-KR");

		int qnum=0;
		if(request.getParameter("qnum")!=null){
		qnum = Integer.parseInt(request.getParameter("qnum"));
		mgr.deleteQuestion(qnum);
		}
		%>
<script>
   alert('�Խù��� ���� �Ǿ����ϴ�.');
   location.href="naverin_main.jsp"; 
</script>
