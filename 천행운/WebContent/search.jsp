<%@page import="naver.BlogBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"
				pageEncoding="EUC-KR"%>
<jsp:useBean id="bBean" class="naver.BlogBean"/>
<jsp:useBean id="bMgr" class="naver.BlogMgr"/>				
<%
		request.setCharacterEncoding("EUC-KR");
		String keyWord = request.getParameter("keyWord");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>search</title>
	<link rel="stylesheet" href="./resources/css/style.css">
	<script src="./resources/js/script.js"></script>
</head>
<body>
	<div id="root">
		<div id="searchBar-search">
			<img src="" alt="img">
			<input type="text" name="keyWord" value="<%=keyWord %>" style="width: 533px; height: 57px;">
			<input type="button" value="�˻�"> 
		</div>
		<div id="categoryWrap">
			<div id="categoryBar">
				<div class="category">���հ˻�</div>
				<div class="category">��α�</div>
				<div class="category">������</div>
				<div class="category">����</div>
			</div>
		</div>
		<div id="container">
			<div class="conLeft">
				<div class="blogWrap-search">
					<div class="wrapTitle">
						<span class="wrapTitleSpan">��α�</span>
					</div>
					<div class="blogItems-search">
					<%
							Vector<BlogBean> bVlist = bMgr.getBlogSearchList(keyWord);
							for(int i=0; i<bVlist.size(); i++){ 
								bBean = bVlist.get(i);
								String bTitle = bBean.getbTitle();
								String bImg = bBean.getbImg();
								String bDesc = bBean.getbDesc();
					%>
						<div class="blogItem-search"><%=bVlist.size() %>
							<img class="thumb-search" src="<%=bImg %>" alt="img">
							<div class="blogSpan">
								<span class="spanHeader-search"><%=bTitle %></span>
								<span class="spanDesc-search"><%=bDesc %></span>
								<span class="spanInfo-search">���̵� | �ۼ��ð�</span>
							</div>
						</div>
					<%} %>
					</div>
					<button class="moreBtn" onclick="location.href='search_blog.jsp?keyWord=<%=keyWord%>'">������</button>
				</div>
				
				<div class="space"></div>
				
				<div class="blogWrap-search">
					<div class="wrapTitle">
						<span class="wrapTitleSpan">������</span>
					</div>
					<div class="blogItems-search">
						<div class="blogItem-search">
							<img class="thumb-search" alt="img">
							<div class="blogSpan">
								<span class="spanHeader-search">����</span>
								<span class="spanDesc-search">����</span>
								<span class="spanInfo-search">���̵� | �ۼ��ð�</span>
							</div>
						</div>
						<div class="blogItem-search">
							<img class="thumb-search"  alt="img">
							<div class="blogSpan">
								<span class="spanHeader-search">����</span>
								<span class="spanDesc-search">����</span>
								<span class="spanInfo-search">���̵� | �ۼ��ð�</span>
							</div>
						</div>
						<div class="blogItem-search">
							<img class="thumb-search"  alt="img">
							<div class="blogSpan">
								<span class="spanHeader-search">����</span>
								<span class="spanDesc-search">����</span>
								<span class="spanInfo-search">���̵� | �ۼ��ð�</span>
							</div>
						</div>
					</div>
					<button class="moreBtn">������</button>
				</div>
				
				
				
			</div>
			<div class="conRight">
				<div class="loginBox">�α��ιڽ�</div>
				<div class="weatherBox">����</div>
				
			</div>
		</div>
	</div>
</body>
</html>