<%@page import="chu.UtilMgr"%>
<%@page import="blog.BlogPostBean"%>
<%@page import="naver.BlogBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"
				pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="blogBean" class="blog.BlogPostBean"/>
<jsp:useBean id="searchBlogMgr" class="chu.SearchBlogMgr"/>		
<jsp:useBean id="blogMgr" class="blog.BlogMgr"/>	
<%
		String keyWord = request.getParameter("keyWord");
		int totalRecord = 0;
		int numPerPage = 10;
		int pagePerBlock = 10;
		int totalPage = 0;
		int totalBlock = 0;
		int nowPage = 1;
		int nowBlock = 1;
		
		if(request.getParameter("numPerPage") != null){
			numPerPage = UtilMgr.parseInt(request, "numPerPage");
		}
		
		if(request.getParameter("keyWord") != null){}
		
		if(request.getParameter("reload") != null && request.getParameter("reload").equals("true")){}
		totalRecord = searchBlogMgr.getTotalCount(keyWord);		
		if(request.getParameter("nowPage") != null){
			nowPage = UtilMgr.parseInt(request, "nowPage");
		}
		
		int start = (nowPage*numPerPage)-numPerPage;
		int cnt = numPerPage;
		
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
		
		String id = (String) session.getAttribute("id");
		
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>블로그 검색결과</title>
	<link rel="stylesheet" href="./resources/css/style.css">
	<script src="./resources/js/script.js"></script>
</head>
<body>
	<div id="root">
	
		<div id="searchBar-search">
			<a href="index.jsp" style="width: 26px; height: 26px;">
				<img src="./resources/img/logo-sm.png" alt="img">
			</a>
			<div style="border-right: 1px solid #e4e8eb; height: 23px; padding-right: 5px; margin-right: 5px;"></div>
			<input type="text" name="keyWord" value="<%=keyWord %>" style="width: 533px; height: 40px; border: none;">
			<input type="button" onclick="javascript:check()" style="width: 60px; height: 60px; border: 0;"> 
		</div>
		
		<div id="categoryWrap">
			<div id="categoryBar">
				<div class="category"><a href="search.jsp?keyWord=<%=keyWord%>">통합검색</a></div>
				<div class="category"><a><font color="#19ce60"><strong>블로그</strong></font></a></div>
				<div class="category">지식인</div>
				<div class="category">쇼핑</div>
				<div class="category"><a href="search_img.jsp?keyWord=<%=keyWord%>">이미지</a></div>
			</div>
		</div>
		<div id="container">
			<div class="conLeft">
				<div class="blogWrap-search-blog">
					<div class="wrapTitle">
						<span class="wrapTitleSpan">블로그</span>
					</div>
					<div class="blogItems-search">
					
					<%
							Vector<BlogPostBean> bVlist = searchBlogMgr.getSearchBlogOnly(keyWord);
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
					<%} %>
					
					</div>
					<div class="pageANDblock" style="margin-top: 20px;">
						<!-- 페이징 및 블럭 Start -->
						<!-- 이전 블럭 -->
							<%if(nowBlock>1){ %>
							<a href="javascript:block('<%=nowBlock-1 %>')">&lt;&lt;</a>
							<%} %>
							<!-- 페이징 -->
							<%
									int pageStart = (nowBlock-1)*pagePerBlock+1;
									int pageEnd = (pageStart+pagePerBlock)<totalPage ? pageStart+pagePerBlock : totalPage+1;
									for(; pageStart<pageEnd;pageStart++){
							%>
							<a href="javascript: pageing('<%=pageStart%>')">
								<%if(nowPage==pageStart){%><font color="blue"><%} %>
								[<%=pageStart %>]
								<%if(nowPage==pageStart){%></font><%} %>
							</a>
							<%	}//for%>
							<!-- 다음 블럭 -->
							<%if(totalBlock>nowBlock){ %>
							<a href="javascript:block('<%=nowBlock+1 %>')">>></a>
							<%} %>
						<!-- 페이징 및 블럭 End -->
					</div>
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
	<form name="readFrm">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="num">
</form>
<script type="text/javascript">
function numPerFn(numPerPage) {
	//alert(numPerPage);
	document.readFrm.numPerPage.value = numPerPage;
	document.readFrm.submit();
}
function pageing(page) {
	document.readFrm.nowPage.value=page;
	document.readFrm.submit();
}
function block(block) {
	document.readFrm.nowPage.value=<%=pagePerBlock%>*(block-1)+1;
	document.readFrm.submit();
}
</script>
</body>
</html>