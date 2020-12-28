<%@ page contentType="text/html; charset=EUC-KR"%>

<%
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("bid");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String topic = request.getParameter("topic");
		String category = request.getParameter("category");
%>
<%=id %><br>
<%=title %><br>
<%=contents %><br>
<%=topic %><br>
<%=category %><br>
<script>
	/* location.href="blog_cjsgoddns.jsp" */
</script>