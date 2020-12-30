<%@ page pageEncoding="EUC-KR"%>
<%@include file="top.jsp" %>
 <table width=75% align="center" bgcolor="#FFFF99" >
	<tr>
	<td align="center" bgcolor="#FFFFCC">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
				<tr><td><b>&nbsp;&nbsp;결제금액 :  %=UtilMgr.monFormat(totalPrice)%>원</b></td></tr>
				<tr><td><b>&nbsp;&nbsp;전화번호: </b> 
				<input name="ordPhone" size="15" value="010-1111-2222"></td></tr>
				<tr><td><b>&nbsp;&nbsp;결재방법: </b>
					<select name="payMe"  >
					 	<option value="1">무통장입금</option>
					 	<option vlaue="2" selected>카드결제</option>
					 	<option value="3">핸드폰결재</option>
					 </select>
				 </td></tr>
				 <tr><td><b>&nbsp;&nbsp;입금자명: </b> 
				<input name="payName" size="15" value="네이버"></td></tr>	
				<tr><td><b>&nbsp;&nbsp;배송지주소: </b> 
				
				<input name="zipcode" size="10" > 
				<input type="button" value="우편번호검색"><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="devAd1" size=50><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="devAd2" size="20">
				</td></tr>
				<tr><td><b>&nbsp;&nbsp;받는사람이름: </b> 
				<input name="devNa" size="15" value="네이버"></td></tr>
				<tr><td><b>&nbsp;&nbsp;받는사람전화번호: </b> 
				<input name="devPhone" size="15" value="010-1111-2222"></td></tr>
	  	</table>
  	</td>
   </tr>
</table>
<%@include file="bottom.jsp" %>