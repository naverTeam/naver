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
		
		String postTitle = request.getParameter("postTitle");
		String postText = request.getParameter("postText");
		
		//현재 로그인한 세션 아이디와 블로그소유주 아이디가 동일하지 않으면
		//이 블로그의 웰컴 페이지로 넘김 (비정상적 접근)
		if(id!=sid&&!id.equals(sid))
			response.sendRedirect("blog_"+id+"_welcome.jsp");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>blog</title>
	<link rel="stylesheet" href="./resources/css/blog_style.css">
	<script type="text/javascript" src="./resources/js/script.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
    
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
						<div><%=id %>님의 블로그</div>
					</div>
					<div class="blog-profileDesc">
						<div><%=blogProfileDesc %></div>
					</div>
				</div>
				<%if(id!=null&&!id.equals("")){ %>
				<div style="margin-top: 5px;">
					<a href="blog_<%=id%>_posting.jsp">글쓰기 </a><small style="padding: 5px;"> / </small>
					<a href="blog_<%=id%>_setting.jsp"> 설정</a>
				</div>
				<%} %>
				<div class="blog-postCategorys">					
					<form class="categoryFrm" action="blog_<%=id %>.jsp">
						<div>
							<div class="pCategory"><strong>카테고리</strong></div>
							<%
									Vector<CateBean> cateVlist = new Vector<CateBean>();
									cateVlist = cateMgr.getBlogCategory(id);
									for(int i=0; i<cateVlist.size(); i++){
										cateBean = cateVlist.get(i);
										String cateName = cateBean.getBlogCateName();
										int cateNum = cateBean.getBlogCateNum();
							%>
							
							<div class="pCategory">
								<input type="submit" class="textbtn" name="category" value="<%=cateName%>"></div>
								<input type="hidden" name="cateNum" value="<%=i+1%>">
								<input type="hidden" name="postNum" value="0">
							<%	} %>
								
						</div>
					</form>
				</div>
				
			</div>
			
			<div class="blog-conRight">
			
				<div class="postWrap">
					<form name="postFrm" method="post" action="postingProc.jsp" enctype="multipart/form-data">
						<input type="text" name="title" style="font-size: 20px; width: 99%; height: 40px;"
									value="<%=postTitle%>">
						<div style="display: flex; justify-content: flex-end;">
							<select name="category">
								<option>카테고리
								<option value="1">취미
								<option value="2">일상
							</select>
							<select name="topic">
								<option>주제
								<option value="1">IT
								<option value="2">요리
								<option value="3">여행
								<option value="4">예술
								<option value="5">스포츠
							</select>
						</div>
  						<textarea id="summernote" name="text"></textarea>
  						<input multiple="multiple" type="file" name="filename[]">
  						<input type="hidden" name="hiddenid" value="<%=id%>">
  						<input type="submit" value="저장">
					</form>
				</div>
				
			</div>			
		</div>
	</div>
</body>
<script>
$('#summernote').summernote({
    placeholder: '내용을 입력하세요',
    tabsize: 2,
    height: 120,
    toolbar: [
      ['style', ['style']],
      ['font', ['bold', 'underline', 'clear']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['table', ['table']],
      ['insert', ['link', 'picture', 'video']],
      ['view', ['fullscreen', 'codeview', 'help']]
    ]
  });
$('#summernote').summernote('editor.insertText', '<%=postText%>');      
</script>  
</html>