<%@page import="blog.BlogPostBean"%>
<%@page import="naver.BlogBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"
				pageEncoding="EUC-KR"%>
<jsp:useBean id="blogBean" class="blog.BlogPostBean"/>
<jsp:useBean id="searchBlogMgr" class="chu.SearchBlogMgr"/>		
<jsp:useBean id="blogMgr" class="blog.BlogMgr"/>		
<%
		request.setCharacterEncoding("EUC-KR");
		String keyWord = request.getParameter("keyWord");
		String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>통합검색결과</title>
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
				<div class="category"><a href="search_img.jsp?keyWord=<%=keyWord%>">이미지</a></div>
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
							Vector<BlogPostBean> bVlist = searchBlogMgr.getSearchBlog(keyWord);
							for(int i=0; i<bVlist.size(); i++){ 
								blogBean = bVlist.get(i);
								String bTitle = blogBean.getPostTitle();
								String bImg = blogBean.getPostImg();
								String bDesc = blogBean.getPostText();
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
					<%} %><%=bVlist.size() %>
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
			
				<%	if(id!=null&&!id.equals("")) {//로그인 상태 체크%>
					<%
							boolean flag = blogMgr.getBlogState(id);//로그인한 아이디가 블로그테이블에 존재하는지 체크
							if(flag==true){//존재한다면 My blog버튼으로
					%>
				<div class="loginBox">
					<div class="loginBoxTop" style="flex-direction: column;">
						<div><strong><%=id %></strong>님 환영합니다.</div>
						<div><a href="../joon/logout.jsp">로그아웃</a></div>
					</div>
					<div class="loginBoxBottom" style="justify-content: space-around;">
						<div class="loginBoxBottom-item">My 지식인</div>
						<div class="loginBoxBottom-item"><a href="../blog/blog_<%=id%>_welcome.jsp">My 블로그</a></div>
						<div class="loginBoxBottom-item">My 쇼핑</div>
					</div>
				</div>
					<%	} else {//존재하지 않으면 블로그 생성버튼으로%>
					<div class="loginBox">
					<div class="loginBoxTop" style="flex-direction: column; height: 30%;">
						<div><strong><%=id %></strong>님 환영합니다.</div>
						<div><a href="../joon/logout.jsp">로그아웃</a></div>
					</div>
					<div><strong>나만의 블로그를 만들어보세요!</strong></div>
					<div class="loginBoxBottom" style="justify-content: space-around;">
						<div class="loginBoxBottom-item">My 지식인</div>
						<div class="loginBoxBottom-item" style="background: #c9ffd1;"><a href="../blog/createBlogProc_____.jsp">블로그 생성</a></div>
						<div class="loginBoxBottom-item">My 쇼핑</div>
					</div>
				</div>
					
					<%	} %>
				<%} else {//로그인 하지 않은 경우 %>
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
				<%} %>
				
				<div class="weatherBox">날씨</div>
				
			</div>
		</div>
	</div>
	
</body>
</html>