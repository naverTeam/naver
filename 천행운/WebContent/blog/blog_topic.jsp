<%@ page contentType="text/html; charset=EUC-KR"%>

<%
		request.setCharacterEncoding("EUC-KR");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>blog</title>
	<link rel="stylesheet" href="./resources/css/blog_style.css">
	<script type="text/javascript" src="./resources/js/script.js"></script>
</head>
<body>
	<div id="root">
		
		<div id="searchBar-blog">
			<a href="index.jsp" style="width: 81px; height: 26px; margin-left: 18%;">
				<img src="./resources/img/logo-md.png" alt="img">
			</a>
			<div style="border-right: 1px solid #e4e8eb; height: 23px; padding-right: 5px; margin-right: 5px;"></div>
			<input type="text" name="keyWord" value="" style="width: 533px; height: 40px; border: none;">
			<input type="button" onclick="javascript:check()" style="width: 60px; height: 60px; border: 0;"> 
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