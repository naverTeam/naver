<%@ page pageEncoding="EUC-KR"%>
<%@include file="top.jsp" %>
 <table width=75% align="center" bgcolor="#FFFF99" >
	<tr>
	<td align="center" bgcolor="#FFFFCC">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
				<tr><td><b>&nbsp;&nbsp;�����ݾ� :  %=UtilMgr.monFormat(totalPrice)%>��</b></td></tr>
				<tr><td><b>&nbsp;&nbsp;��ȭ��ȣ: </b> 
				<input name="ordPhone" size="15" value="010-1111-2222"></td></tr>
				<tr><td><b>&nbsp;&nbsp;������: </b>
					<select name="payMe"  >
					 	<option value="1">�������Ա�</option>
					 	<option vlaue="2" selected>ī�����</option>
					 	<option value="3">�ڵ�������</option>
					 </select>
				 </td></tr>
				 <tr><td><b>&nbsp;&nbsp;�Ա��ڸ�: </b> 
				<input name="payName" size="15" value="���̹�"></td></tr>	
				<tr><td><b>&nbsp;&nbsp;������ּ�: </b> 
				
				<input name="zipcode" size="10" > 
				<input type="button" value="�����ȣ�˻�"><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="devAd1" size=50><br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="devAd2" size="20">
				</td></tr>
				<tr><td><b>&nbsp;&nbsp;�޴»���̸�: </b> 
				<input name="devNa" size="15" value="���̹�"></td></tr>
				<tr><td><b>&nbsp;&nbsp;�޴»����ȭ��ȣ: </b> 
				<input name="devPhone" size="15" value="010-1111-2222"></td></tr>
	  	</table>
  	</td>
   </tr>
</table>
<%@include file="bottom.jsp" %>