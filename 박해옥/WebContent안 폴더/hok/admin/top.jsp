<link href="../style.css" rel="stylesheet" type="text/css">
<%@ page pageEncoding="EUC-KR"%>
<%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("adminLogin.jsp");
	}
%>
<div class="mainText"  >Welcome NaverMall</div>
<table width="75%" align="center" bgcolor="#FFFF99">
  <tr bgcolor="#01DF3A"> 
    <th><a href="../productList.jsp">���θ�Ȩ</a></th>
    <th><a href="adminLogout.jsp">�α׾ƿ�</a></th>
    <th><a href="productMgr.jsp">��ǰ����</a></th>
    <th><a href="orderMgr.jsp">�ֹ�����</a></th>
  </tr>
</table> 