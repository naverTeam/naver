<%@page import="in.UtilMgr"%>
<%@page import="in.AnswerBean"%>
<%@page import="java.util.Vector"%>
<%@page import="in.QuestionBean"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="in.AnswerMgr" />
<%
		request.setCharacterEncoding("EUC-KR");
		String content = request.getParameter("content");
		int anum = Integer.parseInt(request.getParameter("anum"));
		int qnum = Integer.parseInt(request.getParameter("qnum"));
		mgr.updateAnswer(anum, content);
%>
<script type="text/javascript">
alert('수정이 완료 되었습니다.');
location.href="boardRead.jsp?qnum="+<%=qnum%>;
</script>