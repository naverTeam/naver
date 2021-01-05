<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="member.MemberMgr"/>
<jsp:useBean id="bean" class="member.MemberBean"/>
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
				<div class="birthPart">
					<input type="text" name="id" class="signInput" style="width: 400px;">
					<input type="button" onclick="idCheck()" style="width: 50px; height: 57px; margin-bottom: 5px;">
				</div>
				
				<label class="label">��й�ȣ</label>
				<input type="text" name="pwd1" class="signInput">
				
				<label class="label">��й�ȣ Ȯ��</label>
				<input type="text" name="pwd2" class="signInput">
				
				<label class="label" style="margin-top: 20px;">�̸�</label>
				<input type="text" name="name" class="signInput">
				
				<label class="label">�������</label>
				<div class="birthPart">
					<input type="text" name="birth1" class="signInput-3" placeholder="��">
					<select name="birth2" class="signInput-3"><option>��
						<option value="1">1��<option value="2">2��<option value="3">3��<option value="4">4��<option value="5">5��<option value="6">6��
						<option value="7">7��<option value="8">8��<option value="9">9��<option value="10">10��<option value="11">11��<option value="12">12��
					</select>
					<input type="text" name="birth3" class="signInput-3" placeholder="��">
				</div>
				
				
				<label class="label">����</label>
				<select name="gender" class="signInput"><option>����
					<option value="1">����<option value="2">����<option value="3">���þ���
				</select>
				
				<label class="label">�޴���ȭ</label>
				<input type="text" name="phone" class="signInput">
				
				<input type="button" onclick="check()" value="�����ϱ�" class="logInBtn" style="margin-top: 20px;">
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	function idCheck(){
		frm = document.memberFrm;
		id = frm.id.value;
		location.href="idCheck.jsp?id="+id;
	}
	function check(){
		flag = true;
		msg="���Լ���";
		frm = document.memberFrm;
		id = frm.id.value;
		pwd1 = frm.pwd1.value;
		pwd2 = frm.pwd2.value;
		name = frm.name.value;
		birth1 = frm.birth1.value;
		birth2 = frm.birth2.value;
		birth3 = frm.birth3.value;
		gender = frm.gender.value;
		phone = frm.phone.value;
		if(id.replace(/(^\s*)|(\s*$)/, "").trim()=="") {
			msg="���̵� �Է����ּ���";
			frm.id.focus();
			flag = false;
		} else if(id.length < 8 || id.length > 12) {
			msg="���̵�� 8 ~ 12�� �̳��� �Է����ּ���";
			frm.id.focus();
			flag = false;
		} else if(pwd1=="") {
			msg="��й�ȣ�� �Է��ϼ���";
			frm.pwd1.focus();
			flag = false;
		} else if(pwd1.length < 8 || pwd1.length > 12) {
			msg="��й�ȣ�� 8 ~ 12�� �̳��� �Է����ּ���";
			frm.pwd1.focus();
			flag = false;
		} else if(pwd1!=pwd2) {
			msg="��й�ȣ�� Ȯ�����ּ���";
			frm.pwd2.focus();
			flag = false;
		} else if(name.replace(/(^\s*)|(\s*$)/, "").trim()==""){
			msg="�̸��� �Է��ϼ���";
			frm.name.focus();
			flag = false;
		} else if(birth1.trim()==""||birth2.trim()==""||birth3.trim()==""){
			msg="��������� �Է��ϼ���";
			frm.birth1.focus();
			flag = false;
		} else if(gender==""){
			msg="������ �Է��ϼ���";
			frm.gender.focus();
			flag = false;
		} else if(phone.trim()==""){
			msg="�޴���ȭ�� �Է��ϼ���";
			frm.phone.focus();
			flag = false;
		}
		alert(msg);
		if(flag==true)
			frm.submit();
	}
</script>
</html>