<%@ page  contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="in.QuestionMgr" />
<jsp:useBean id="amgr" class="in.AnswerMgr" />
<jsp:useBean id="bean" class="in.AnswerBean" />
<jsp:setProperty property="*" name="bean"/>
<%
			boolean result = amgr.insertAnswer(bean);
			String msg = "등록실패";
			String url = "naverin_main.jsp";
			 
			if(result){ 
			msg = "답변이 작성 되었습니다.";
			url = "boardRead.jsp";
			mgr.answerAdd(bean.getQnum(),1); 
			}
%>
<script type="text/javascript">
 	alert("<%=msg%>");
 	location.href = "<%=url%>?qnum=<%=bean.getQnum()%>";
</script>