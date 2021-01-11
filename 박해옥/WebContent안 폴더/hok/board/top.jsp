

<link href="style.css" rel="stylesheet" type="text/css">
<%@ page pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("id");
	
	String log="";
	if(id == null) log ="<a href=../../member/login.jsp>로그인</a>";
	else log = "<a href=../../member/logout.jsp>로그아웃</a>";

	
%>

<div class="mainText" width="75%" >Welcome NaverMall</div>
<table width="75%" align="center" bgcolor="#FFFF99">
  <tr bgcolor="#01DF3A"> 
  	<th><a href="../../chu/index.jsp">네이버홈</a></th>
    <th><%=log%></th>
     <th><a href="../productList.jsp">상품목록</a></th>
    <th><a href="../cartList.jsp">장바구니</a></th>
    <th><a href="../orderList.jsp">구매목록</a></th>
  </tr>
</table>
