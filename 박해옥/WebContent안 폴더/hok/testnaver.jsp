<%@ page  contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		
%>
<html>
<head>
<title>NaverMall CartList</title>
</head>

<body bgcolor="#996600" topmargin="100">
<%@include file="top.jsp" %>	
<table width=75% align="center" bgcolor="#FFFF99" >
	<tr>
	<td align="center" bgcolor="#FFFFCC">
	<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr align="center" bgcolor="#996600">
			<td><font color="#FFFFFF">��ǰ</font></td>
			<td><font color="#FFFFFF">����</font></td>
			<td><font color="#FFFFFF">����</font></td>
			<td><font color="#FFFFFF">����/����</font></td>
			<td><font color="#FFFFFF">��ȸ</font></td>
		</tr>
		<tr>
			<td colspan="5" align="center">��ٱ��ϴ� ������ϴ�.</td>
		</tr>
		<tr align="center"	>
			<form method="post" action="cartProc.jsp">
				<input type="hidden" name="proNum" value="%=proNum%>">
				<td>%=pName%></td>
				<td><input name="ordAm" style="text-align: right;" value="ordAm" size="3">��</td>
				<td>%=UtilMgr.monFormat(subTotal)%> ��</td>
				<td><input type="button" value="����" size="3" onclick="javascript:cartUpdate(this.form)">
				/<input type="button" value="����" size="3" onclick="javascript:cartDelete(this.form)"></td>
				<td><a href="javascript:productDetail('%=proNum%>')">�󼼺���</a></td>
				<input type="hidden" name="flag">
			</form>
		</tr>
		<tr>
				<td colspan="4" align="right">�� �ֹ� �ݾ�: %=UtilMgr.monFormat(totalPrice)%>��</td>
				<td align="center"><a href="orderProc.jsp">�ֹ��ϱ�</a></td>
		</tr>	
	</table>
    </td>
	</tr>
	</table>
<%@ include file="bottom.jsp" %>
    <form name="detail" method="post" action="productDetail.jsp">
		<input type="hidden" name="proNum">
	</form>
</body>
</html>


