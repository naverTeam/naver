<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="postBean" class="blog.PostingBean"/>
<jsp:useBean id="postMgr" class="blog.PostingMgr"/>

<%
		//String id = request.getParameter("bid");//히든으로 넘어옴 인데 왜 안되지 멀티로 받아야 하는 듯 테스트해보기
		String id = (String) session.getAttribute("id");
		if(id!=null&&!id.equals("")){
			postMgr.insertPost(request);
			response.sendRedirect("blog_"+id+"_welcome.jsp");
		}
%>