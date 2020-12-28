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
				<div class="blog-navbar-left">
					<a href="../chu/index.jsp" style="width: 81px; height: 26px; margin-left: 18%;">
						<img src="./resources/img/logo-md.png" alt="img">
					</a> 
				</div>
				<div class="blog-navbar-right">
					<select>
						<option>이웃블로그
					</select>
					<div><a href="../joon/logout.jsp">로그아웃</a></div> 
				</div>
			</div>
		</div> 
			<div id="container-update">
				<div class="container-update-top">
					<div class="profileUpdate">
						<div class="profileUpdateItem">
							<span style="margin-right: 5px;">배너이미지 : </span>
							<input type="file">
						</div>
						<div class="profileUpdateItem">
							<span style="margin-right: 5px;">프로필사진 : </span>
							<input type="file">
						</div>
						<div class="profileUpdateItem">
							<span style="margin-right: 5px;">프로필소개 : </span>
							<textarea rows="8" cols="25" style="resize: none;"></textarea>
						</div>
					</div>
					<div class="categoryUpdate">
						<div class="categoryUpdateItem">카테고리1 수정</div>
						<div class="categoryUpdateItem">카테고리2 수정</div>
						<div class="categoryUpdateItem">카테고리3 수정</div>
					</div>
				</div>
				<div class="container-update-bottom">
					<div>수정취소</div>
					<div><small style="padding: 5px;">l</small></div>
					<div>수정</div>
				</div>
				
			</div>
	</div>
</body>
</html>