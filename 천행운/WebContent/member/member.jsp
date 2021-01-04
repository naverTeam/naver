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
		<form action="memberProc.jsp" name="memberFrm">
			<div class="container">
			
				<label class="label">���̵�</label>
				<input type="text" name="id" class="signInput">
				
				<label class="label">��й�ȣ</label>
				<input type="text" name="pwd1" class="signInput">
				
				<label class="label">��й�ȣ Ȯ��</label>
				<input type="text" name="pwd2" class="signInput">
				
				<label class="label" style="margin-top: 20px;">�̸�</label>
				<input type="text" name="name" class="signInput">
				
				<label class="label">�������</label>
				<input type="text" name="birth" class="signInput">
				
				<label class="label">����</label>
				<input type="text" name="gender" class="signInput">
				
				<label class="label">�޴���ȭ</label>
				<input type="text" name="phone" class="signInput">
				
				<input type="button" onclick="check()" value="�����ϱ�" class="logInBtn" style="margin-top: 20px;">
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	function check(){
		msg="���Լ���";
		frm = document.memberFrm;
		id = frm.id.value;
		pwd1 = frm.pwd1.value;
		pwd2 = frm.pwd2.value;
		name = frm.name.value;
		birth = frm.birth.value;
		gender = frm.gender.value;
		phone = frm.phone.value;
		if(id.trim()=="") {
			msg="���̵� �Է��ϼ���";
			frm.id.focus();
		} else if(id.length < 8 || id.length > 12) {
			msg="���̵�� 8 ~ 12�� �̳��� �Է����ּ���.";
			frm.id.focus();
		} else if(pwd1=="") {
			msg="��й�ȣ�� �Է��ϼ���";
			frm.pwd1.focus();
		} else if(pwd1.length < 8 || pwd1.length > 12) {
			msg="��й�ȣ�� 8 ~ 12�� �̳��� �Է����ּ���.";
		}
		alert(msg);
	}
</script>
</html>