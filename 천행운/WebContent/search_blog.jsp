<%@ page contentType="text/html; charset=EUC-KR"
				pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="adBean" class="naver.ADBean"/>
<jsp:useBean id="adMgr" class="naver.ADMgr"/>
<%
		String keyWord = request.getParameter("keyWord");
		adBean = adMgr.getBannerAD();
		String bannerADIMG = adBean.getImg();
		String bannerADURL = adBean.getUrl();
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
			<input type="button" value="검색"> 
		</div>
		<div id="categoryWrap">
			<div id="categoryBar">
				<div class="category"><a href="#">통합검색</a></div>
				<div class="category">블로그</div>
				<div class="category">지식인</div>
				<div class="category">쇼핑</div>
			</div>
		</div>
		<div id="container">
			<div class="conLeft">
				<div class="blogWrap-search-blog">
					<div class="wrapTitle">
						<span class="wrapTitleSpan">블로그</span>
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
						<div class="blogItem-search">
							<img class="thumb-search"  alt="img">
							<div class="blogSpan">
								<span class="spanHeader-search">제목</span>
								<span class="spanDesc-search">내용</span>
								<span class="spanInfo-search">아이디 | 작성시간</span>
							</div>
						</div>
					</div>
					<button class="moreBtn" onclick="location.href='search_blog.jsp?keyWord=<%=keyWord%>'">더보기</button>
				</div>
				
				
			</div>
			<div class="conRight">
				<div class="loginBox">
					<div class="loginBoxTop">
						<input class="loginButton" onclick="location.href='login.jsp'" type="button" value="로그인">
					</div>
					<div class="loginBoxBottom">
						<div class="loginBoxBottomLeft">
							<span style="margin-left: 10px;"><a href="#">회원가입</a></span>
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