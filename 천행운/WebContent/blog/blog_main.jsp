<%@ page contentType="text/html; charset=EUC-KR"%>

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
						String neighbor = "aa";//neighbor�� �̿� Ȯ�� �� ��¹� ����
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
										<div class="blogLeftItem">
											<a href="#" class="fullLink-col">
												<img class="thumb-lg" src="" alt="img">
												<span class="spanHeader-lg">dd</span>
												<span class="spanDesc">cc</span>
											</a>
										</div>
									</div>
									<div class="blogRight">
										<div class="blogRightItem">
											<a href="#" class="fullLink-col">
												<img class="thumb-lg" src="" alt="img">
												<span class="spanHeader-lg">dd</span>
												<span class="spanDesc">cc</span>
											</a>
										</div>
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
						
							<div class="blogLeftItem">
								<a href="#" class="fullLink-col">
									<img class="thumb-lg" src="" alt="img">
									<span class="spanHeader-lg">dd</span>
									<span class="spanDesc">cc</span>
								</a>
							</div>
							<div class="blogLeftItem">
								<a href="#" class="fullLink-col">
									<img class="thumb-lg" src="" alt="img">
									<span class="spanHeader-lg">dd</span>
									<span class="spanDesc">cc</span>
								</a>
							</div>
							<div class="blogLeftItem">
								<a href="#" class="fullLink-col">
									<img class="thumb-lg" src="" alt="img">
									<span class="spanHeader-lg">dd</span>
									<span class="spanDesc">cc</span>
								</a>
							</div>
							
						</div>
						
						
						<div class="blogRight">
						
							<div class="blogRightItem">
								<a href="#" class="fullLink-col">
									<img class="thumb-lg" src="" alt="img">
									<span class="spanHeader-lg">dd</span>
									<span class="spanDesc">cc</span>
								</a>
							</div>
							<div class="blogRightItem">
								<a href="#" class="fullLink-col">
									<img class="thumb-lg" src="" alt="img">
									<span class="spanHeader-lg">dd</span>
									<span class="spanDesc">cc</span>
								</a>
							</div>
							<div class="blogRightItem">
								<a href="#" class="fullLink-col">
									<img class="thumb-lg" src="" alt="img">
									<span class="spanHeader-lg">dd</span>
									<span class="spanDesc">cc</span>
								</a>
							</div>
						
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