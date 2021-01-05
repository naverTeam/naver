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
		String strPostNum = request.getParameter("postNum");
		if(strPostNum==null) strPostNum="0";
		int postNum = Integer.parseInt(strPostNum);
		
		String strCateNum =request.getParameter("cateNum");
		int cateNum =0;
		if(strCateNum!=null&&!strCateNum.equals(""))
			cateNum = UtilMgr.parseInt(request, "cateNum");
		
%>
<%
		request.setCharacterEncoding("EUC-KR");
		int totalRecord = 0;//�� �Խù� ��
		int numPerPage = 5;//�������� ���ڵ� ����(5, 10, 15, 30)
		int pagePerBlock = 15;//���� ������ ����
		int totalPage = 0;//�� ������ ����
		int totalBlock = 0;//�� �� ����
		int nowPage = 1;//���� ������
		int nowBlock = 1;//���� ��
		
		//��û�� numPerPage ó���� ����
		if(request.getParameter("numPerPage") != null){
			numPerPage = UtilMgr.parseInt(request, "numPerPage");
		}
		//�˻��� �ʿ��� ����
		if(request.getParameter("cateNum") != null){
			cateNum = UtilMgr.parseInt(request, "cateNum");
		}
		totalRecord = postMgr.getTotalCount(cateNum, id);
		//out.println(totalRecord);
		
		if(request.getParameter("nowPage")!=null){
			nowPage = UtilMgr.parseInt(request, "nowPage");
		}
		
		//sql���� ���� start, cnt ����
		int start = (nowPage*numPerPage)-numPerPage;
		int cnt = numPerPage;
		
		//��ü������ ����
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//��ü�� ����
		totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//�����
		nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title><%=id %>���� ��α�</title>
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
					<div><a href="../member/logout.jsp">�α׾ƿ�</a></div>
						<%if(sid!=id&&!sid.equals(id)){ %>
					<div><a href="blog_<%=sid%>.jsp">�� ��α�</a></div>
						<%} %>
					<%}else{ %> 
					<div><a href="../member/login.jsp">�α���</a></div>
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
							%>
							
							<div class="pCategory">
							<form class="categoryFrm">
								<input type="submit" class="textbtn" name="category" value="<%=cateName%>">
								<input type="hidden" name="cateNum" value="<%=i+1%>">
								<input type="hidden" name="postNum" value="0">
							</form>
							</div>
							
							<%	} %>
								
						</div>
					
				</div>
				
			</div>
			
			
			<div class="blog-conRight">
			<%
					Vector<BlogPostBean> postVlist = new Vector<BlogPostBean>();
					String cNum = request.getParameter("cateNum");
					
					String postTitle="";
					String postText="";
					String postDate="";
					int postLike=0;
					int postView=0;
					
					if(cNum==null)
						cNum="1";
					cateNum = Integer.parseInt(cNum);
					if(postNum==0){
						BlogPostBean postBean = postMgr.getCateNewPost(id, cateNum);
						postTitle = postBean.getPostTitle();
						postText = postBean.getPostText();
						postDate = postBean.getPostDate();
						postLike = postBean.getPostLike(); 
						postView = postBean.getPostView();
					}else{						
						BlogPostBean postBean = postMgr.getCateInNumPost(id, cateNum, postNum);
						postTitle = postBean.getPostTitle();
						postText = postBean.getPostText();
						postDate = postBean.getPostDate();
						postLike = postBean.getPostLike(); 
						postView = postBean.getPostView();
					}
			%>
				<div class="postWrap">
					<div class="postTitle">
						<span class="postSpan-lg">����: <%=postTitle %></span>
					</div>
					<%if(sid!=null&&sid.equals(id)){ %>
					<div style="display: flex; flex-direction: row; justify-content: flex-end; align-items: self-end;">
					<form action="blog_<%=id %>_modify.jsp" method="post">
						<input type="submit" value="�����ϱ�">
						<input type="hidden" name="postTitle" value="<%=postTitle %>">
						<input type="hidden" name="postText" value="<%=postText %>">
					</form>
					</div>
					<%} %>
					<div class="postContents">
						<%=postText %>
					</div>
					<div class="postLike">
						<span class="postSpan-sm">���ƿ�: <%=postLike %></span>
					</div>
					<div class="postDate">
						<span class="postSpan-sm">�Խ���: <%=postDate %></span>
					</div>
				</div>
				
				<div class="postListWrap">
					<div class="postListTop">
						<div>
							<%String cateName = request.getParameter("category"); %>
							<strong><%=cateName %> <%=totalRecord %>���� ��</strong>
						</div>
						<form name="npFrm" method="post">
							<select name="numPerPage" onchange="numPerFn(this.form.numPerPage.value)">
								<option value="5" selected>5�� ����</option>
								<option value="10">10�� ����</option>
								<option value="15">15�� ����</option>
							</select>
						</form>
						<script>document.npFrm.numPerPage.value=<%=numPerPage%>;</script>
					</div>
					<div class="postListBottom">
						<table style="width: 95%;">
							<thead>
								<tr>
									<td style="width:80%"><strong>����</strong></td>
									<td style="width:10%"><strong>�ۼ���</strong></td>
									<td style="width:10%"><strong>��ȸ��</strong></td>
								<tr>
							</thead>
							<tbody>
							<%
									int postNo = 0;
									postVlist = postMgr.getPostList(id, cateNum, start, cnt);
									for(int i=0; i<postVlist.size(); i++){
										BlogPostBean bean = postVlist.get(i);
										String title = bean.getPostTitle();
										String date = bean.getPostDate();
										postNo = bean.getPostNo();
										int view = bean.getPostView();
							%>
								<tr>
									<td style=" width:80%">
										<a href="javascript:read('<%=postNo%>')">
										<%=title %>
										</a>
									</td>
									<td style="width:10%"><%=date %></td>
									<td style="width:10%" align="center"><%=view %></td>
								<tr>
							<%	} %>
								<tr>
									<td align="center">
									<!-- ����¡ �� �� Start -->
									<!-- ���� �� -->
										<%if(nowBlock>1){ %>
										<button onclick="javascript:block('<%=nowBlock-1 %>')">&lt;</button>
										<%} %>
										<!-- ����¡ -->
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
										<!-- ���� �� -->
										<%if(totalBlock>nowBlock){ %>
										<button onclick="javascript:block('<%=nowBlock+1 %>')">></button>
										<%} %>
									<!-- ����¡ �� �� End -->
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
			<input type="hidden" name="postNum" value="<%=postNum%>">
		</form>
	</div>
</body>
</html>