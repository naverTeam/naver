<%@page import="java.util.ArrayList"%>
<%@page import="member.MemberBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="member.MemberMgr"/>
<jsp:useBean id="bean" class="member.MemberBean"/>

<%
		request.setCharacterEncoding("EUC-KR");
		Vector<MemberBean> vlist = mgr.getid();
		ArrayList<String> idarr = new ArrayList<String>();
		for(int i = 0;i<vlist.size();i++){
			bean = vlist.get(i);
			idarr.add("'"+bean.getId()+"'");
		}
%>

<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<link rel="stylesheet" href="./resources/css/style.css">
	<style>
	.cdiv{
	color:red;
	margin-bottom: 15px;
	}
	</style>
</head>
<body>
	<div id="root">
		<form action="memberProc.jsp" name="memberFrm">
			<div class="container">
			
				<label class="label">���̵�</label>
				<div class="birthPart">
					<input type="text" name="id" class="signInput" style="width: 400px;" autocomplete="off" onblur="idCheck()">
					<input type="button" onclick="idCheck2()" style="width: 50px; height: 57px; margin-bottom: 5px;">
				</div><div id="idc" class="cdiv"></div>
				
				<label class="label">��й�ȣ</label>
				<input type="password" name="pwd1" class="signInput" onblur="pwCheck()">
				<div id="pw1" class="cdiv"></div>
				
				<label class="label">��й�ȣ Ȯ��</label>
				<input type="password" name="pwd2" class="signInput" onblur="pwCheck2()">
				<div id="pw2" class="cdiv"></div>
				
				<label class="label" style="margin-top: 20px;">�̸�</label>
				<input type="text" name="name" class="signInput" autocomplete="off" onblur="nCheck()">
				<div id="ndiv" class="cdiv"></div>
				
				<label class="label">�������</label>
				<div class="birthPart">
					<input type="text" name="birth1" class="signInput-3" placeholder="��" autocomplete="off" onblur="yyyyCheck()">
					<select name="birth2" class="signInput-3" onblur="mmCheck()"><option>��
						<option value="1">1��<option value="2">2��<option value="3">3��<option value="4">4��<option value="5">5��<option value="6">6��
						<option value="7">7��<option value="8">8��<option value="9">9��<option value="10">10��<option value="11">11��<option value="12">12��
					</select>
					<input type="text" name="birth3" class="signInput-3" placeholder="��" autocomplete="off" onblur="ddCheck()">
				</div>	<div id="bdiv" class="cdiv"></div>
				
				
				<label class="label">����</label>
				<select name="gender" class="signInput" onclick="select()"><option id="del">����
					<option value="1">����<option value="2">����<option value="3">���þ���
				</select>
				
				<label class="label">�޴���ȭ</label>
				<input type="text" name="phone" class="signInput" autocomplete="off" onblur="pnumCheck()">
				<div id="pndiv" class="cdiv"></div>
				
				<input type="button" onclick="check()" value="�����ϱ�" class="logInBtn" style="margin-top: 20px;">
			</div>
		</form>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
