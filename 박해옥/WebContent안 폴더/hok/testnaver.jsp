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
			<td><font color="#FFFFFF">제품</font></td>
			<td><font color="#FFFFFF">수량</font></td>
			<td><font color="#FFFFFF">가격</font></td>
			<td><font color="#FFFFFF">수정/삭제</font></td>
			<td><font color="#FFFFFF">조회</font></td>
		</tr>
		<tr>
			<td colspan="5" align="center">장바구니는 비었습니다.</td>
		</tr>
		<tr align="center"	>
			<form method="post" action="cartProc.jsp">
				<input type="hidden" name="proNum" value="%=proNum%>">
				<td>%=pName%></td>
				<td><input name="ordAm" style="text-align: right;" value="ordAm" size="3">개</td>
				<td>%=UtilMgr.monFormat(subTotal)%> 원</td>
				<td><input type="button" value="수정" size="3" onclick="javascript:cartUpdate(this.form)">
				/<input type="button" value="삭제" size="3" onclick="javascript:cartDelete(this.form)"></td>
				<td><a href="javascript:productDetail('%=proNum%>')">상세보기</a></td>
				<input type="hidden" name="flag">
			</form>
		</tr>
		<tr>
				<td colspan="4" align="right">총 주문 금액: %=UtilMgr.monFormat(totalPrice)%>원</td>
				<td align="center"><a href="orderProc.jsp">주문하기</a></td>
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


