<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="bMgr" class="blog.BlogMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = "djqtsmsepd";
		boolean flag = bMgr.getBlogState(id);
		String msg = "";
		if(flag==true)
			msg = "��α� ������";
		else
			msg = "��α� ���׿�";
%>
<html>
	<%=msg %>
</html>