<%@ page contentType="text/html; charset=EUC-KR"%>

<%
		request.setCharacterEncoding("EUC-KR");
		String returnPage = request.getParameter("returnPage");
%>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<link rel="stylesheet" href="./resources/css/style.css">
</head>
<body>
	<div id="root">
		<div id="loginArea">
			<div class="top">
				<div class="logo">			
					<div>
						<a href="../chu/index.jsp"><img alt="" src="./resources/img/logo-lg.png" style="width: 225px; height: 55px;"></a>
					</div>
				</div>
			</div>
			<div class="middle">
				<form action="loginProc.jsp" method="post"><!-- 작업 다되면 포스트방식으로 바꾸시오 -->
					<div class="loginBox">
						<input type="text" name="id" placeholder="아이디" class="logInput">
					</div>
					<div class="loginBox">
						<input type="text" name="pwd" placeholder="비밀번호" class="logInput">
					</div>
					<div class="loginBox">
						<input type="hidden" name="returnPage" value="<%=returnPage %>">
						<input type="submit" value="로그인" class="logInBtn">
					</div>
				</form>
			</div>
			<div class="low">
				<div class="textBtn"><a href="find_id.jsp">아이디 찾기</a></div>
				<div class="textBtn"><a href="find_pwd.jsp">비밀번호 찾기</a></div>
				<div class="textBtn"><a href="member.jsp">회원가입</a></div>
			</div>
		</div>
		<div id="ready">
		</div>
	</div>
</body>
</html>