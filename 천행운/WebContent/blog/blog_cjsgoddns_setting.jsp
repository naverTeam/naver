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
						<option>�̿���α�
					</select>
					<div><a href="../joon/logout.jsp">�α׾ƿ�</a></div> 
				</div>
			</div>
		</div> 
			<div id="container-update">
				<div class="container-update-top">
					<div class="profileUpdate">
						<div class="profileUpdateItem">
							<span style="margin-right: 5px;">����̹��� : </span>
							<input type="file">
						</div>
						<div class="profileUpdateItem">
							<span style="margin-right: 5px;">�����ʻ��� : </span>
							<input type="file">
						</div>
						<div class="profileUpdateItem">
							<span style="margin-right: 5px;">�����ʼҰ� : </span>
							<textarea rows="8" cols="25" style="resize: none;"></textarea>
						</div>
					</div>
					<div class="categoryUpdate">
						<div class="categoryUpdateItem">ī�װ�1 ����</div>
						<div class="categoryUpdateItem">ī�װ�2 ����</div>
						<div class="categoryUpdateItem">ī�װ�3 ����</div>
					</div>
				</div>
				<div class="container-update-bottom">
					<div>�������</div>
					<div><small style="padding: 5px;">l</small></div>
					<div>����</div>
				</div>
				
			</div>
	</div>
</body>
</html>