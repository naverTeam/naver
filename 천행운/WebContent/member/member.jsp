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
			
				<label class="label">아이디</label>
				<div class="birthPart">
					<input type="text" name="id" class="signInput" style="width: 400px;">
					<input type="button" onclick="idCheck()" style="width: 50px; height: 57px; margin-bottom: 5px;">
				</div>
				
				<label class="label">비밀번호</label>
				<input type="text" name="pwd1" class="signInput">
				
				<label class="label">비밀번호 확인</label>
				<input type="text" name="pwd2" class="signInput">
				
				<label class="label" style="margin-top: 20px;">이름</label>
				<input type="text" name="name" class="signInput">
				
				<label class="label">생년월일</label>
				<div class="birthPart">
					<input type="text" name="birth1" class="signInput-3" placeholder="연">
					<select name="birth2" class="signInput-3"><option>월
						<option value="1">1월<option value="2">2월<option value="3">3월<option value="4">4월<option value="5">5월<option value="6">6월
						<option value="7">7월<option value="8">8월<option value="9">9월<option value="10">10월<option value="11">11월<option value="12">12월
					</select>
					<input type="text" name="birth3" class="signInput-3" placeholder="일">
				</div>
				
				
				<label class="label">성별</label>
				<select name="gender" class="signInput"><option>성별
					<option value="1">남자<option value="2">여자<option value="3">선택안함
				</select>
				
				<label class="label">휴대전화</label>
				<input type="text" name="phone" class="signInput">
				
				<input type="button" onclick="check()" value="가입하기" class="logInBtn" style="margin-top: 20px;">
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
		msg="가입성공";
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
			msg="아이디를 입력해주세요";
			frm.id.focus();
			flag = false;
		} else if(id.length < 8 || id.length > 12) {
			msg="아이디는 8 ~ 12자 이내로 입력해주세요";
			frm.id.focus();
			flag = false;
		} else if(pwd1=="") {
			msg="비밀번호를 입력하세요";
			frm.pwd1.focus();
			flag = false;
		} else if(pwd1.length < 8 || pwd1.length > 12) {
			msg="비밀번호는 8 ~ 12자 이내로 입력해주세요";
			frm.pwd1.focus();
			flag = false;
		} else if(pwd1!=pwd2) {
			msg="비밀번호를 확인해주세요";
			frm.pwd2.focus();
			flag = false;
		} else if(name.replace(/(^\s*)|(\s*$)/, "").trim()==""){
			msg="이름을 입력하세요";
			frm.name.focus();
			flag = false;
		} else if(birth1.trim()==""||birth2.trim()==""||birth3.trim()==""){
			msg="생년월일을 입력하세요";
			frm.birth1.focus();
			flag = false;
		} else if(gender==""){
			msg="성별을 입력하세요";
			frm.gender.focus();
			flag = false;
		} else if(phone.trim()==""){
			msg="휴대전화를 입력하세요";
			frm.phone.focus();
			flag = false;
		}
		alert(msg);
		if(flag==true)
			frm.submit();
	}
</script>
</html>