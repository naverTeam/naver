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
			
				<label class="label">아이디</label>
				<input type="text" name="id" class="signInput">
				
				<label class="label">비밀번호</label>
				<input type="text" name="pwd1" class="signInput">
				
				<label class="label">비밀번호 확인</label>
				<input type="text" name="pwd2" class="signInput">
				
				<label class="label" style="margin-top: 20px;">이름</label>
				<input type="text" name="name" class="signInput">
				
				<label class="label">생년월일</label>
				<input type="text" name="birth" class="signInput">
				
				<label class="label">성별</label>
				<input type="text" name="gender" class="signInput">
				
				<label class="label">휴대전화</label>
				<input type="text" name="phone" class="signInput">
				
				<input type="button" onclick="check()" value="가입하기" class="logInBtn" style="margin-top: 20px;">
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	function check(){
		msg="가입성공";
		frm = document.memberFrm;
		id = frm.id.value;
		pwd1 = frm.pwd1.value;
		pwd2 = frm.pwd2.value;
		name = frm.name.value;
		birth = frm.birth.value;
		gender = frm.gender.value;
		phone = frm.phone.value;
		if(id.trim()=="") {
			msg="아이디를 입력하세요";
			frm.id.focus();
		} else if(id.length < 8 || id.length > 12) {
			msg="아이디는 8 ~ 12자 이내로 입력해주세요.";
			frm.id.focus();
		} else if(pwd1=="") {
			msg="비밀번호를 입력하세요";
			frm.pwd1.focus();
		} else if(pwd1.length < 8 || pwd1.length > 12) {
			msg="비밀번호는 8 ~ 12자 이내로 입력해주세요.";
		}
		alert(msg);
	}
</script>
</html>