<%@ page  contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="in.QuestionMgr" />
<jsp:useBean id="bean" class="in.AnswerBean" />
<jsp:setProperty property="*" name="bean"/>
<%
			boolean result = mgr.insertAnswer(bean);
			String msg = "등록실패";
			String url = "navberin_main.jsp";
			
			if(result){
			msg = "답변이 작성 되었습니다.";
			url = "boardRead.jsp";
			}


%>
<script type="text/javascript">
 	alert("<%=bean.getQnum()%>");
 	location.href = "<%=url%>?qnum=<%=bean.getQnum()%>";
</script>