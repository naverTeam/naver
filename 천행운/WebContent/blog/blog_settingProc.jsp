<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="blog.SettingMgr"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=EUC-KR"%>

<%
		request.setCharacterEncoding("EUC-KR");
		MultipartRequest multi = new MultipartRequest(
				request, SettingMgr.SAVEFOLDER, SettingMgr.MAXSIZE, SettingMgr.ENCTYPE, 
				new DefaultFileRenamePolicy());
		
		String bannerImg = multi.getFilesystemName("bannerImg");
		String profileImg = multi.getFilesystemName("profileImg");
		String profileDesc = multi.getParameter("profileDesc");
		String category[] = multi.getParameterValues("category");
%>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
</head>
<body>
	<%=bannerImg %>
	<%=profileImg %>
	<%=profileDesc %>
	
	<%	for(int i=0; i<category.length; i++){%>
				<%=category[i] %>
	<%	}%>	
</body>
</html>