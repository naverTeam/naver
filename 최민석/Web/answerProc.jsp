<%@ page  contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="in.QuestionMgr" />
<jsp:useBean id="bean" class="in.AnswerBean" />
<jsp:setProperty property="*" name="bean"/>
<%
			boolean result = mgr.insertAnswer(bean);
			String msg = "��Ͻ���";
			String url = "navberin_main.jsp";
			
			if(result){
			msg = "�亯�� �ۼ� �Ǿ����ϴ�.";
			url = "boardRead.jsp";
			}


%>
<script type="text/javascript">
 	alert("<%=bean.getQnum()%>");
 	location.href = "<%=url%>?qnum=<%=bean.getQnum()%>";
</script>