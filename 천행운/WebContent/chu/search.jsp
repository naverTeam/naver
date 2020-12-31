<%@page import="blog.BlogPostBean"%>
<%@page import="naver.BlogBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"
				pageEncoding="EUC-KR"%>
<jsp:useBean id="blogBean" class="blog.BlogPostBean"/>
<jsp:useBean id="searchBlogMgr" class="chu.SearchBlogMgr"/>		
<jsp:useBean id="blogMgr" class="blog.BlogMgr"/>		
<%
		request.setCharacterEncoding("EUC-KR");
		String keyWord = request.getParameter("keyWord");
		String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>���հ˻����</title>
	<link rel="stylesheet" href="./resources/css/style.css">
	<script src="./resources/js/script.js"></script>
</head>
<body>
	<div id="root">
	
		<div id="searchBar-search">
			<a href="index.jsp" style="width: 26px; height: 26px;">
				<img src="./resources/img/logo-sm.png" alt="img" style="margin-right: 20px;">
			</a>
			<div style="border-right: 1px solid #e4e8eb; height: 23px; padding-right: 5px; margin-right: 5px;"></div>
			<form class="searchFrm" name="searchFrm" action="search.jsp">
				<input type="text" name="keyWord" value="<%=keyWord %>" style="width: 533px; height: 40px; border: none;">
				<input type="button" onclick="javascript:check()" style="width: 60px; height: 60px; border: 0;">			 
			</form>
		</div>
		
		<div id="categoryWrap">
			<div id="categoryBar">
				<div class="category"><a><font color="#19ce60"><strong>���հ˻�</strong></font></a></div>
				<div class="category"><a href="search_blog.jsp?keyWord=<%=keyWord%>">��α�</a></div>
				<div class="category">������</div>
				<div class="category">����</div>
				<div class="category"><a href="search_img.jsp?keyWord=<%=keyWord%>">�̹���</a></div>
			</div>
		</div>
		<div id="container">
			<div class="conLeft">
				<div class="blogWrap-search">
					<div class="wrapTitle-search">
						<span class="wrapTitleSpan">��α�</span>
					</div>
					<div class="blogItems-search">
					<%
							Vector<BlogPostBean> bVlist = searchBlogMgr.getSearchBlog(keyWord);
							for(int i=0; i<bVlist.size(); i++){ 
								blogBean = bVlist.get(i);
								String bTitle = blogBean.getPostTitle();
								String bImg = blogBean.getPostImg();
								String bDesc = blogBean.getPostText();
					%>
						<div class="blogItem-search">
							<a href="#" class="fullLink-row">
								<img class="thumb-search" src="<%=bImg %>" alt="img">
								<div class="blogSpan">
									<span class="spanHeader-search"><%=bTitle %></span>
									<span class="spanDesc-search"><%=bDesc %></span>
									<span class="spanInfo-search">���̵� | �ۼ��ð�</span>
								</div>
							</a>
						</div>
					<%} %><%=bVlist.size() %>
					<button class="moreBtn" onclick="location.href='search_blog.jsp?keyWord=<%=keyWord%>'">������</button>
					</div>
				</div>
				
				<div class="space"></div>
				
				<div class="blogWrap-search">
					<div class="wrapTitle">
						<span class="wrapTitleSpan">������</span>
					</div>
					<div class="blogItems-search">
						<div class="blogItem-search">
							<img class="thumb-search" alt="img">
							<div class="blogSpan">
								<span class="spanHeader-search">����</span>
								<span class="spanDesc-search">����</span>
								<span class="spanInfo-search">���̵� | �ۼ��ð�</span>
							</div>
						</div>
						<div class="blogItem-search">
							<img class="thumb-search"  alt="img">
							<div class="blogSpan">
								<span class="spanHeader-search">����</span>
								<span class="spanDesc-search">����</span>
								<span class="spanInfo-search">���̵� | �ۼ��ð�</span>
							</div>
						</div>
						<div class="blogItem-search">
							<img class="thumb-search"  alt="img">
							<div class="blogSpan">
								<span class="spanHeader-search">����</span>
								<span class="spanDesc-search">����</span>
								<span class="spanInfo-search">���̵� | �ۼ��ð�</span>
							</div>
						</div>
					</div>
					<button class="moreBtn">������</button>
				</div>
				
			</div>
			
			<div class="conRight">
			
				<%	if(id!=null&&!id.equals("")) {//�α��� ���� üũ%>
					<%
							boolean flag = blogMgr.getBlogState(id);//�α����� ���̵� ��α����̺� �����ϴ��� üũ
							if(flag==true){//�����Ѵٸ� My blog��ư����
					%>
				<div class="loginBox">
					<div class="loginBoxTop" style="flex-direction: column;">
						<div><strong><%=id %></strong>�� ȯ���մϴ�.</div>
						<div><a href="../joon/logout.jsp">�α׾ƿ�</a></div>
					</div>
					<div class="loginBoxBottom" style="justify-content: space-around;">
						<div class="loginBoxBottom-item">My ������</div>
						<div class="loginBoxBottom-item"><a href="../blog/blog_<%=id%>_welcome.jsp">My ��α�</a></div>
						<div class="loginBoxBottom-item">My ����</div>
					</div>
				</div>
					<%	} else {//�������� ������ ��α� ������ư����%>
					<div class="loginBox">
					<div class="loginBoxTop" style="flex-direction: column; height: 30%;">
						<div><strong><%=id %></strong>�� ȯ���մϴ�.</div>
						<div><a href="../joon/logout.jsp">�α׾ƿ�</a></div>
					</div>
					<div><strong>������ ��α׸� ��������!</strong></div>
					<div class="loginBoxBottom" style="justify-content: space-around;">
						<div class="loginBoxBottom-item">My ������</div>
						<div class="loginBoxBottom-item" style="background: #c9ffd1;"><a href="../blog/createBlogProc_____.jsp">��α� ����</a></div>
						<div class="loginBoxBottom-item">My ����</div>
					</div>
				</div>
					
					<%	} %>
				<%} else {//�α��� ���� ���� ��� %>
				<div class="loginBox">
					<div class="loginBoxTop">
						<input class="loginButton" onclick="location.href='../joon/login.jsp'" type="button" value="�α���">
					</div>
					<div class="loginBoxBottom">
						<div class="loginBoxBottomLeft">
							<span style="margin-left: 10px;"><a href="../joon/member.jsp">ȸ������</a></span>
						</div>
						<div class="loginBoxBottomRight">
							<span style="margin-right: 10px;"><a href="#">ID ã��</a></span>
						</div>
					</div>
				</div>
				<%} %>
				
				<div class="weatherBox">����</div>
				
			</div>
		</div>
	</div>
	
</body>
</html>