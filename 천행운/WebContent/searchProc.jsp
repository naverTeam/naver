<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String keyWord ="";
		if(request.getParameter("keyWord") != null)
			keyWord = request.getParameter("keyWord");
		response.sendRedirect("search.jsp");
%>