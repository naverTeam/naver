<%@ page  contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>NaverMall ��ǰ���</title>
<script src="script.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body bgcolor="#ECF6CE" topmargin="50">
<%@ include file="top.jsp" %>
<form name="proForm" method="post" action="productProc.jsp?flag=insert" enctype="multipart/form-data">
<table width="75%" align="center" bgcolor="#FFFF99">
<tr>
<td align="center" bgcolor="#FFFFCC">
	<table width ="95%" bgcolor="#FFFF99" border="1">
	<tr bgcolor="#088A4B">
		<td colspan="2" align="center">
			<font color="#FFFFFF">��ǰ���</font>
		</td>	
	</tr>
	<tr>
		<td align="center"> ��ǰ�̸�</td>
		<td align="left"><input name="proName" size="20"></td>
	</tr>
	<tr>
		<td align="center"> ��    ��</td>
		<td align="left"><input name="price" size="20">��</td>
	</tr>
	<tr>
		<td align="center"> ��    ��</td>
		<td align="left"><input name="proAm" size="20">��</td>
	</tr>
	<tr>
		<td align="center"> id </td>
		<td align="left"><input name="id" size="20"></td>
	</tr>
	<tr>
		<td align="center"> email�ּ�</td>
		<td align="left"><input name="email" size="30"></td>
	</tr>
	<tr>
		<td align="center"> �� �� ��</td>
		<td align="left"><input name="name" size="20"></td>
	</tr>
	<tr>
		<td align="center"> ��    ��</td>
		<td><input   id="zipcode" size="10"  readonly > </input>
					<input type="button" onclick="execPostcode()" value="�����ȣ�˻�"  ><br>
					<input  type="text" id="devAd1" size=50  readonly><br>
					<input  type="text" id="devAd2" size="30" readonly><br>
					<input  type="text" id="devAd3" size="20" >
					</td></tr>
	</tr>
					<input type="hidden" name="czipcode">
					<input type="hidden" name="cdevAd1">
					<input type="hidden" name="cdevAd2">
					<input type="hidden" name="cdevAd3">				
	<tr>
		<td align="center"> ��ȭ��ȣ</td>
		<td align="left"><input name="proPhone" size="20"></td>
	</tr>
	<tr>
		<td align="center"> �� �� ��</td>
		<td align="left"><input name="bankNa" size="20"></td>
	</tr>
	<tr>
		<td align="center"> ���¹�ȣ</td>
		<td align="left"><input name="accNo" size="30"></td>
	</tr>
	<tr>
		<td align="center"> �� �� ��</td>
		<td align="left"><input name="accHo" size="20"></td>
	</tr>
	<tr>
		<td align="center"> ��ǰ�̹���</td>
		<td align="left"><input type="file"  name="proImg" ></td>
	</tr>
	<tr>
		<td align="center"> �󼼼���</td>
		<td ><textarea rows="10" cols="50" name="proDetail" ></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" onclick="inputCheck()" 
					style="background-color:#E0F2F7" value="��ǰ���"  >&nbsp;&nbsp;&nbsp;
			<input type="reset" style="background-color:#E0F2F7" value="�ٽþ���">
		</td>
	</tr>
	</table>
</td>
</tr>
</table>
								
</form>
<%@  include file="bottom.jsp" %>	
</body>
</html>