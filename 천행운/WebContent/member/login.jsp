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
						<input type="text" name="id" placeholder="���̵�" class="logInput">
					</div>
					<div class="loginBox">
						<input type="text" name="pwd" placeholder="��й�ȣ" class="logInput">
					</div>
					<div class="loginBox">
						<input type="submit" value="�α���" class="logInBtn">
					</div>
				</form>
			</div>
			<div class="low">
				<div class="textBtn"><a href="find_id.jsp">���̵� ã��</a></div>
				<div class="textBtn"><a href="find_pwd.jsp">��й�ȣ ã��</a></div>
				<div class="textBtn"><a href="member.jsp">ȸ������</a></div>
			</div>
		</div>
		<div id="ready">
		</div>
	</div>
</body>
</html>