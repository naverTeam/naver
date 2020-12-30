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
	배너 사진: <%=bannerImg %><br>
	프로필 사진: <%=profileImg %><br>
	인사말: <%=profileDesc %><br>
	카테고리: 
	<%	for(int i=0; i<category.length; i++){%>
				<%=category[i] %><br>
	<%	}%>	
</body>
</html>