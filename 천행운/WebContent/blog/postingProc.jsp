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
			alert("���ε忡 �����߽��ϴ�.");
<%			
			response.sendRedirect("blog_"+id+"_welcome.jsp");
		}
%>












