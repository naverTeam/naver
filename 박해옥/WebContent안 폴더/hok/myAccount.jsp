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
	<div id="root-account">
	
		<div id="topBar-account">
			<div class="account-navbar-left">
				<a href="../chu/index.jsp" style="width: 81px; height: 26px; margin-left: 18%;">
					<img src="./resources/img/logo-md.png" alt="img">
				</a> 
			</div>
			<div class="account-navbar-right">
			</div> 
		</div>
		<div class="account-wrap">
			<div class="account-card">
				<div style="height:10%;">�� ����</div>
				<div style="height:80%;"></div>
				<div style="height:10%; display: flex; justify-content: flex-end; margin-right: 20px;">
					<a href="update.jsp">����</a>
				</div>
			</div>
			<div class="account-card" style="background: #e8e8e8;">
				<svg style="width:100%; height:100%;">
					<line x1="0" y1="0" x2="450" y2="300" stroke-width="5" stroke="#8e8e8e" />
					�غ���...
				</svg>
			</div>
			<div class="account-card" style="background: #e8e8e8;">
				<svg style="width:100%; height:100%;">
					<line x1="0" y1="0" x2="450" y2="300" stroke-width="5" stroke="#8e8e8e" />
					�غ���...
				</svg>
			</div><div class="account-card" style="background: #e8e8e8;">
				<svg style="width:100%; height:100%;">
					<line x1="0" y1="0" x2="450" y2="300" stroke-width="5" stroke="#8e8e8e" />
					�غ���...
				</svg>
			</div>
		</div>
		<div class="account-bottom">
			<span>���̹��� �̿����� �����Ŵٸ� <a href="memberOut.jsp">ȸ��Ż�� �ٷΰ���</a></span>
		</div>
	</div>
</body>
</html>