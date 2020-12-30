<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="bMgr" class="blog.BlogMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = "djqtsmsepd";
		boolean flag = bMgr.getBlogState(id);
		String msg = "";
		if(flag==true)
			msg = "블로그 존재함";
		else
			msg = "블로그 없네요";
%>
<html>
	<%=msg %>
</html>