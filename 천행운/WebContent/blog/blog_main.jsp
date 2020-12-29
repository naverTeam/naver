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
				<div class="category"><a href="../blog/blog_main.jsp"><font color="#19ce60"><strong>블로그 홈</strong></font></a></div>
				<div class="category"><a href="blog_topic.jsp">주제별 인기글</a></div>
			</div>
		</div>
		<div id="container">
		
			<div class="conLeft">
			<%
						String id = (String) session.getAttribute("id");//id로 로그인상태 확인 후 출력문 결정
						String neighbor = "aa";//neighbor로 이웃 확인 후 출력문 결정
						//3가지 경우의 수
						//로그인 했다
						//로그인 했는데 이웃이 없다
						//로그인 안했다
						if(id!=null && !id.equals("")) {
							if(neighbor!=null && !neighbor.equals("")){					
			%>
								<div class="blogWrap">
								이웃의 새 글입니다.
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
					<div class="span-md">아직 이웃이 없습니다.</div>
					<div class="span-md">관심있는 주제가 같은 이웃들을 만들어보세요.</div>
				</div>
				<%} %>
						<%}else{ %>
					<div class="neighborWrap_none">
					<div class="span-md">로그아웃 상태입니다.</div>
					<div class="span-md">로그인 하여 이웃들의 새 글을 둘러보세요.</div>
				</div>
				<%	} %>
				<div class="blogWrap">
					이런 이웃은 어때요
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
						<div><strong><%=id %></strong>님 환영합니다.</div>
						<div><a href="../joon/logout.jsp">로그아웃</a></div>
					</div>
					<div class="loginBoxBottom" style="justify-content: space-around;">
						<div class="loginBoxBottom-item">My 지식인</div>
						<div class="loginBoxBottom-item"><a href="../blog/blog_<%=id%>_welcome.jsp">My 블로그</a></div>
						<div class="loginBoxBottom-item">My 쇼핑</div>
					</div>
				</div>
				<%} else { %>
				<div class="loginBox">
					<div class="loginBoxTop">
						<input class="loginButton" onclick="location.href='../joon/login.jsp'" type="button" value="로그인">
					</div>
					<div class="loginBoxBottom">
						<div class="loginBoxBottomLeft">
							<span style="margin-left: 10px;"><a href="../joon/member.jsp">회원가입</a></span>
						</div>
						<div class="loginBoxBottomRight">
							<span style="margin-right: 10px;"><a href="#">ID 찾기</a></span>
						</div>
					</div>
				</div>
				<%} %>
				
				<div class="weatherBox">날씨</div>
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