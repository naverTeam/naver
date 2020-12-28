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
			<a href="index.jsp" style="width: 26px; height: 26px;">
				<img src="./resources/img/logo-sm.png" alt="img" style="margin-right: 20px;">
			</a>
			<div style="border-right: 1px solid #e4e8eb; height: 23px; padding-right: 5px; margin-right: 5px;"></div>
			<form class="searchFrm" name="searchFrm" action="search.jsp">
				<input type="text" name="keyWord" value="<%=keyWord %>" style="width: 533px; height: 40px; border: none;">
				<input type="button" onclick="javascript:check()" style="width: 60px; height: 60px; border: 0;">			 
			</form>
		</div>
		
		<div id="categoryWrap">
			<div id="categoryBar">
				<div class="category"><a><font color="#19ce60"><strong>���հ˻�</strong></font></a></div>
				<div class="category"><a href="search_blog.jsp?keyWord=<%=keyWord%>">��α�</a></div>
				<div class="category">������</div>
				<div class="category">����</div>
			</div>
		</div>
		<div id="container">
			<div class="conLeft">
				<div class="blogWrap-search">
					<div class="wrapTitle-search">
						<span class="wrapTitleSpan">��α�</span>
					</div>
					<div class="blogItems-search">
					<%
							Vector<BlogBean> bVlist = bMgr.getBlogInSearch(keyWord);
							for(int i=0; i<bVlist.size(); i++){ 
								bBean = bVlist.get(i);
								String bTitle = bBean.getbTitle();
								String bImg = bBean.getbImg();
								String bDesc = bBean.getbDesc();
					%>
						<div class="blogItem-search">
							<a href="#" class="fullLink-row">
								<img class="thumb-search" src="<%=bImg %>" alt="img">
								<div class="blogSpan">
									<span class="spanHeader-search"><%=bTitle %></span>
									<span class="spanDesc-search"><%=bDesc %></span>
									<span class="spanInfo-search">���̵� | �ۼ��ð�</span>
								</div>
							</a>
						</div>
					<%} %>
					<button class="moreBtn" onclick="location.href='search_blog.jsp?keyWord=<%=keyWord%>'">������</button>
					</div>
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
			
				<div class="loginBox">
					<div class="loginBoxTop">
						<input class="loginButton" onclick="location.href='../joon/login.jsp'" type="button" value="�α���">
					</div>
					<div class="loginBoxBottom">
						<div class="loginBoxBottomLeft">
							<span style="margin-left: 10px;"><a href="../joon/member.jsp">ȸ������</a></span>
						</div>
						<div class="loginBoxBottomRight">
							<span style="margin-right: 10px;"><a href="#">ID ã��</a></span>
						</div>
					</div>
				</div>
				
				<div class="weatherBox">����</div>
				
			</div>
		</div>
	</div>
	
</body>
</html>