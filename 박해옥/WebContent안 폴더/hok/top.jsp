

<link href="style.css" rel="stylesheet" type="text/css">
<%@ page pageEncoding="EUC-KR"%>
<%
	String id = (String)session.getAttribute("id");
	
	String log="";
	if(id == null) log ="<a href=../member/login.jsp?returnPage=../hok/productList.jsp>로그인</a>";
	else log = "<a href=../member/logout.jsp>로그아웃</a>";

	String reg="";
	if(id == null) reg ="<a href=../member/member.jsp>회원가입</a>";
	else reg = "<a href=../member/update.jsp>회원수정</a>";
%>

<div class="mainText" width="75%" >Welcome NaverMall</div>
<table width="75%" align="center" bgcolor="#FFFF99">
  <tr bgcolor="#01DF3A"> 
  	<th><a href="../chu/index.jsp">네이버홈</a></th>
    <th><%=log%></th>
    <th><%=reg%></th>
    <th><a href="productList.jsp">상품목록</a></th>
    <th><a href="cartList.jsp">장바구니</a></th>
    <th><a href="orderList.jsp">구매목록</a></th>
  </tr>
</table>
