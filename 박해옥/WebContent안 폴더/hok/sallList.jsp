<%@page import="hok.UtilMgr"%>
<%@page import="hok.ProductBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="hok.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="hok.CartMgr"/>
<jsp:useBean id="pMgr" class="hok.ProductMgr"></jsp:useBean>
<%
	request.setCharacterEncoding("EUC-KR");
	if(session.getAttribute("idKey")==null){
		response.sendRedirect("login.jsp");
		return;
	}
	Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
	int totalPrice = 0;
		
%>
<html>
<head>
<title>NaverMall SallList</title>
<!--  <script src="script.js"/> �̷����ؼ� �ȵǴ� ��쵵 ����, �Ʒ��ڵ尡 ���� �ڵ���-->
<script src="script.js"></script>
</head>

<body bgcolor="#ECF6CE" topmargin="100">
<%@include file="top.jsp" %>	
<table width=75% align="center" bgcolor="#FFFF99" >
	<tr>
	<td align="center" bgcolor="#FFFFCC">
	<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr align="center" bgcolor="#04B431">
			<td><font color="#FFFFFF">��ǰ</font></td>
			<td><font color="#FFFFFF">����</font></td>
			<td><font color="#FFFFFF">����</font></td>
			<td><font color="#FFFFFF">��ȸ</font></td>
		</tr>
		<%if(hCart.isEmpty()){ %>
		<tr>
			<td colspan="4" align="center">��ٱ��ϴ� ������ϴ�.</td>
		</tr>
		<%}else{
			Enumeration<Integer> hCartKey=hCart.keys();//proNum
			while(hCartKey.hasMoreElements()){
				OrderBean order = hCart.get(hCartKey.nextElement());
				int proNum=order.getProNum();//��ǰ��ȣ
				ProductBean pbean=pMgr.getProduct(proNum);//��ǰ����
				String pName=pbean.getProName();//��ǰ�̸�
				int price=pbean.getPrice();//��ǰ����
				int ordAm=order.getOrdAm();//�ֹ�����
				int subTotal=price*ordAm;
				totalPrice+=subTotal;
				%>
				<tr align="center"	>
				
				    <input type="hidden" name="proNum" value="%=proNum%>">
					<td><%=pName%></td>
					<td><input name="ordAm" style="text-align: right;" value="<%=ordAm %>" size="3">��</td>
					<td><%=UtilMgr.monFormat(subTotal)%> ��</td>
					<td><a href="javascript:productDetail('%=proNum%>')">�󼼺���</a></td>
				
			</tr>
			<%}//while%> 
					
		   <%}//else%>
	</table>
    </td>
	</tr>
	</table>
	<table width=75% align="center" bgcolor="#FFFF99" >
	<tr>
	<td align="center" bgcolor="#FFFFCC">
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
				<tr><td><b>&nbsp;&nbsp;�����ݾ� :<input name="payMent" style="text-align: right;" 
				value="<%=UtilMgr.monFormat(totalPrice)%>">�� </b></td></tr>
				<tr><td><b>&nbsp;&nbsp;��ȭ��ȣ: </b> 
				<input name="ordPhone" size="15" value="010-1111-2222"></td></tr>
				<tr><td><b>&nbsp;&nbsp;������: </b>
					<select name="payMe"  >
					 	<option value="�������Ա�">�������Ա�</option>
					 	<option vlaue="ī�����" selected>ī�����</option>
					 	<option value="�ڵ�������">�ڵ�������</option>
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
				<tr><td align="center"><a href="orderProc.jsp"><b>[�����ϱ�]</b></a></td></tr>
	  	</table>
  		</td>
   		</tr>
	</table>
    <form name="detail" method="post" action="productDetail.jsp">
		<input type="hidden" name="proNum">
	</form>
	<%@ include file="bottom.jsp" %>
</body>
</html>
