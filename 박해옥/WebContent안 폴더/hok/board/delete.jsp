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
	//����޾� ���Ǿ��� ����� ��ġ�ϸ� ����
	if(request.getParameter("pass") !=null){
		BoardBean bean = (BoardBean)session.getAttribute("bean");
		//�Ʒ��� ����ڰ� �����Ҷ� �Է��� ���
		String inPass = request.getParameter("pass");
		//���ǿ� ����� ���
		String dbPass=bean.getPass();
		if(inPass.equals(dbPass)){//==�� ��ü �ּҰ��� �������� equals�Լ��� ����Ͽ� ���� ���Ѵ�.
			mgr.deleteBoard(num,bean.getFilename());
			String url="list.jsp?nowPage="+nowPage;
			response.sendRedirect(url);
			
		}else{%>
		<script type="text/javascript">
			alert("�Է��Ͻ� ��й�ȣ�� �ƴմϴ�.");
			history.back();
		</script>
		<%} 
	}else{//����� �Է¹ޱ� ������ ���
%>	
<title>NaverMall ����Է���</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function check() {
		if(document.delFrm.pass.value==""){
			alert("�н����带 �Է��ϼ���.");
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
			������� ��й�ȣ�� �Է��� �ּ���.
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
								<input type="button" value="�����Ϸ�" onclick="check()">
								<input type="reset" value="�ٽþ���">
								<input type="button" value="�ڷ�" onclick="history.go(-1)">
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