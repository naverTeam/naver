<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="postBean" class="blog.PostingBean"/>
<jsp:useBean id="postMgr" class="blog.PostingMgr"/>

<%
		//String id = request.getParameter("bid");//�������� �Ѿ�� �ε� �� �ȵ��� ��Ƽ�� �޾ƾ� �ϴ� �� �׽�Ʈ�غ���
		String id = (String) session.getAttribute("id");
		if(id!=null&&!id.equals("")){
			postMgr.insertPost(request);
			response.sendRedirect("blog_"+id+"_welcome.jsp");
		}
%>