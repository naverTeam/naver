<%@page import="blog.BlogPostBean"%>
<%@page import="blog.CateBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="blogBean" class="blog.BlogBean"/>
<jsp:useBean id="blogMgr" class="blog.BlogMgr"/>
<jsp:useBean id="cateBean" class="blog.CateBean"/>
<jsp:useBean id="cateMgr" class="blog.CateMgr"/>
<jsp:useBean id="postMgr" class="blog.BlogPostMgr"/>
<%
		String id = "cjsgoddns";
		blogBean = blogMgr.getBlogPage(id);
		String blogBanner = blogBean.getBannerImg();
		String blogProfileDesc = blogBean.getProfileDesc();
		String blogProfileImg = blogBean.getProfileImage();
		String sid = (String) session.getAttribute("id");
		
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>blog</title>
	<link rel="stylesheet" href="./resources/css/blog_style.css">
	<script type="text/javascript" src="./resources/js/script.js"></script>
</head>
<body>
	<div id="root">
		
		<div id="blog-navBarWrap">
			<div class="blog-navbar">
				<div class="blog-navbar-left">
					<a href="../chu/index.jsp" style="width: 81px; height: 26px; margin-left: 18%;">
						<img src="./resources/img/logo-md.png" alt="img">
					</a> 
				</div>
				<div class="blog-navbar-right">
					<%if(sid!=null&&!sid.equals("")){ %>
					<div><a href="../member/logout.jsp">로그아웃</a></div>
						<%if(sid!=id&&!sid.equals(id)){ %>
					<div><a href="blog_<%=sid%>.jsp">내 블로그</a></div>
						<%} %>
					<%}else{ %> 
					<div><a href="../member/login.jsp">로그인</a></div>
					<%} %>
				</div>
			</div>
		</div>
		<div id="mainImgWrap">
			<div style="height: 100%;">
				<img class="bannerImg" src="./resources/img/<%=blogBanner %>">
			</div>
		</div>
		
		<div id="container">
		
			<div class="blog-conLeft">
				
				<div class="blog-profileWrap">
					<div class="blog-profileImg">
						<div style="width: 100%; height: 100%;">
							<img src="./resources/img/<%=blogProfileImg %>" style="width: 100%; height: 100%;">
						</div>
					</div>
					<div class="blog-profileId">					
						<div><strong><%=id %>님의 블로그</strong></div>
					</div>
					<div class="blog-profileDesc">
						<div><%=blogProfileDesc %></div>
					</div>
				</div>
				<%if(sid!=null&&sid.equals(id)){ %>
				<div style="margin-top: 5px;">
					<a href="blog_<%=id%>_posting.jsp">글쓰기 </a><small style="padding: 5px;"> / </small>
					<a href="blog_<%=id%>_setting.jsp"> 설정</a>
				</div>
				<%}else{ %>
				<div style="margin-top: 5px;">
					<a href="neighborProc.jsp">이웃신청 </a>
				</div>
				<%} %>
				<div class="blog-postCategorys">					
					
						<div>
							<div class="pCategory-head"><strong>카테고리</strong></div>
							<%
									Vector<CateBean> cateVlist = new Vector<CateBean>();
									cateVlist = cateMgr.getBlogCategory(id);
									for(int i=0; i<cateVlist.size(); i++){
										cateBean = cateVlist.get(i);
										String cateName = cateBean.getBlogCateName();
										int cateNum = cateBean.getBlogCateNum();
							%>
							
							<div class="pCategory">
							<form class="categoryFrm" action="blog_<%=id%>.jsp?cateNum=<%=cateNum%>">
								<input type="submit" class="textbtn" name="category" value="<%=cateName%>">
								<input type="hidden" name="cateNum" value="<%=i+1%>">
							</form>
							</div>
							
							<%	} %>
								
						</div>
					
				</div>
				
			</div>
			
			
			<div class="blog-conRight">
			<%
						BlogPostBean bean = postMgr.getNewPost(id);
						int postNo = bean.getPostNo();
						String title = bean.getPostTitle();
						String text = bean.getPostText();
						String date = bean.getPostDate();
						int like = bean.getPostLike();
						int view = bean.getPostView();
			%>
				<div class="postWrap">
					<div class="postTitle">
						<span class="postSpan-lg">제목: <%=title %></span>
					</div>
					<div class="postContents">
						<%=text %>
					</div>
					<div class="postLike">
						<span class="postSpan-sm">좋아요: <%=like %></span>
					</div>
					<div class="postDate">
						<span class="postSpan-sm">게시일: <%=date %></span>
					</div>
				</div>
				
			<%
						BlogPostBean bean2 = postMgr.getMaxLikePost(id);
						int postNo2 = bean2.getPostNo();
						String title2 = bean2.getPostTitle();
						String text2 = bean2.getPostText();
						String date2 = bean2.getPostDate();
						int like2 = bean2.getPostLike();
						int view2 = bean2.getPostView();
			%>
				<div class="postWrap">
					<div class="postTitle">
						<span class="postSpan-lg">제목: <%=title2 %></span>
					</div>
					<div class="postContents">
						<%=text2 %>
					</div>
					<div class="postLike">
						<span class="postSpan-sm">좋아요: <%=like2 %></span>
					</div>
					<div class="postDate">
						<span class="postSpan-sm">게시일: <%=date2 %></span>
					</div>
				</div>
				
				
			</div>	
					
		</div>
	</div>
</body>
</html>