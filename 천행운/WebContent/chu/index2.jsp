<%@page import="blog.BlogPostBean"%>
<%@page import="naver.ADBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"
				pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<jsp:useBean id="adBean" class="naver.ADBean"/>
<jsp:useBean id="adMgr" class="naver.ADMgr"/>
<jsp:useBean id="blogPostMgr" class="blog.BlogPostMgr"/>
<jsp:useBean id="blogMgr" class="blog.BlogMgr"/>

<%
		adBean = adMgr.getBannerAD();
		String bannerADIMG = adBean.getImg();
		String bannerADURL = adBean.getUrl();
		String keyWord = "";
		if(request.getParameter("keyWord") != null)
			keyWord = request.getParameter("keyWord");
		String id = (String) session.getAttribute("id");
%>		

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>index</title>
	<link rel="stylesheet" href="./resources/css/style.css">
	<script type="text/javascript" src="./resources/js/script.js"></script>
</head>
<body>
	<div id="root">
		<div id="portfolioLink">
			<a href="http://localhost/portFolioSite/index.html">��Ʈ������</a>
		</div>
		<div id="searchBar">
			<a href="index.jsp">
				<img src="./resources/img/logo-lg.jpg" alt="img" style="width: 250px; height: 60px;">
			</a>
			<form class="searchFrm" name="searchFrm" action="search.jsp">
				<input type="text" name="keyWord" style="width: 533px; height: 57px; border: 2px solid #19ce60;">
				<input type="button" onclick="javascript:check()" style="width: 60px; height: 60px; border: 0; ">
			</form> 
		</div>
		<div id="categoryWrap-main">
			<div id="categoryBar-main">
				<div class="category"><a href="../blog/blog_main.jsp">��α�</a></div>
				<div class="category"><a href="../choi/naverin_main.jsp">������</a></div>
				<div class="category"><a href="../hok/mainTop.jsp">����</a></div>
				<div class="category"><a href="#">����</a></div>
			</div>
		</div>
		<div id="container">
		
			<div class="conLeft">
				<div class="bannerAD">
					<a class="bannerLink" href="<%=bannerADURL%>">
						<img class="bannerImg" src="./resources/img/<%=bannerADIMG %>" alt="img">
					</a>
				</div>
				<div class="blogWrap">
				
				<form style="width:100%;">
				
					<div class="blogCategoryBar">
						<div class="blogCategory">
							<input type="submit" name="topic" value="IT" class="fullLink-col" style="background: #19ce60;"></div>
						<div class="blogCategory">
							<input type="submit" name="topic"  value="�ϻ�" class="fullLink-col"></div>
						<div class="blogCategory">
							<input type="submit" name="topic"  value="���" class="fullLink-col"></div>
						<div class="blogCategory">
							<input type="submit" name="topic"  value="�丮" class="fullLink-col"></div>
					</div>
					
				</form>
					
					<div class="blogItems">					
						<div class="blogLeft">
							<a href="#" class="fullLink-col">
							<%
									String topic = request.getParameter("topic");
									if(topic==null) topic="it";
									BlogPostBean hotBean = blogPostMgr.getHotPost(topic);
									String hTitle = hotBean.getPostTitle();
									String hImg = hotBean.getPostImg();
									String hDesc = hotBean.getPostText();
							%>
								<img class="thumb-lg" src="../blog/data/<%=hImg %>" alt="img">
								<span class="spanHeader-lg"><%=hTitle %></span>
								<span class="spanDesc"><%=hDesc %></span>
							</a>
						</div>
						<div class="blogRight">
						<%
								Vector<BlogPostBean> bVlist = new Vector<BlogPostBean>();
								bVlist = blogPostMgr.getMainList(topic);
								for(int i=0; i<bVlist.size(); i++){
									BlogPostBean bean = bVlist.get(i);
									String bTitle = bean.getPostTitle();
									String bImg = bean.getPostImg();
									String bDesc = bean.getPostText();
						%>
							<div class="blogRightItem">
								<a href="#" class="fullLink-row">
									<img class="thumb-md" src="../blog/data/<%=bImg %>" alt="img">
									<span class="spanHeader-md"><%=bTitle %></span>
								</a>
							</div>
						<%	} %>
						</div>
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
						<div class="loginBoxBottom-item" style="background: #c9ffd1;"><a href="../blog/createBlogProc.jsp">��α� ����</a></div>
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
				<div class="shopBox">
				<%
						Vector<ADBean> adVlist = new Vector<ADBean>();
						adVlist = adMgr.getADSide();
				%>
				<%for(int i=0; i<adVlist.size(); i++){ 
						ADBean bean = adVlist.get(i);
						String url = bean.getUrl();
						String img = bean.getImg();
						String desc = bean.getDesc();
				%>
					<div class="shopItem">
						<a class="shopLink" href="<%=url %>">
								<img class="thumb-shop" src="./resources/img/<%=img %>" alt="img">
								<span class="spanHeader-sm"><%=desc %></span>
							</a>
					</div>					
				<%} %>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>