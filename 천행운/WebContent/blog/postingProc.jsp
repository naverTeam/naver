<%@page import="java.util.Collections"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Vector"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="postBean" class="blog.PostingBean"/>
<jsp:useBean id="postMgr" class="blog.PostingMgr"/>

<%
		String id = (String) session.getAttribute("id");
		if(id!=null&&!id.equals("")){
			postMgr.insertPost(request);
			response.sendRedirect("blog_"+id+"_welcome.jsp");
		} else {
%>			
			alert("업로드에 실패했습니다.");
<%			
			response.sendRedirect("blog_"+id+"_welcome.jsp");
		}
%>












