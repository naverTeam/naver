<%@ page  contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>NaverMall 상품등록</title>
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
			<font color="#FFFFFF">상품등록</font>
		</td>	
	</tr>
	<tr>
		<td align="center"> 상품이름</td>
		<td align="left"><input name="proName" size="20"></td>
	</tr>
	<tr>
		<td align="center"> 가    격</td>
		<td align="left"><input name="price" size="20">원</td>
	</tr>
	<tr>
		<td align="center"> 수    량</td>
		<td align="left"><input name="proAm" size="20">개</td>
	</tr>
	<tr>
		<td align="center"> id </td>
		<td align="left"><input name="id" size="20"></td>
	</tr>
	<tr>
		<td align="center"> email주소</td>
		<td align="left"><input name="email" size="30"></td>
	</tr>
	<tr>
		<td align="center"> 판 매 자</td>
		<td align="left"><input name="name" size="20"></td>
	</tr>
	<tr>
		<td align="center"> 주    소</td>
		<td><input   id="zipcode" size="10"  readonly > </input>
					<input type="button" onclick="execPostcode()" value="우편번호검색"  ><br>
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
		<td align="center"> 전화번호</td>
		<td align="left"><input name="proPhone" size="20"></td>
	</tr>
	<tr>
		<td align="center"> 은 행 명</td>
		<td align="left"><input name="bankNa" size="20"></td>
	</tr>
	<tr>
		<td align="center"> 계좌번호</td>
		<td align="left"><input name="accNo" size="30"></td>
	</tr>
	<tr>
		<td align="center"> 예 금 주</td>
		<td align="left"><input name="accHo" size="20"></td>
	</tr>
	<tr>
		<td align="center"> 상품이미지</td>
		<td align="left"><input type="file"  name="proImg" ></td>
	</tr>
	<tr>
		<td align="center"> 상세설명</td>
		<td ><textarea rows="10" cols="50" name="proDetail" ></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" onclick="inputCheck()" 
					style="background-color:#E0F2F7" value="상품등록"  >&nbsp;&nbsp;&nbsp;
			<input type="reset" style="background-color:#E0F2F7" value="다시쓰기">
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