var frm = document.memberFrm;
var idarr2 = <%=idarr%>;

	function idCheck(){
		id = frm.id.value;
		var idc = document.getElementById("idc");
		var idcc=/^[0-9a-zA-Z]{8,12}$/;
		
		if(id.length<8||id.length>12){
			idc.style.color="red";
			idc.innerHTML="���̵� ���̴� 8~12�ڷ� ���ּ���.";
			return false;
		}else{
			if(idcc.test(id)){
				 if(idarr2.indexOf(id)>=0){
					 idc.style.color="red";
					 idc.innerHTML="���̵� �ߺ�üũ ���ּ���.";	
					 return true;
				 }else{
				idc.style.color="#40c700";
				idc.innerHTML="Ȯ��";	
				return true;
				 }
			}else{
				idc.style.color="red";
				idc.innerHTML="���̵�� ������ ���ڷθ� �����ϼ���.";
				return false;
			}
		}
	}
	
	function idCheck2() {  //�ߺ��˻� 
		id = frm.id.value;
		var idcc=/^[0-9a-zA-Z]{8,12}$/;
		
		if(id.length<8||id.length>12){
			var idc = document.getElementById("idc");
			idc.style.color="red";
			idc.innerHTML="���̵� ���̴� 8~12�ڷ� ���ּ���."
			
		}else{
			if(idcc.test(id)){
				//���ο� â ����
				window.open("idCheck.jsp?id="+id,"idcheck","width=500,height=300,left=700,top=300");
				
			}else{
				idc.style.color="red";
				idc.innerHTML="���̵�� ������ ���ڷθ� �����ϼ���.";
				
			}
		}
	}
	
	function pwCheck() {
		pwd1=frm.pwd1.value;
		var idcc=/^[0-9a-zA-Z]{8,12}$/;
		
		var pw1 = document.getElementById("pw1");
		
		if(pwd1.length<8||pwd1.length>12){
			pw1.style.color="red";
			pw1.innerHTML="��й�ȣ ���̴� 8~12�ڷ� ���ּ���.";
			return false;
		}else{
			if(idcc.test(pwd1)){
				pw1.style.color="#40c700";
				pw1.innerHTML="Ȯ��";
				return true;
			}else{
				pw1.style.color="red";
				pw1.innerHTML="��й�ȣ�� ������ ���ڷθ� �����ϼ���.";
				return false;
			}
				
		}
		
	}
	function pwCheck2() {
		pwd2=frm.pwd2.value;
		pwd1=frm.pwd1.value;
		
		var pw2 = document.getElementById("pw2");
		if(pwd1!=pwd2){
			pw2.style.color="red";
			pw2.innerHTML="��й�ȣ�� �ٸ��ϴ�.";	
			return false;
		}else{
			pw2.style.color="#40c700";
			pw2.innerHTML="Ȯ��";	
			return true;
		}
	}
	function nCheck() {
		var ndiv=document.getElementById("ndiv");
		name=frm.name.value;
		var ncheck = /^[��-��]{2,}$/;
		
		if(ncheck.test(name)){
			ndiv.style.color="#40c700";
			ndiv.innerHTML="Ȯ��";
			return true;
		}else{
			ndiv.style.color="red";
			ndiv.innerHTML="�̸��� Ȯ���ϼ���.";
			return false;
		}
		
	}
	function yyyyCheck() {
		var bdiv=document.getElementById("bdiv");
		yyyy=frm.birth1.value;
		var ycheck = /^([1-2]{1})-?([0|9]{1})-?([0-9]{2})$/;
		
		if(ycheck.test(yyyy)){
			bdiv.innerHTML="";
			return true;
		}else{
			bdiv.style.color="red";
			bdiv.innerHTML="�⵵�� Ȯ���ϼ���"
				return false;
		}
	}
	
	
	function mmCheck() {
		var bdiv=document.getElementById("bdiv");
		mm=frm.birth2.value;
		
		if(mm=='��'){
			bdiv.style.color="red"
			bdiv.innerHTML="���� Ȯ���ϼ���"
				return false;
		}else{
			bdiv.innerHTML=""
			return true;
		}
		
	}
	
	
	function ddCheck(){
		var bdiv=document.getElementById("bdiv");
		dd=frm.birth3.value;
		var dcheck1 = /^([1-9]{1})$/;  //���ڸ��� ��¥
		var dcheck2 = /^([1-2]{1})-?([0-9]{1})$/;  //���ڸ��� 1,2 �� �����ϴ� ��¥
		var dcheck3 = /^([3]{1})-?([0-1]{1})$/;  //���ڸ��� 3���� �����ϴ� ��¥
		
		if(dd.length==1){
			if(dcheck1.test(dd)){
				bdiv.style.color="#40c700"
				bdiv.innerHTML="Ȯ��"
					return true;
			}else{
				bdiv.style.color="red"
				bdiv.innerHTML="��¥�� Ȯ���ϼ���"
					return false;
			}
		}else if(dd.length==2){
				if(dd.substring(0,1)==3){
					if(dcheck3.test(dd)){
						bdiv.style.color="#40c700"
						bdiv.innerHTML="Ȯ��"
							return true;
					}else{
						bdiv.style.color="red"
						bdiv.innerHTML="��¥�� Ȯ���ϼ���"
							return false;
					}
				}else{
						if(dcheck2.test(dd)){
							bdiv.style.color="#40c700"
							bdiv.innerHTML="Ȯ��"
								return true;
						}else{
							bdiv.style.color="red"
							bdiv.innerHTML="��¥�� Ȯ���ϼ���"
								return false;
						}
				}
		}else{
			bdiv.style.color="red"
			bdiv.innerHTML="��¥�� Ȯ���ϼ���"
				return false;
		}
	}
	
	
	function select() {
	}
	
	function pnumCheck() {
		var pndiv=document.getElementById("pndiv");
		p=frm.phone.value;
		
		var pcheck = /^010-?([0-9]{3,4})-?([0-9]{4})$/;
		
		if(pcheck.test(p)){
			pndiv.style.color="#40c700"
			pndiv.innerHTML="Ȯ��"
				return true;
		}else{
			pndiv.style.color="red"
			pndiv.innerHTML="�ڵ��� ��ȣ�� Ȯ���ϼ���"
				return false;
		}
		
	}
	
	
	function check(){
		flag = true;
		msg="���Լ���";
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
		} else if(gender=="����"){
			msg="������ �Է��ϼ���";
			frm.gender.focus();
			flag = false;
		} else if(phone.trim()==""){
			msg="�޴���ȭ�� �Է��ϼ���";
			frm.phone.focus();
			flag = false;
		}else if(!idCheck()){
			msg="���̵� Ȯ���ϼ���";
			frm.id.focus();
			flag = false;
		}else if(!pwCheck()){
			msg="��й�ȣ�� Ȯ���ϼ���";
			frm.pwd1.focus();
			flag = false;
		}else if(!pwCheck2()){
			msg="��й�ȣ�� Ȯ���ϼ���";
			frm.pwd2.focus();
			flag = false;
		}else if(!nCheck()){
			msg="�̸��� Ȯ���ϼ���";
			frm.name.focus();
			flag = false;
		}else if(!yyyyCheck()){
			msg="�⵵�� Ȯ���ϼ���";
			flag = false;
		}else if(!mmCheck()){
			msg="���� Ȯ���ϼ���";
			flag = false;
		}else if(!ddCheck()){
			msg="��¥�� Ȯ���ϼ���";
			flag = false;
		}else if(!pnumCheck()){
			msg="�ڵ��� ��ȣ�� Ȯ���ϼ���";
			frm.phone.focus();
			flag = false;
		}else if(idarr2.indexOf(id)>=0){
				msg="���̵� �̹� �����մϴ�"
			flag = false;
		}
		alert(msg);
		if(flag==true)
			frm.submit();
	}
</script>
</html>