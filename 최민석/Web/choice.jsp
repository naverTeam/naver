<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <jsp:useBean id="amgr" class="in.AnswerMgr"/>
<%
	int anum = Integer.parseInt(request.getParameter("anum"));
	int qnum = Integer.parseInt(request.getParameter("qnum"));
	String msg = "ä�ý���";
	String url = "naverin_main.jsp";
	if(amgr.choiceAnswer(anum,qnum)){
		msg="�亯�� ä�� �Ͽ����ϴ�.";
		url="boardRead.jsp?qnum="+qnum;
	}

%>
<script>
alert('<%=msg%>');
location.href='<%=url%>';
</script>