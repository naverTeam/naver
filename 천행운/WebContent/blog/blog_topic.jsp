<%@ page contentType="text/html; charset=EUC-KR"%>

<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String) session.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>blog_topic</title>
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
				<div class="category"><a href="../blog/blog_main.jsp">��α� Ȩ</a></div>
				<div class="category"><a href="blog_topic.jsp"><font color="#19ce60"><strong>������ �α��</strong></font></a></div>
			</div>
		</div>
		<div id="container">
		
			<div class="conLeft">
				
				<div class="blogWrap">
					<div class="blogCategoryBar">
						<div class="blogCategory" style="background: #19ce60;">
							<a href="#" class="fullLink-col">IT</a></div>
						<div class="blogCategory">
							<a href="#" class="fullLink-col">�ϻ�</a></div>
						<div class="blogCategory">
							<a href="#" class="fullLink-col">���</a></div>
						<div class="blogCategory">
							<a href="#" class="fullLink-col">�丮</a></div>
					</div>
					<div class="blogItems">					
						<div class="blogLeft">
							<a href="#" class="fullLink-col">
							


								<img class="thumb-lg" src="" alt="img">
								<span class="spanHeader-lg">dd</span>
								<span class="spanDesc">cc</span>
							</a>
						</div>
						<div class="blogRight">
						


							<div class="blogRightItem">
								<a href="#" class="fullLink-row">
									<img class="thumb-md" src="" alt="img">
									<span class="spanHeader-md">aaa</span>
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