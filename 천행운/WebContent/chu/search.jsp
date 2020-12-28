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
				<div class="category"><a><font color="#19ce60"><strong>통합검색</strong></font></a></div>
				<div class="category"><a href="search_blog.jsp?keyWord=<%=keyWord%>">블로그</a></div>
				<div class="category">지식인</div>
				<div class="category">쇼핑</div>
			</div>
		</div>
		<div id="container">
			<div class="conLeft">
				<div class="blogWrap-search">
					<div class="wrapTitle-search">
						<span class="wrapTitleSpan">블로그</span>
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
									<span class="spanInfo-search">아이디 | 작성시간</span>
								</div>
							</a>
						</div>
					<%} %>
					<button class="moreBtn" onclick="location.href='search_blog.jsp?keyWord=<%=keyWord%>'">더보기</button>
					</div>
				</div>
				
				<div class="space"></div>
				
				<div class="blogWrap-search">
					<div class="wrapTitle">
						<span class="wrapTitleSpan">지식인</span>
					</div>
					<div class="blogItems-search">
						<div class="blogItem-search">
							<img class="thumb-search" alt="img">
							<div class="blogSpan">
								<span class="spanHeader-search">제목</span>
								<span class="spanDesc-search">내용</span>
								<span class="spanInfo-search">아이디 | 작성시간</span>
							</div>
						</div>
						<div class="blogItem-search">
							<img class="thumb-search"  alt="img">
							<div class="blogSpan">
								<span class="spanHeader-search">제목</span>
								<span class="spanDesc-search">내용</span>
								<span class="spanInfo-search">아이디 | 작성시간</span>
							</div>
						</div>
						<div class="blogItem-search">
							<img class="thumb-search"  alt="img">
							<div class="blogSpan">
								<span class="spanHeader-search">제목</span>
								<span class="spanDesc-search">내용</span>
								<span class="spanInfo-search">아이디 | 작성시간</span>
							</div>
						</div>
					</div>
					<button class="moreBtn">더보기</button>
				</div>
				
			</div>
			
			<div class="conRight">
			
				<div class="loginBox">
					<div class="loginBoxTop">
						<input class="loginButton" onclick="location.href='../joon/login.jsp'" type="button" value="로그인">
					</div>
					<div class="loginBoxBottom">
						<div class="loginBoxBottomLeft">
							<span style="margin-left: 10px;"><a href="../joon/member.jsp">회원가입</a></span>
						</div>
						<div class="loginBoxBottomRight">
							<span style="margin-right: 10px;"><a href="#">ID 찾기</a></span>
						</div>
					</div>
				</div>
				
				<div class="weatherBox">날씨</div>
				
			</div>
		</div>
	</div>
	
</body>
</html>