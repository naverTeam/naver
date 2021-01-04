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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body bgcolor="#ECF6CE" topmargin="100">
<%@include file="top.jsp" %>	

<table width=75% align="center" bgcolor="#FFFF99" >
	<tr>
	<td align="center" bgcolor="#FFFFCC">
	<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<tr align="center" bgcolor="#04B431">
			<td width ="25%" ><font color="#FFFFFF">��ǰ</font></td>
			<td width ="25%" ><font color="#FFFFFF">����</font></td>
			<td width ="25%" ><font color="#FFFFFF">����</font></td>
			<td width ="25%" ><font color="#FFFFFF">��ȸ</font></td>
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
					<td><%=ordAm %>��</td>
					<td><%=UtilMgr.monFormat(subTotal)%> ��</td>
					<td><input type="button" value="�󼼺���" style="background-color:#E0F2F7" 
						onclick="productDetail('<%=pbean.getProNum()%>')"></td>
				
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
		<!--  action="orderProc.jsp"-->
		<form name="sallForm" method="post" action="payProc2.jsp" >
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
				<tr><td width="20%" align="center"><b>�� �� �� �� </b></td>
				<td width="80%"><input name="totalPrice" value="<%=totalPrice%>" 
				style = "text-align:right;" size="10" readyonly >��</td></tr>
				<tr><td align="center"><b>�� ȭ �� ȣ </b></td> 
				<td><input name="ordPhone" size="15" ></td></tr>
				<tr><td align="center"><b>�� �� �� �� </b></td>
				<td>	<select name="payMe"  >
					 	<option value="�������Ա�">�������Ա�</option>
					 	<option vlaue="ī�����" selected>ī�����</option>
					 	<!--  <option value="�ڵ�������">�ڵ�������</option>-->
					 </select>
				 </td></tr>
				 <tr><td align="center"><b>�� �� �� �� </b> </td>
				<td><input name="payName" size="15" ></td></tr>	
				<tr><td align="center"><b>����� �ּ� </b> </td>
				
				<td><input   id="zipcode" size="10"  readonly > </input>
				<input type="button" onclick="execPostcode()" value="�����ȣ�˻�"  ><br>
				<input  type="text" id="devAd1" size=50  readonly><br>
				<input  type="text" id="devAd2" size="30" readonly><br>
				<input  type="text" id="devAd3" size="20" >
				</td></tr>
				<tr><td align="center"><b>�޴»���̸� </b> </td>
				<td><input name="devNa" size="15" ></td></tr>
				<tr><td align="center"><b>�޴»����ȭ��ȣ </b> </td>
				<td><input name="devPhone" size="15" ></td></tr>
				<tr><td align="center" colspan="2"><input type="button" onclick="inputCheck()" 
					style="background-color:#E0F2F7" value="[�����ϱ�]"  ></td></tr>
	  	</table>
	  	
					<input type="hidden" name="czipcode">
					<input type="hidden" name="cdevAd1">
					<input type="hidden" name="cdevAd2">
					<input type="hidden" name="cdevAd3">
	</form>
  		</td>
   		</tr>
	</table>
    <form name="detail" method="post" action="productDetail.jsp">
		<input type="hidden" name="proNum">
	</form>
	<%@ include file="bottom.jsp" %>
</body>
</html>
