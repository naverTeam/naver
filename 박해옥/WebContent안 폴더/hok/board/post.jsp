<%@ page  contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>NaverMall Board</title>
</head>
<body bgcolor="#ECF6CE" topmargin="50">
<%@include file="top.jsp" %>
<table width="75%" align="center" bgcolor="#FFFF99" border="1">
<tr>
<td align="center" bgcolor="#FFFFCC">	
	<table width="95%" cellpadding="3">
		<tr>
			<td bgcolor="#84F399" height="25" align="center">�۾���</td>
		</tr>
	</table>
	<br/>
	<form name="postFrm" method="post" action="boardPost"
	enctype="multipart/form-data">
	<table width="95%" cellpadding="3" align="center">
		<tr>
			<td width="10%" > ����</td>
			<td width="70%">
			<input name="name" size="10" maxlength="8">
			</td>
		</tr>
		<tr>
			<td>����</td>
			<td>
			<input name="subject" size="50" maxlength="30">
			</td>
		</tr>
		<tr>
			<td>����</td>
			<td>
			<textarea name="content" rows="10" cols="50"></textarea>
			</td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td>
			<input type="password" name="pass" size="15" 
			maxlength="15" value="1234">
			</td>
		</tr>
		<tr>
			<td>����ã��</td>
			<td>
			<input type="file" name="filename" size="50"> 
			</td>
		</tr>
		<tr>
			<td>����Ÿ��</td>
			<td>HTML<input type="radio" name="contenType" vlaue="HTTP">
			&nbsp;&nbsp;&nbsp;
			TEXT<input type="radio" name="contentType" value="TEXT" checked> 
			</td>
		</tr>
		<tr>
			<td colspan="2"><hr/></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="���">
				<input type="reset" value="�ٽþ���">
				<input type="button" value="����Ʈ" 
				onclick="javascript:location.href='list.jsp' ">
			</td>
		</tr>
	</table>
	<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
	<input type="hidden" name="proNum" value="1">
	</form>
</td>
</tr>
</table>
<%@ include file="bottom.jsp" %>
</body>
</html>