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
  	<th align="center"><h1>�Ǹ��� ����</h1></th>
  </tr>
  	<tr align="center"><td> ��    ��    �� : <%=saller %> </td></tr>
  	<tr align="center"><td> �� �� �� �� �� : <%=address %></td></tr>
  	<tr align="center"><td> �Ǹ��� ��ȭ��ȣ : <%=phone %></td></tr>
  	
  <!--  <tr><td align="center">[���ư���]</b></td></tr>  --> 
</table>
