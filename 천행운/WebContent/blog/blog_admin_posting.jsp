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
	<script type="text/javascript" charset="EUC-KR" src="./resources/js/script.js">
	
	</script>
</head>
<body>

	<div id="root">
		<div id="overlay" style="background-image: url('./resources/img/tutorImg.png');">
			<button class="overlayButton" onclick="overlaySleep()">알겠다</button>
		</div>
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
		
		<form name="updateFrm" action="blog_settingProc.jsp" method="post" enctype="multipart/form-data" accept-charset="euc-kr">
		
		<div id="mainImgWrap" style="border: 5px solid yellow;">
			<div style="height: 100%;">
				<input type="file" name="bannerImg" id="bannerImg" class="bannerChange" style="background-image: url('./resources/img/<%=blogBanner %>');"
							onchange="previewBanner(event);">
			</div>
		</div>
		
		<div id="container">
		
			<div class="blog-conLeft">
				
				<div class="blog-profileWrap">
					<div class="blog-profileImg" style="border: 5px solid yellow;">
						<div style="width: 100%; height: 100%;">
							<input type="file" id="profileImg" name="profileImg" class="profileImgChange" style="background-image: url('./resources/img/<%=blogProfileImg %>');"
										onchange="previewProfile(event);">
						</div>
					</div>
					<div class="blog-profileId">					
						<div>
							<span style="opacity: 0.5"><%=id %>님의 블로그</span>
						</div>
					</div>
					<div class="blog-profileDesc"  style="border: 5px solid yellow;">
						<div style="width: 100%; height: 100%;">
							<textarea name="profileDesc" class="descChange" placeholder="<%=blogProfileDesc %>"></textarea>
						</div>
					</div>
				</div>
				<%if(id!=null&&!id.equals("")){ %>
				<div style="margin-top: 5px;">
					<span style="opacity: 0.5">글쓰기<small style="padding: 5px;"> / </small></span>
					<span style="opacity: 0.5">설정</span>
				</div>
				<%} %>
				<div class="blog-postCategorys"  style="border: 5px solid yellow;">					
					
						<div id="categorys" style="padding-inline-start: 0px;">
							<div class="pCategory">
								<strong>카테고리</strong>
								
							</div>
							<%
									int count = 0;
									Vector<CateBean> cateVlist = new Vector<CateBean>();
									cateVlist = cateMgr.getBlogCategory(id);
									for(int i=0; i<cateVlist.size(); i++){
										cateBean = cateVlist.get(i);
										String cateName = cateBean.getBlogCateName();
										int cateNum = cateBean.getBlogCateNum();
							%>
							
							<div id="pCategory<%=i+1%>">
								<input type="text" class="cateChange" name="category" placeholder="<%=cateName%>">
								<input type="button" id="delButton<%=i+1 %>" value="삭제" onclick="delCategory('<%=i+1%>')">
							</div>
									<%count = i+1; %>
							<%	} %>
							
							<input type="button" id="addButton<%=count %>" value="추가" onclick="addCategory('<%=count%>')" style="margin-left: 40%; margin-top: 5px;">
							
						</div>
					
				</div>
				
			</div>
			
			<div class="blog-conRight">
				<input type="submit" value="수정완료">
				<input type="button" value="수정취소" onclick="javascript:location.href='blog_<%=id%>.jsp'">
			</div>		
				
		</div>
		</form>
	</div>
	
</body>
<script type="text/javascript">
function addCategory(count) {
	
	addFrm = document.getElementById("categorys");
	addBtn = document.getElementById("addButton"+count);
	addFrm.removeChild(addBtn);
	
	count++;
	
	addedDiv = document.createElement("div");
	addedDiv.setAttribute("id","pCategory"+count);
	
	addedInput = document.createElement("input");
	addedInput.setAttribute("class","cateChange");
	addedInput.setAttribute("name","category");
	addedInput.setAttribute("placeholder","새 카테고리");
	
	addedBtn = document.createElement("input");
	addedBtn.type = "button";
	addedBtn.setAttribute("onclick","delCategory("+count+")");
	addedBtn.setAttribute("value","삭제");
	
	addedAddBtn = document.createElement("input");
	addedAddBtn.type="button";
	addedAddBtn.setAttribute("onclick", "addCategory("+count+")");
	addedAddBtn.setAttribute("id", "addButton"+count);
	addedAddBtn.setAttribute("style", "margin-left: 40%; margin-top: 5px;")
	addedAddBtn.setAttribute("value", "추가");
	
	addFrm.appendChild(addedDiv);
	addedDiv.appendChild(addedInput);
	addedDiv.appendChild(addedBtn);
	
	addFrm.appendChild(addedAddBtn);
	
}

function delCategory(count) {
	//delFrm = document.getElementById("categorys");
	//alert("pCategory"+count);
	delCate = document.getElementById("pCategory"+count);
	document.getElementById("categorys").removeChild(delCate);
	
	//delFrm.removeChild(delCate);
}
</script>
</html>