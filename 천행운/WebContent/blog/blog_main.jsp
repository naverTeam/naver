<%@page import="blog.BlogPostBean"%>
<%@page import="java.util.Vector"%>
<%@page import="blog.NeighborBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="neighborMgr" class="blog.NeighborMgr"/>
<jsp:useBean id="postBean" class="blog.BlogPostBean"/>
<jsp:useBean id="postMgr" class="blog.BlogPostMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>blog_main</title>
	<link rel="stylesheet" href="./resources/css/blog_style.css">
	<script type="text/javascript" src="./resources/js/script.js"></script>
</head>
<body>
	<div id="root">
		
		<div id="searchBar-blog">
			<div class="blog-navbar-left">
				<a href="../chu/index.jsp" style="width: 81px; height: 26px; margin-left: 18%;">
					<img src="./resources/img/logo-md.png" alt="img">
				</a> 
			</div>
			<div class="blog-navbar-right">
			</div> 
		</div>
		
		<div id="categoryWrap">
			<div id="categoryBar">
				<div class="category"><a href="../blog/blog_main.jsp"><font color="#19ce60"><strong>��α� Ȩ</strong></font></a></div>
				<div class="category"><a href="blog_topic.jsp">������ �α��</a></div>
			</div>
		</div>
		<div id="container">
		
			<div class="conLeft">
			<%
						String id = (String) session.getAttribute("id");//id�� �α��λ��� Ȯ�� �� ��¹� ����
						NeighborBean neighborBean = neighborMgr.getNeighborList(id);//neighbor�� �̿� Ȯ�� �� ��¹� ����
						String neighbor = neighborBean.getNeighborId();
						//3���� ����� ��
						//�α��� �ߴ�
						//�α��� �ߴµ� �̿��� ����
						//�α��� ���ߴ�
						if(id!=null && !id.equals("")) {
							if(neighbor!=null && !neighbor.equals("")){
			%>
								<div class="blogWrap">
								�̿��� �� ���Դϴ�.
								<div class="blogItems">					
									<div class="blogLeft">
									
									<%
											
											Vector<NeighborBean> nVList = neighborMgr.getRandomNeighbor(id);																					
											for(int i=0; i<nVList.size(); i++){
												NeighborBean nBean = nVList.get(i);//�̿� ���̵� 6�� �� i���� �����´�
												String nid = nBean.getNeighborId(); //nid�� ��´�
												
												postBean = postMgr.getNewPost(nid);//nid�� �־� ���� ��������
												String postHead = postBean.getPostTitle();
												String postText = postBean.getPostText();
												int postNum = postBean.getPostNo();
												int cateNum = postBean.getPostCNum();
												
									%>
										<div class="blogLeftItem" style="margin-top: 5px; margin-bottom: 5px;">
											<a href="blog_<%=nid %>.jsp?cateNum=<%=cateNum %>&postNum=<%=postNum %>" class="fullLink-col">
												<img class="thumb-lg-blog" src="" alt="img">
												<span class="spanHeader-lg-blog"><%=postHead %></span>
												<%-- <span class="spanDesc"><%=postText %></span> --%>
											</a>
										</div>
												
										<%} %>
									</div>
									
								</div>
							</div>				
							<%	} else { %>
			<div class="neighborWrap_none">
					<div class="span-md">���� �̿��� �����ϴ�.</div>
					<div class="span-md">�����ִ� ������ ���� �̿����� ��������.</div>
				</div>
				<%} %>
						<%}else{ %>
					<div class="neighborWrap_none">
					<div class="span-md">�α׾ƿ� �����Դϴ�.</div>
					<div class="span-md">�α��� �Ͽ� �̿����� �� ���� �ѷ�������.</div>
				</div>
				<%	} %>
				<div class="blogWrap">
					�̷� �̿��� ���
					
					<div class="blogItems">					
						<div class="blogLeft">
						
						<%
								Vector<BlogPostBean> popVlist = postMgr.getPopList(id);
								int cnt = 0;
								for(int i=0; i<popVlist.size(); i++){									
									BlogPostBean bean = popVlist.get(i);
									String popId = bean.getId();//�۾��� ���̵� ����
									boolean flag = neighborMgr.getNeighborList(id, popId);
									if(flag==false){
										cnt = cnt+1;
										String popHead = bean.getPostTitle();
										String popImg = bean.getPostImg();
										String popDesc = bean.getPostText();
									
						%>
							<div class="blogLeftItem">
								<a href="#" class="fullLink-col">
									<img class="thumb-lg-blog" src="" alt="img">
									<span class="spanHeader-lg-blog"><%=popHead %></span>
									<span class="spanDesc"><%=popDesc %></span>
								</a>
							</div>
							<%	} %>
							<%if(cnt==6) break; %>
						<%	} %>
							
							
						</div>
						
						
					</div>
				</div>
			</div>
			
			<div class="conRight">
			
				<%if(id!=null&&!id.equals("")) {%>
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
				<%} else { %>
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
				


					<div class="shopItem">
						<a class="shopLink" href="">
								<img class="thumb-shop" src="./resources/img/" alt="img">
								<span class="spanHeader-sm"></span>
							</a>
					</div>					
				
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>