<%@page import="naver.BlogBean"%>
<%@page import="naver.ADBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"
				pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="adBean" class="naver.ADBean"/>
<jsp:useBean id="adMgr" class="naver.ADMgr"/>
<jsp:useBean id="bMgr" class="naver.BlogMgr"/>
<jsp:useBean id="bBean" class="naver.BlogBean"/>

<%
		adBean = adMgr.getBannerAD();
		String bannerADIMG = adBean.getImg();
		String bannerADURL = adBean.getUrl();
		String keyWord = "";
		if(request.getParameter("keyWord") != null)
			keyWord = request.getParameter("keyWord");
		String id = (String) session.getAttribute("id");
%>		

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>index</title>
	<link rel="stylesheet" href="./resources/css/style.css">
	<script type="text/javascript" src="./resources/js/script.js"></script>
</head>
<body>
	<div id="root">
		<div id="portfolioLink">
			<a href="http://localhost/portFolioSite/index.html">포트폴리오</a>
		</div>
		<div id="searchBar">
			<a href="index.jsp">
				<img src="./resources/img/logo-lg.jpg" alt="img" style="width: 250px; height: 60px;">
			</a>
			<form class="searchFrm" name="searchFrm" action="search.jsp">
				<input type="text" name="keyWord" style="width: 533px; height: 57px; border: 2px solid #19ce60;">
				<input type="button" onclick="javascript:check()" style="width: 60px; height: 60px; border: 0; ">
			</form> 
		</div>
		<div id="categoryWrap-main">
			<div id="categoryBar">
				<div class="category"><a href="../blog/blog_main.jsp">블로그</a></div>
				<div class="category"><a href="../choi/naverin_main.jsp">지식인</a></div>
				<div class="category"><a href="../hok/mainTop.jsp">쇼핑</a></div>
				<div class="category"><a href="#">여행</a></div>
			</div>
		</div>
		<div id="container">
		
			<div class="conLeft">
				<div class="bannerAD">
					<a class="bannerLink" href="<%=bannerADURL%>">
						<img class="bannerImg" src="./resources/img/<%=bannerADIMG %>" alt="img">
					</a>
				</div>
				<div class="blogWrap">
					<div class="blogCategoryBar">
						<div class="blogCategory" style="background: #19ce60;">
							<a href="#" class="fullLink-col">IT</a></div>
						<div class="blogCategory">
							<a href="#" class="fullLink-col">일상</a></div>
						<div class="blogCategory">
							<a href="#" class="fullLink-col">취미</a></div>
						<div class="blogCategory">
							<a href="#" class="fullLink-col">요리</a></div>
					</div>
					<div class="blogItems">					
						<div class="blogLeft">
							<a href="#" class="fullLink-col">
							<%
									BlogBean hotBean = bMgr.getHotBlog();
									String hTitle = hotBean.getbTitle();
									String hImg = hotBean.getbImg();
									String hDesc = hotBean.getbDesc();
							%>
								<img class="thumb-lg" src="<%=hImg %>" alt="img">
								<span class="spanHeader-lg"><%=hTitle %></span>
								<span class="spanDesc"><%=hDesc %></span>
							</a>
						</div>
						<div class="blogRight">
						<%
								Vector<BlogBean> bVlist = new Vector<BlogBean>();
								bVlist = bMgr.getMainList();
								for(int i=0; i<bVlist.size(); i++){
									BlogBean bean = bVlist.get(i);
									String bImg = bean.getbImg();
									String bTitle = bean.getbTitle();
									String bDesc = bean.getbDesc();
						%>
							<div class="blogRightItem">
								<a href="#" class="fullLink-row">
									<img class="thumb-md" src="<%=bImg %>" alt="img">
									<span class="spanHeader-md"><%=bTitle %></span>
								</a>
							</div>
						<%	} %>
						</div>
					</div>
				</div>
			</div>
			
			<div class="conRight">
			
				<%if(id!=null&&!id.equals("")) {%>
				<div class="loginBox">
					<div class="loginBoxTop" style="flex-direction: column;">
						<div><strong><%=id %></strong>님 환영합니다.</div>
						<div><a href="../joon/logout.jsp">로그아웃</a></div>
					</div>
					<div class="loginBoxBottom" style="justify-content: space-around;">
						<div class="loginBoxBottom-item">My 지식인</div>
						<div class="loginBoxBottom-item"><a href="../blog/blog_<%=id%>.jsp">My 블로그</a></div>
						<div class="loginBoxBottom-item">My 쇼핑</div>
					</div>
				</div>
				<%} else { %>
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
				<div class="shopBox">
				<%
						Vector<ADBean> adVlist = new Vector<ADBean>();
						adVlist = adMgr.getADSide();
				%>
				<%for(int i=0; i<adVlist.size(); i++){ 
						ADBean bean = adVlist.get(i);
						String url = bean.getUrl();
						String img = bean.getImg();
						String desc = bean.getDesc();
				%>
					<div class="shopItem">
						<a class="shopLink" href="<%=url %>">
								<img class="thumb-shop" src="./resources/img/<%=img %>" alt="img">
								<span class="spanHeader-sm"><%=desc %></span>
							</a>
					</div>					
				<%} %>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>