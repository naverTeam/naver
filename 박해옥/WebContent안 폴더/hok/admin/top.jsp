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
    <th><a href="../productList.jsp">碱俏隔权</a></th>
    <th><a href="adminLogout.jsp">肺弊酒眶</a></th>
    <th><a href="productMgr.jsp">惑前包府</a></th>
    <th><a href="orderMgr.jsp">林巩包府</a></th>
  </tr>
</table> 