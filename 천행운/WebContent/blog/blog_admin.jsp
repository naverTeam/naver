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
		String id = "admin";
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
					<div><a href="../joon/logout.jsp">�α׾ƿ�</a></div>
						<%if(sid!=id&&!sid.equals(id)){ %>
					<div><a href="blog_<%=sid%>.jsp">�� ��α�</a></div>
						<%} %>
					<%}else{ %> 
					<div><a href="../joon/login.jsp">�α���</a></div>
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
						<div><strong><%=id %>���� ��α�</strong></div>
					</div>
					<div class="blog-profileDesc">
						<div><%=blogProfileDesc %></div>
					</div>
				</div>
				<%if(sid!=null&&sid.equals(id)){ %>
				<div style="margin-top: 5px;">
					<a href="blog_<%=id%>_posting.jsp">�۾��� </a><small style="padding: 5px;"> / </small>
					<a href="blog_<%=id%>_setting.jsp"> ����</a>
				</div>
				<%} %>
				<div class="blog-postCategorys">					
					
						<div>
							<div class="pCategory"><strong>ī�װ�</strong></div>
							<%
									Vector<CateBean> cateVlist = new Vector<CateBean>();
									cateVlist = cateMgr.getBlogCategory(id);
									for(int i=0; i<cateVlist.size(); i++){
										cateBean = cateVlist.get(i);
										String cateName = cateBean.getBlogCateName();
										int cateNum = cateBean.getBlogCateNum();
							%>
							
							<div class="pCategory">
							<form class="categoryFrm">
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
					Vector<BlogPostBean> postVlist = new Vector<BlogPostBean>();
					String cateName = request.getParameter("category");
					int cateNum = Integer.parseInt(request.getParameter("cateNum"));
					postVlist = postMgr.getPostList(id, cateNum);
					for(int i=0; i<postVlist.size(); i++){
						BlogPostBean bean = postVlist.get(i);
						String title = bean.getPostTitle();
						String text = bean.getPostText();
						String date = bean.getPostDate();
						int like = bean.getPostLike();
						int view = bean.getPostView();
			%>
				<div class="postWrap">
					<div class="postTitle">
						<span class="postSpan-lg">����: <%=title %></span>
					</div>
					<div class="postContents">
						<%=text %>
					</div>
					<div class="postLike">
						<span class="postSpan-sm">���ƿ�: <%=like %></span>
					</div>
					<div class="postDate">
						<span class="postSpan-sm">�Խ���: <%=date %></span>
					</div>
				</div>
			<%	} %>
				<div class="postListWrap">
					<div class="postListTop">
						<div><strong><%=cateName %> <%=postVlist.size() %>���� ��</strong></div>
						<select>
							<option>5�� ����</option>
							<option>10�� ����</option>
							<option>15�� ����</option>
						</select>
					</div>
					<div class="postListBottom">
						<table style="width: 95%;">
							<thead>
								<tr>
									<td style=" width:80%"><strong>����</strong></td>
									<td style="width:10%"><strong>�ۼ���</strong></td>
									<td style="width:10%"><strong>��ȸ��</strong></td>
								<tr>
							</thead>
							<tbody>
							<%
									postVlist = postMgr.getPostList(id, cateNum);
									for(int i=0; i<postVlist.size(); i++){
										BlogPostBean bean = postVlist.get(i);
										String title = bean.getPostTitle();
										String date = bean.getPostDate();
										int view = bean.getPostView();
							%>
								<tr>
									<td style=" width:80%"><%=title %></td>
									<td style="width:10%"><%=date %></td>
									<td style="width:10%" align="center"><%=view %></td>
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