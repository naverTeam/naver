<%@ page contentType="text/html;charset=EUC-KR" %>
<html>
<head>
<title>������ �α���</title>
<link href="../style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#ECF6CE" topmargin="100">
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr bordercolor="#FFFF99">  
	<td height="190">
		<form method="post" action="adminLoginProc.jsp">
		<table width="50%" border="1" align="center">
		<tr bordercolor="#FFFF66"> 
		<td colspan="2" align="center">������ �α���</td>
		</tr>
		<tr  align="center"> 
		<td width="47%">Admin ID</td>
		<td width="53%"><input name="admin_id" value="admin"></td>
		</tr>
		<tr align="center"> 
		<td>Admin Password</td>
		<td><input name="admin_pwd" value="1234"></td>
		</tr>
		<tr> 
		<td colspan="2" align="center"><input type="submit" value="login">
		
		</td>
		</tr>
		</table>
		</form>	
	</td>
	</tr>
	</table>
</body>
</html>