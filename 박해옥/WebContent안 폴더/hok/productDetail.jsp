<%@page import="hok.ProductBean"%>
<%@page import="hok.UtilMgr"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="hok.ProductMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	int proNum=UtilMgr.parseInt(request, "proNum");
	ProductBean pbean = pMgr.getProduct(proNum);
		
%>
<html>
<head>
<title>NaverMall ProDetail</title>
<script src="script.js"></script>
</head>
<body bgcolor="#ECF6CE" topmargin="100">
<%@include file="top.jsp"%>
<form name="cart" action="cartProc.jsp">
<table width="75%" align="center" bgcolor="#FFFF99" border="1">
<tr>
<td width="20%">
<img src="data/<%=pbean.getProImg() %>" height="200" width="200">
</td>
<td width="70" valign="top">
<table>
<tr><br></tr>
<tr><td><b>상품이름 : <%=pbean.getProName()%>   <br>평 점 : </b></td></tr>
<tr><td><b>판매가격 : <%=pbean.getPrice()%>  <br>상품등록일 : <%=pbean.getProDay() %> </b></td></tr>
<tr><td><b>수량 : <%=pbean.getProAm() %>    판매량 : <%=pbean.getSalAm() %>     재고량: 
<%=pbean.getStock() %></b><br><br></td></tr>

<tr><td> <input type="button" value="구매후기"> &nbsp; &nbsp;
 <input type="button" value="문의하기"> &nbsp;&nbsp;
 <input type="button" value="판매자정보" onclick="sallerInfo()"></td></tr>
 </table>
</td>
<td width="10" align="center">
<input type="button" style="width:50pt;height:80pt;" value="주문 하기">
</td>
</tr>
<tr><td colspan="3" align="center">상세설명<br>
 <%=pbean.getProDetail() %></td></tr>

</table>
</form>
<form name=frmsaller action="sallerInfo.jsp">
 <input type="hidden" name="saller" value = "<%=pbean.getName() %>">
 <input type="hidden" name="address" value="<%=pbean.getProAddress() %>">
 <input type="hidden" name="phone" value="<%=pbean.getProPhone() %>">
</form>
</body>
</html>