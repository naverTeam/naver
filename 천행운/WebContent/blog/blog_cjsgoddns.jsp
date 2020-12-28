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
				<select>
					<option>이웃블로그
				</select> 
			</div>
		</div>
		
		<div id="mainImgWrap">
			<div><img src="./resources/img/<%=blogBanner %>"></div>
		</div>
		<div id="container">
		
			<div class="blog-conLeft">
				
				<div class="blog-profileWrap">
					<div class="blog-profileImg">
						<div><img src="./resources/img/<%=blogProfileImg %>"></div>
					</div>
					<div class="blog-profileId">					
						<div><%=id %>님의 블로그</div>
					</div>
					<div class="blog-profileDesc">
						<div><%=blogProfileDesc %></div>
					</div>
				</div>
				<div style="margin-top: 5px;">글쓰기</div>
				<div class="blog-postCategorys">					
					<form class="categoryFrm">
						<ul>
							<li class="pCategory"><strong>카테고리</strong></li>
							<%
									Vector<CateBean> cateVlist = new Vector<CateBean>();
									cateVlist = cateMgr.getBlogCategory(id);
									for(int i=0; i<cateVlist.size(); i++){
										cateBean = cateVlist.get(i);
										String cateName = cateBean.getBlogCateName();
										int cateNum = cateBean.getBlogCateNum();
							%>
							
							<li class="pCategory">
								<input type="submit" class="textbtn" name="category" value="<%=cateName%>"></li>
							
							<%	} %>
								
						</ul>
					</form>
				</div>
				
			</div>
			
			
			<div class="blog-conRight">
			<%
					Vector<BlogPostBean> postVlist = new Vector<BlogPostBean>();
					String cateName = request.getParameter("category");
					postVlist = postMgr.getPostList(id, cateName);
					for(int i=0; i<postVlist.size(); i++){
						BlogPostBean bean = postVlist.get(i);
						String title = bean.getPostTitle();
						String text = bean.getPostText();
						int like = bean.getPostLike();
						int view = bean.getPostView();
			%>
				<div class="postWrap"><%=cateName %>
					<div>제목: <%=title %></div>
					<div>내용 <%=text %></div>
					<div>좋아요: <%=like %></div>
				</div>
			<%	} %>
				<div class="postListWrap">
					<div class="postListTop">
						<div>IT 9개의 글</div>
						<select>
							<option>5줄 보기</option>
							<option>10줄 보기</option>
							<option>15줄 보기</option>
						</select>
					</div>
					<div class="postListBottom">
						<table style="width: 95%;">
							<thead>
								<tr>
									<td style=" width:80%">제목</td>
									<td style="width:10%">작성일</td>
									<td style="width:10%">조회수</td>
								<tr>
							</thead>
							<tbody>
							<%
									postVlist = postMgr.getPostList(id, cateName);
									for(int i=0; i<postVlist.size(); i++){
										BlogPostBean bean = postVlist.get(i);
										String title = bean.getPostTitle();
										String date = bean.getPostDate();
										int view = bean.getPostView();
							%>
								<tr>
									<td style=" width:80%"><%=title %></td>
									<td style="width:10%"><%=date %></td>
									<td style="width:10%"><%=view %></td>
								<tr>
							<%	} %>
							</tbody>
						</table>
					</div>
				</div>
			</div>			
		</div>
	</div>
</body>
</html>