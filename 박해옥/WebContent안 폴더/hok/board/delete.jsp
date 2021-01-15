<%@page import="hok.BoardBean"%>
<%@page import="hok.UtilMgr"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="hok.BoardMgr"/>
<html>
<head>
<%
	request.setCharacterEncoding("EUC-KR");
	String nowPage = request.getParameter("nowPage");
	int num = UtilMgr.parseInt(request,"num");
	//비번받아 세션안의 비번과 일치하면 삭제
	if(request.getParameter("pass") !=null){
		BoardBean bean = (BoardBean)session.getAttribute("bean");
		//아래는 사용자가 삭제할때 입력한 비번
		String inPass = request.getParameter("pass");
		//세션에 저장된 비번
		String dbPass=bean.getPass();
		if(inPass.equals(dbPass)){//==는 객체 주소값을 비교함으로 equals함수를 사용하여 값을 비교한다.
			mgr.deleteBoard(num,bean.getFilename());
			String url="list.jsp?nowPage="+nowPage;
			response.sendRedirect(url);
			
		}else{%>
		<script type="text/javascript">
			alert("입력하신 비밀번호가 아닙니다.");
			history.back();
		</script>
		<%} 
	}else{//비번을 입력받기 위한폼 출력
%>	
<title>NaverMall 비번입력폼</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function check() {
		if(document.delFrm.pass.value==""){
			alert("패스워드를 입력하세요.");
			document.delFrm.pass.focus();
		}
		document.delFrm.submit();
	}
</script>
</head>
<body bgcolor="#ECF6CE">
<div align="center"><br/><br/>
	<table width="50%" cellspacing="0" cellpadding="3">
		<tr>
			<td bgcolor="#dddddd" height="21" align="center">
			사용자의 비밀번호를 입력해 주세요.
			</td>
		</tr>
	</table>
	<form name="delFrm" method="post">
		<table width="70%" cellspacing="0" cellpadding="2">
			<tr>
				<td align="center">
					<table width="80%">
						<tr>
							<td align="center">
								<input type="password" name="pass" size="17" maxlength="15">
							</td>
						</tr>
						<tr>
							<td><hr size="1"" color="#eeeeee"/></td>
						</tr>
						<tr>
							<td align="center">
								<input type="button" value="삭제완료" onclick="check()">
								<input type="reset" value="다시쓰기">
								<input type="button" value="뒤로" onclick="history.go(-1)">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</div>
<%} %>
</body>
</html>