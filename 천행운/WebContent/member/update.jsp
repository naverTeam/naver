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
		<div class="update-wrap">
			<form name="checkFrm" action="updateProc.jsp" method="post">
				<div class="update-card">
					<div style="height:10%; margin-left: 20px;">
						<span style="font-weight: 900;">��й�ȣ ����</span>
					</div>
					<div style="height:80%; margin-left: 20px;">
						<div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
							<input type="password" name="pwd" placeholder="���� ��й�ȣ" style="width: 80%; height: 50px; margin-bottom: 10px; margin-top: 10px;">
							<input type="password" name="pwd1" placeholder="�� ��й�ȣ" style="width: 80%; height: 50px; margin-bottom: 10px;">
							<input type="password" name="pwd2" placeholder="�� ��й�ȣ Ȯ��" style="width: 80%; height: 50px;">						
						</div>
					</div>
					<div style="height:10%; display: flex; justify-content: flex-end; margin-right: 20px;">
						<input type="button" class="submitBtn" onclick="check()" value="�����ϱ�" style="margin-bottom: 10px;">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	function check(){
		msg = "��й�ȣ�� �����մϴ�";
		flag = true;
		frm = document.checkFrm;
		pwd = frm.pwd.value;
		pwd1 = frm.pwd1.value;
		pwd2 = frm.pwd2.value;
		
		if(pwd.trim()==""){
			msg="��й�ȣ�� �Է��ϼ���";
			flag = false;
		}else if(pwd1.trim()==""){
			msg="������ ��й�ȣ�� �Է��ϼ���";
			flag = false;
		}else if(pwd==pwd1){
			msg="���� ��й�ȣ�� ���ο� ��й�ȣ�� �����մϴ�";
			flag = false;
		}else if(pwd1!=pwd2){
			msg="������ ��й�ȣ�� �ٽ� Ȯ�����ּ���";
			flag = false;
		}
		alert(msg);
		if(flag==true)
			frm.submit();
	}
</script>
</html>