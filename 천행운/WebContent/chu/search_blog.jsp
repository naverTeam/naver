<%@page import="chu.UtilMgr"%>
<%@page import="blog.BlogPostBean"%>
<%@page import="naver.BlogBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"
				pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="blogBean" class="blog.BlogPostBean"/>
<jsp:useBean id="searchBlogMgr" class="chu.SearchBlogMgr"/>		
<jsp:useBean id="blogMgr" class="blog.BlogMgr"/>	
<%
		String keyWord = request.getParameter("keyWord");
		int totalRecord = 0;
		int numPerPage = 10;
		int pagePerBlock = 10;
		int totalPage = 0;
		int totalBlock = 0;
		int nowPage = 1;
		int nowBlock = 1;
		
		if(request.getParameter("numPerPage") != null){
			numPerPage = UtilMgr.parseInt(request, "numPerPage");
		}
		
		if(request.getParameter("keyWord") != null){}
		
		if(request.getParameter("reload") != null && request.getParameter("reload").equals("true")){}
		totalRecord = searchBlogMgr.getTotalCount(keyWord);		
		if(request.getParameter("nowPage") != null){
			nowPage = UtilMgr.parseInt(request, "nowPage");
		}
		
		int start = (nowPage*numPerPage)-numPerPage;
		int cnt = numPerPage;
		
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
		
		String id = (String) session.getAttribute("id");
		
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>��α� �˻����</title>
	<link rel="stylesheet" href="./resources/css/style.css">
	<script src="./resources/js/script.js"></script>
</head>
<body>
	<div id="root">
	
		<div id="searchBar-search">
			<a href="index.jsp" style="width: 26px; height: 26px;">
				<img src="./resources/img/logo-sm.png" alt="img">
			</a>
			<div style="border-right: 1px solid #e4e8eb; height: 23px; padding-right: 5px; margin-right: 5px;"></div>
			<input type="text" name="keyWord" value="<%=keyWord %>" style="width: 533px; height: 40px; border: none;">
			<input type="button" onclick="javascript:check()" style="width: 60px; height: 60px; border: 0;"> 
		</div>
		
		<div id="categoryWrap">
			<div id="categoryBar">
				<div class="category"><a href="search.jsp?keyWord=<%=keyWord%>">���հ˻�</a></div>
				<div class="category"><a><font color="#19ce60"><strong>��α�</strong></font></a></div>
				<div class="category">������</div>
				<div class="category">����</div>
				<div class="category"><a href="search_img.jsp?keyWord=<%=keyWord%>">�̹���</a></div>
			</div>
		</div>
		<div id="container">
			<div class="conLeft">
				<div class="blogWrap-search-blog">
					<div class="wrapTitle">
						<span class="wrapTitleSpan">��α�</span>
					</div>
					<div class="blogItems-search">
					
					<%
							Vector<BlogPostBean> bVlist = searchBlogMgr.getSearchBlogOnly(keyWord);
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
					<%} %>
					
					</div>
					<div class="pageANDblock" style="margin-top: 20px;">
						<!-- ����¡ �� �� Start -->
						<!-- ���� �� -->
							<%if(nowBlock>1){ %>
							<a href="javascript:block('<%=nowBlock-1 %>')">&lt;&lt;</a>
							<%} %>
							<!-- ����¡ -->
							<%
									int pageStart = (nowBlock-1)*pagePerBlock+1;
									int pageEnd = (pageStart+pagePerBlock)<totalPage ? pageStart+pagePerBlock : totalPage+1;
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
							<a href="javascript:block('<%=nowBlock+1 %>')">>></a>
							<%} %>
						<!-- ����¡ �� �� End -->
					</div>
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
	<form name="readFrm">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="num">
</form>
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
</script>
</body>
</html>