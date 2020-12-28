<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="postBean" class="blog.PostingBean"/>
<jsp:useBean id="postMgr" class="blog.PostingMgr"/>

<%
		
%>




<%
		postMgr.insertPost(request);
		response.sendRedirect("blog_cjsgoddns_posting.jsp");
%>