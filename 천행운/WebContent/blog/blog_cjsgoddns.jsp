<%@page import="blog.UtilMgr"%>
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
		
		//아무 값도 전달받지 못하고 넘어온 경우 웰컴페이지(해당id페이지의 최신글)를 띄우기 위해 변수값 설정////////////////////////
		BlogPostBean wBean = postMgr.getWelcomeSet(id);
		String wTitle = wBean.getPostTitle();
		String wText = wBean.getPostText();
		String wImg = wBean.getPostImg();
		String wTopic = wBean.getPostTopic();
		String wDate = wBean.getPostDate();
		
		String wCNum = Integer.toString(wBean.getPostCNum());
		String wLike = Integer.toString(wBean.getPostLike());
		String wPostNum = Integer.toString(wBean.getPostNo());
		String wView = Integer.toString(wBean.getPostView());
		//////////////////////////////////////////////////////////////////////////
		//쿼리 조건에 넣기 위한 변수 값 전달받거나 웰컴값 강제대입////////////////////////////////////
		int cateNum;
		int postNum;
		//카테고리 번호 cateNum
		String reqCateNum = request.getParameter("cateNum");
		if(reqCateNum==null||reqCateNum.equals("")) //전달받지 못해서 null일 경우 위에서 설정한 값으로 강제하기
			reqCateNum = wCNum;		
		cateNum = Integer.parseInt(reqCateNum);//전달받았거나 강제로 설정된 reqCateNum을 int 변환
		//포스트 번호 postNum
		String reqPostNum = request.getParameter("postNum");
		if(reqPostNum==null||reqPostNum.equals(""))
			reqPostNum = wPostNum;
		postNum = Integer.parseInt(reqPostNum);
		//카테고리 이름 cateName
		String cateName = request.getParameter("category");
		if(cateName==null||cateName.equals(""))
			cateName = cateMgr.getCateName(id, cateNum);
		//////////////////////////////////////////////////////////////////////////
		//페이징 처리를 위한 설정///////////////////////////////////////////////////////////
		int totalRecord = 0;//총 게시물 수
		int numPerPage = 5;//페이지당 레코드 개수(5, 10, 15, 30)
		int pagePerBlock = 15;//블럭당 페이지 개수
		int totalPage = 0;//총 페이지 개수
		int totalBlock = 0;//총 블럭 개수
		int nowPage = 1;//현재 페이지
		int nowBlock = 1;//현재 블럭
		
		//요청된 numPerPage 처리를 위해
		if(request.getParameter("numPerPage") != null){
			numPerPage = UtilMgr.parseInt(request, "numPerPage");
		}
		
		//총 게시물 수
		totalRecord = postMgr.getTotalCount(cateNum, id);
		
		if(request.getParameter("nowPage")!=null){
			nowPage = UtilMgr.parseInt(request, "nowPage");
		}
		
		//sql문에 들어가는 start, cnt 선언
		int start = (nowPage*numPerPage)-numPerPage;
		int cnt = numPerPage;
		
		//전체페이지 개수
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//전체블럭 개수
		totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//현재블럭
		nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title><%=id %>님의 블로그</title>
	<link rel="stylesheet" href="./resources/css/blog_style.css">
	<script type="text/javascript" src="./resources/js/script.js"></script>
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
		function read(num) {
			document.readFrm.postNum.value = num;
			document.readFrm.action = "blog_<%=id%>.jsp";
			document.readFrm.submit();
		}
		
	</script>

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
				<img class="bannerImg" src="./data/<%=blogBanner %>">
			</div>
		</div>
		
		<div id="container">
		
			<div class="blog-conLeft">
				
				<div class="blog-profileWrap">
					<div class="blog-profileImg">
						<div style="width: 100%; height: 100%;">
							<img src="./data/<%=blogProfileImg %>" style="width: 100%; height: 100%;">
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
				<%} %>
				<div class="blog-postCategorys">					
					
						<div>
							<div class="pCategory"><strong>카테고리</strong></div>
							<%
									Vector<CateBean> cateVlist = new Vector<CateBean>();
									cateVlist = cateMgr.getBlogCategory(id);
									for(int i=0; i<cateVlist.size(); i++){
										cateBean = cateVlist.get(i);
										String cName = cateBean.getBlogCateName();
										int cNum = cateBean.getBlogCateNum();
										int pNum = postMgr.getCateNewPostNum(id, cNum);
							%>
							
							<div class="pCategory">
							<form class="categoryFrm">
								<input type="submit" class="textbtn" name="category" value="<%=cName%>">
								<input type="hidden" name="cateNum" value="<%=cNum%>">
								<input type="hidden" name="postNum" value="<%=pNum%>">
							</form>
							</div>
							
							<%	} %>
								
						</div>
					
				</div>
				
			</div>
			
			
			<div class="blog-conRight">
			<%
					Vector<BlogPostBean> postVlist = new Vector<BlogPostBean>();
					//String cNum = request.getParameter("cateNum");
					
					String postTitle="";
					String postText="";
					String postDate="";
					int postLike=0;
					int postView=0;
					
					/*  if(cNum==null)
						cNum="1";
					cateNum = Integer.parseInt(cNum); 
					if(postNum==0){
						BlogPostBean postBean = postMgr.getCateNewPost(id, cateNum);
						postTitle = postBean.getPostTitle();
						postText = postBean.getPostText();
						postDate = postBean.getPostDate();
						postLike = postBean.getPostLike(); 
						postView = postBean.getPostView();
					}else{		 */
						
					BlogPostBean postBean = postMgr.getCateInNumPost(id, cateNum, postNum);
					postTitle = postBean.getPostTitle();
					postText = postBean.getPostText();
					postDate = postBean.getPostDate();
					postLike = postBean.getPostLike(); 
					postView = postBean.getPostView();
					
			%>
			<%if(postTitle==null){%>
				<div class="non-post"> 포스트가 없습니다.</div>
			<%}else{%>
				<div class="postWrap">
					<div class="postTitle">
						<span class="postSpan-lg">제목: <%=postTitle %></span>
					</div>
					<%if(sid!=null&&sid.equals(id)){ %>
					<div style="display: flex; flex-direction: row; justify-content: flex-end; align-items: self-end;">
					<form action="blog_<%=id %>_modify.jsp" method="post">
						<input type="submit" value="수정하기">
						<input type="hidden" name="postTitle" value="<%=postTitle %>">
						<input type="hidden" name="postText" value="<%=postText %>">
					</form>
					</div>
					<%} %>
					<div class="postContents">
						<%=postText %>
					</div>
					<div class="postLike">
						<span class="postSpan-sm">좋아요: <%=postLike %></span>
					</div>
					<div class="postDate">
						<span class="postSpan-sm">게시일: <%=postDate %></span>
					</div>
				</div>
				<%} %>
				<div class="postListWrap">
					<div class="postListTop">
						<div>
							<% %>
							<strong><%=cateName %> <%=totalRecord %>개의 글</strong>
						</div>
						<form name="npFrm" method="post">
							<select name="numPerPage" onchange="numPerFn(this.form.numPerPage.value)">
								<option value="5" selected>5줄 보기</option>
								<option value="10">10줄 보기</option>
								<option value="15">15줄 보기</option>
							</select>
						</form>
						<script>document.npFrm.numPerPage.value=<%=numPerPage%>;</script>
					</div>
					<div class="postListBottom">
						<table style="width: 95%;">
							<thead>
								<tr>
									<td style="width:80%"><strong>제목</strong></td>
									<td style="width:10%"><strong>작성일</strong></td>
									<td style="width:10%"><strong>조회수</strong></td>
								<tr>
							</thead>
							<tbody>
							<%
									postVlist = postMgr.getPostList(id, cateNum, start, cnt);
									for(int i=0; i<postVlist.size(); i++){
										BlogPostBean bean = postVlist.get(i);
										String title = bean.getPostTitle();
										String date = bean.getPostDate();
										postNum = bean.getPostNo();
										int view = bean.getPostView();
							%> 
								<tr>
									<td style=" width:80%">
										<a href="javascript:read('<%=postNum%>')">
										<%=title %>
										</a>
									</td>
									<td style="width:10%"><%=date %></td>
									<td style="width:10%" align="center"><%=view %></td>
								<tr>
							<%	} %>
								<tr>
									<td align="center">
									<!-- 페이징 및 블럭 Start -->
									<!-- 이전 블럭 -->
										<%if(nowBlock>1){ %>
										<button onclick="javascript:block('<%=nowBlock-1 %>')">&lt;</button>
										<%} %>
										<!-- 페이징 -->
										<%
												int pageStart = (nowBlock-1)*pagePerBlock+1;
												int pageEnd = (pageStart+pagePerBlock)<=totalPage ? pageStart+pagePerBlock : totalPage+1;
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
										<button onclick="javascript:block('<%=nowBlock+1 %>')">></button>
										<%} %>
									<!-- 페이징 및 블럭 End -->
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>			
		</div>
		<form name="readFrm">
			<input type="hidden" name="nowPage" value="<%=nowPage%>">
			<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
			<input type="hidden" name="cateNum" value="<%=cateNum%>">
			<input type="hidden" name="category" value="<%=cateName%>">
			<input type="hidden" name="postNum">
		</form>
	</div>
</body>
</html>