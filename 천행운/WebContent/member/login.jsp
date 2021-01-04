<%@ page contentType="text/html; charset=EUC-KR"%>

<%
		request.setCharacterEncoding("EUC-KR");
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
					<div><img alt="" src="./resources/img/logo-lg.jpg"></div>
				</div>
			</div>
			<div class="middle">
				<form action="loginProc.jsp">
					<div class="loginBox">
						<input type="text" placeholder="아이디" class="logInput">
					</div>
					<div class="loginBox">
						<input type="text" placeholder="비밀번호" class="logInput">
					</div>
					<div class="loginBox">
						<input type="submit" value="로그인" class="logInBtn">
					</div>
				</form>
			</div>
			<div class="low">
				<div class="textBtn"><a href="">아이디 찾기</a></div>
				<div class="textBtn"><a href="">비밀번호 찾기</a></div>
				<div class="textBtn"><a href="">회원가입</a></div>
			</div>
		</div>
		<div id="ready">
		</div>
	</div>
</body>
</html>