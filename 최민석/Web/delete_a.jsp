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
alert('답변이 삭제 되었습니다.');
location.href="boardRead.jsp?qnum=<%=qnum%>";
</script>