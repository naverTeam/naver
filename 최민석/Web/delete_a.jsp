<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="in.AnswerMgr" />
<jsp:useBean id="qmgr" class="in.QuestionMgr" />
<%request.setCharacterEncoding("EUC-KR");
		int anum = Integer.parseInt(request.getParameter("anum"));
		int qnum = Integer.parseInt(request.getParameter("qnum"));
		mgr.deleteAnswer(anum);
		qmgr.answerAdd(qnum,-1);
%>
<script>
alert('�亯�� ���� �Ǿ����ϴ�.');
location.href="boardRead.jsp?qnum=<%=qnum%>";
</script>