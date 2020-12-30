<!-- sallerInfo.jsp -->
<link href="style.css" rel="stylesheet" type="text/css">
<%@ page  contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String saller = request.getParameter("saller"); 	
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
		
%>
<table width="75%" align="center" bgcolor="#FFFF99">
  <tr bgcolor="#FFCC00"> 
  	<th align="center"><h1>판매자 정보</h1></th>
  </tr>
  	<tr align="center"><td><br> 판    매    자 : <%=saller %> </td></tr>
  	<tr align="center"><td> 판 매 자 주 소 : <%=address %></td></tr>
  	<tr align="center"><td> 판매자 전화번호 : <%=phone %></td></tr>
  	<tr><td align="center"><br><br>
  	<input type="button" value="돌아가기" onClick="history.back()">
  	 </td></tr>
  	
  <!--  <tr><td align="center">[돌아가기]</b></td></tr>  --> 
</table>
