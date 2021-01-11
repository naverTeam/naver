<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="blog.BlogPostBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="blogPostMgr" class="blog.BlogPostMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String) session.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>blog_topic</title>
	<link rel="stylesheet" href="./resources/css/blog_style.css">
	<script type="text/javascript" src="./resources/js/script.js"></script>
</head>
<body>
	<div id="root">
		
		<div id="searchBar-blog">
			<div class="blog-navbar-left">
				<a href="../chu/index.jsp" style="width: 81px; height: 26px; margin-left: 18%;">
					<img src="./resources/img/logo-md.png" alt="img">
				</a> 
			</div>
			<div class="blog-navbar-right">
			</div> 
		</div>
		
		<div id="categoryWrap">
			<div id="categoryBar">
				<div class="category"><a href="../blog/blog_main.jsp">블로그 홈</a></div>
				<div class="category"><a href="blog_topic.jsp"><font color="#19ce60"><strong>주제별 인기글</strong></font></a></div>
			</div>
		</div>
		<div id="container">
		
			<div class="conLeft">
				
				<div class="blogWrap-topic">
				
				<form style="width:100%;">
				
					<div class="blogCategoryBar-topic">
						<div class="blogCategory">
							<input type="submit" name="topic" value="IT" class="fullLink-col-bg"></div>
						<div class="blogCategory">
							<input type="submit" name="topic"  value="일상" class="fullLink-col-bg"></div>
						<div class="blogCategory">
							<input type="submit" name="topic"  value="취미" class="fullLink-col-bg"></div>
						<div class="blogCategory">
							<input type="submit" name="topic"  value="요리" class="fullLink-col-bg"></div>
					</div>
					<%
							String topic = request.getParameter("topic");
							if(topic==null) topic="IT";
							BlogPostBean hotBean = blogPostMgr.getHotPost(topic);
							String hTitle = hotBean.getPostTitle();
							String hImg = hotBean.getPostImg();
							String hDesc = hotBean.getPostText();
					%>
				</form>
					<div style="margin-top: 10px; align-self: flex-start;"><strong><%=topic %></strong> 오늘의 글</div>
					<div class="blogItems-topic">
						<div class="blogLeft-topic">
							<a href="#" class="fullLink-col">
							
								<img class="thumb-lg" src="../blog/data/<%=hImg %>" alt="img">
								<span class="spanHeader-lg"><%=hTitle %></span>
								<%-- <span class="spanDesc"><%=hDesc %></span> --%>
							</a>
						</div>
						<div class="blogRight-topic">
						<%
								Vector<BlogPostBean> bVlist = new Vector<BlogPostBean>();
								bVlist = blogPostMgr.getMainList(topic);
								for(int i=0; i<bVlist.size(); i++){
									BlogPostBean bean = bVlist.get(i);
									String bId = bean.getId();
									int postNo = bean.getPostNo();
									int cateNum = bean.getPostCNum();
									String bTitle = bean.getPostTitle();
									String bImg = bean.getPostImg();
									String bDesc = bean.getPostText();
						%>
							<div class="blogRightItem-topic">
								<a href="../blog/blog_<%=bId %>.jsp?cateNum=<%=cateNum %>&postNo=<%=postNo %>" class="fullLink-row">
									<img class="thumb-md" src="../blog/data/<%=bImg %>" alt="img">
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
						<div><a href="../member/logout.jsp">로그아웃</a></div>
					</div>
					<div class="loginBoxBottom" style="justify-content: space-around;">
						<div class="loginBoxBottom-item">My 지식인</div>
						<div class="loginBoxBottom-item"><a href="../blog/blog_<%=id%>_welcome.jsp">My 블로그</a></div>
						<div class="loginBoxBottom-item">My 쇼핑</div>
					</div>
				</div>
				<%} else { %>
				<div class="loginBox">
					<div class="loginBoxTop">
						<input class="loginButton" onclick="location.href='../member/login.jsp'" type="button" value="로그인">
					</div>
					<div class="loginBoxBottom">
						<div class="loginBoxBottomLeft">
							<span style="margin-left: 10px;"><a href="../member/member.jsp">회원가입</a></span>
						</div>
						<div class="loginBoxBottomRight">
							<span style="margin-right: 10px;"><a href="../member/find_id.jsp">ID/PWD 찾기</a></span>
						</div>
					</div>
				</div>
				<%} %>
				
				<div class="weatherBox">날씨</div>
				<div class="shopBox">
				


					<div class="shopItem">
						<a class="shopLink" href="">
								<img class="thumb-shop" src="./resources/img/" alt="img">
								<span class="spanHeader-sm"></span>
							</a>
					</div>					
				
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>