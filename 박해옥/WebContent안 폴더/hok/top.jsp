

<link href="style.css" rel="stylesheet" type="text/css">
<%@ page pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("idKey");
	
	String log="";
	if(id == null) log ="<a href=login.jsp>�α���</a>";
	else log = "<a href=logout.jsp>�α׾ƿ�</a>";

	String reg="";
	if(id == null) reg ="<a href=member.jsp>ȸ������</a>";
	else reg = "<a href=update.jsp>ȸ������</a>";
%>

<div class="mainText" width="75%" >Welcome NaverMall</div>
<table width="75%" align="center" bgcolor="#FFFF99">
  <tr bgcolor="#01DF3A"> 
  	<th><a href="../chu/index.jsp">���̹�Ȩ</a></th>
    <th><%=log%></th>
    <th><%=reg%></th>
    <th><a href="productList.jsp">��ǰ���</a></th>
    <th><a href="cartList.jsp">��ٱ���</a></th>
    <th><a href="orderList.jsp">���Ÿ��</a></th>
  </tr>
</table>
