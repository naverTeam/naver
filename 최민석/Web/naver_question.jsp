<%@ page  contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����ϱ�</title>
<link href="header.css" rel="stylesheet" type="text/css">
<style>
#body{
background-color: #eee;
}
#title{
margin-left: 100px;
position: relative;
}
#titletext{
width: 600px;
height: 40px;
 position: absolute;
    top: 70px;
    left: 110px;
    border: 2px solid #888;
    
}
#titletext:focus {
	border: 2px solid #40c700;
	outline: none;
}
#ta{
background-color: aliceblue;
border: 2px solid #888;
margin-left: 100px;
margin-top: 30px;
}
#ta:focus{
border: 2px solid #40c700;
outline: none;
}
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="body">
<form method="post" action="question" enctype="multipart/form-data">
<hr style="margin-top:0px;margin-bottom: 20px;">
<div style="width: 1300px;height: 1000px;background-color:white;margin: 30px auto;border: 1px solid #aaa;">
<a name="id" value="testid"></a>
<input type="text" name="id">
<img  src="img/question.png" style="width: 40px;height: 40px;margin-top: 70px;border-radius: 10px;">
<a style="font-size: 23px;color:#40c700;font-weight: 900;">����</a>
<input type="text" id="titletext" name="title">
</div>
<div>
<textarea id="ta" rows="25" cols="99" name="content"></textarea><br>
<input type="file" name="filename" size="50" maxlength="50">
<input type="submit" value="���">
</div>
</div>
</form>
</div><!-- body -->









<!-- my menu -->
<span id="menutable" style="display:none" >
	<table>
	<tr>
	<th colspan="4" align="left" height="10px" width="280px">
	My Menu</th>
	</tr>
		<tr>
			<td>ī��</td>
			<td>��α�</td>
			<td>����</td>
			<td>����</td>
		</tr>
		<tr>
			<td>����</td>
			<td>����</td>
			<td>����Ʈ</td>
			<td>����</td>
		</tr>
		<tr>
			<td>����</td>
			<td>��ȭ</td>
			<td>����</td>
			<td>�ε���</td>
		</tr>
		<tr>
			<td>����</td>
			<td>����</td>
			<td>å</td>
			<td>������</td>
		</tr>
	</table>
</span>
<%@ include file="footer.jsp" %>
</body>