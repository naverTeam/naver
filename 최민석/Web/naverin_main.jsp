<%@page import="in.UtilMgr"%>
<%@page import="in.QuestionBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="mgr" class="in.QuestionMgr" />
  <%
   request.setCharacterEncoding("EUC-KR");
  int totalRecord = 0;//�ѰԽù���
	int numPerPage = 10;//�������� ���ڵ� ����(5,10,15,30)
	int pagePerBlock = 10;//���� ������ ����
	int totalPage = 0;//�� ������ ����
	int totalBlock =0;//�� �� ����
	int nowPage = 1;//���� ������
	int nowBlock = 1;//���� ��
	
	totalRecord = mgr.getTotalCount();
	
	//��û�� numPerPage ó��
	if(request.getParameter("numPerPage")!=null){
		//Integer.parseInt(request.getParameter(name));
		numPerPage = UtilMgr.parseInt(request, "numPerPage");
	}
	
	if(request.getParameter("nowPage")!=null){
		nowPage = UtilMgr.parseInt(request, "nowPage");
	}
	
//sql���� ���� start,cnt���� 
		int start =  (nowPage*numPerPage)-numPerPage;
		int cnt = numPerPage;
		
		//��ü������ ����
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//��ü�� ����
		 totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//�����
		nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���̹� ����iN</title>
<link href="header.css" rel="stylesheet" type="text/css">
<style>
.test{
border:0;
outline:0;
background:url('img/main.png');
width:100%;
height:700px;
background-size:100% 700px;
}
#toon{
border:0;
outline:0;
width:170px;height:40px;
background: url("img/toon.png");
background-size:170px 40px;
 position: absolute;
  top: -162px;
    left: 148px;
    cursor: pointer;
}
#reserv{
border:0;
outline:0;
width:170px;height:40px;
background: url("img/reserv.png");
background-size:170px 40px;
 position: absolute;
    top: -162px;
    left: 148px;
    cursor: pointer;
}
#pay{
border:0;
outline:0;
width:170px;height:40px;
background: url("img/pay.jpg");
background-size:170px 40px;
 position: absolute;
   top: -162px;
    left: 148px;
    cursor: pointer;
}
#nain{
border:0;
outline:0;
width:160px;height:40px;
background: url("img/nain1.jpg");
background-size:160px 40px;
 position: absolute;
    top: -162px;
    left: 158px;
    cursor: pointer;
}

video#bgvid {
width: 318px;
   border-radius: 30px;
    }

.relative{
position : relative;
}
#margin{
 margin-left: 300px;
 }
 #nlogin{
border:0;
outline:0;
width:270px;height:60px;
background: url("img/nlogin.png");
background-size:270px 60px;
    cursor: pointer;
    margin-left: -10px;
}
#body{
 background-color: #eeeeee;
 padding-bottom: 30px;
 height: 100%;
 }
 #mainboard{
 border: 1px solid #aaaaaa;
 width:970px;
 height:1200px;
 float: left;
 background-color: white;
 margin-left: 0px;
 }
 #maincontent{
 width:1300px;
 margin: 50px auto;
 padding-bottom:1150px;
 }
 #profile{
 width:310px;
 height:1200px;
 border:1px solid #aaaaaa;
 float:right;
 background-color: white;
 }
 #board{
 float:left;
 width:73%;
 height: 100%;
 margin-bottom: 100px;
 }
  #boardtable{
 width:100%;
 margin-bottom: 50px;
 }
 #sidebar{
 float:left;
 width:200px;
 border-right: 1px solid #cccccc; 	
 }
 #sidebar li{
 	list-style: none;
 	padding-top: 12px;
 	cursor: pointer;
 }
 #sidebar li:hover{
 color:#40c700;
}



 #boardtable td{
 font-size: 15px;
 height:50px;
 border-bottom:2px solid #dddddd;
 }
 #boardtable tr:hover{
 background-color: aliceblue;
 }
 #boardbar{
 width:95%;
 height:30px;
 text-align: right;
 }
 #boardbar li{
 float: left;
 margin-left: 30px;
 font-size: 18px;
 color:#aaaaaa;
 cursor: pointer;
 }
 #boardbar li:hover{
 color:#40c700;
 }
 #new:hover{
 text-decoration: underline;
 }
 .tag{
 background-color:rgb(119,188,215,0.3);
 margin-right: 20px;
 margin-bottom:20px;
 }
 #total{
 color:#40c700;
 font-size: 20px;
 font-weight: 900;
 }
 #total_date{
 font-size: 12px;
 color:#888;
 }
 #page{
 width: 70px;
 height: 50px;
 padding:7px;
 border: 1px solid white;
 text-decoration: none;
 color:#888;
 }
#page:hover{
border: 1px solid #ccc;
color:blue;
cursor: pointer;
}

</style>
<script type="text/javascript">

 function Cal(date12) {
	 var a = date12;
	 return a;
}
 function boardevent(num) {
	var e = document.getElementById(num);
	e.style.fontWeight= 'bold';
	e.style.color='#40c700';
}
	window.onload = function() {
		boardevent(1);
		boardevent(101);
	}
	function numPerFn(numPerPage) {
		document.readFrm.numPerPage.value=numPerPage;
		document.readFrm.submit();
	}
	function pageing(page) {
		document.readFrm.nowPage.value=page;
		document.readFrm.submit();
	}
	function block(block) {
		document.readFrm.nowPage.value=<%=pagePerBlock%>*(block-1)+1;
		document.readFrm.submit();
	}
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "read.jsp";
		document.readFrm.submit();
	}
</script>
</head>


<body>
<%@ include file="header.jsp" %>
<div id="body">
<hr style="margin-top:0px;margin-bottom: 20px;">
<span class="relative" id="margin">
<video autoplay loop muted  id="bgvid">
        <source src="img/read.mp4" type="video/mp4">
    </video>
    <button id="nain"></button>
    </span>
    
  <span class="relative">  
<video autoplay loop muted  id="bgvid">
        <source src="img/toon.mp4" type="video/mp4">
    </video>
<button id="toon"></button>
</span>

<span class="relative">
<video autoplay loop muted  id="bgvid">
        <source src="img/reserv.mp4" type="video/mp4">
    </video>
<button id="reserv"></button>
</span>

<span class="relative">
<video autoplay loop muted  id="bgvid">
        <source src="img/food.mp4" type="video/mp4">
    </video>
<button id="pay"></button>
</span>


<!-- ���� ������ -->
<div id="maincontent">

<!-- ���� �Խ��� -->
<div id="mainboard">
<h2 align="center" style="color:#888;" onclick="Cal(12)" >�亯�� ��ٸ��� ����</h2>
<hr style="width:90%;margin-bottom: 20px;">
<!-- ���̵� �޴��� -->
<div id="sidebar">
	<ul>
		<li onclick="boardevent(1)" id="1">��ü</li>
		<li onclick="boardevent(2)" id="2">����,�й�</li>
		<li onclick="boardevent(3)" id="3">��ǻ�����</li>
		<li onclick="boardevent(4)" id="4">����</li>
		<li onclick="boardevent(5)" id="5">�������̸�Ʈ,����</li>
		<li onclick="boardevent(6)" id="6">��Ȱ</li>
		<li onclick="boardevent(7)" id="7">�ǰ�</li>
		<li onclick="boardevent(8)" id="8">��ȸ,��ġ</li>
		<li onclick="boardevent(9)" id="9">����</li>
		<li onclick="boardevent(10)" id="10">����</li>
		<li onclick="boardevent(11)" id="11">������,����</li>
		<li onclick="boardevent(12)" id="12">����</li>
	</ul>
	<hr style="width:80%; margin-top: 30px;margin-bottom: 30px;">
	<ul style="padding-bottom: 30px;">
		<li onclick="boardevent(13)" id="13">��õ�о�</li>
		<li onclick="boardevent(14)" id="14">����,��ȥ</li>
		<li onclick="boardevent(15)" id="15">�ڵ���</li>
		<li onclick="boardevent(16)" id="16">����,���</li>
		<li onclick="boardevent(17)" id="17">�ȵ���̵���</li>
		<li onclick="boardevent(18)" id="18">����� �׷�</li>
		<li onclick="boardevent(19)" id="19">���� �Խ�,����</li>
		<li onclick="boardevent(20)" id="20">�ڵ�������</li>
		<li onclick="boardevent(21)" id="21">����ϰ���</li>
		<li onclick="boardevent(22)" id="22">���� ����,����</li>
		<li onclick="boardevent(23)" id="23">����Ʈ��</li>
	</ul>
</div>
<!-- �Խ��� -->
<div id="board" style="margin-left: 30px;">
<h2>��ü</h2>
<ul id="boardbar">
	<li style="margin-left: -35px; list-style:none;">
	        <form name="npFrm" method="post">
				<select  name="numPerPage" size="1" 
				onchange="numPerFn(this.form.numPerPage.value)">
    				<option value="5">5�� ����</option>
    				<option value="10" selected>10�� ����</option>
    				<option value="15">15�� ����</option>
   				</select>
   				</form>
   				<script>document.npFrm.numPerPage.value=<%=numPerPage%></script>
   			</li>
	<li id="101" style="margin-left: 220px" onclick="boardevent(101)">�亯������</li>
	<li id="102" onclick="boardevent(102)">ù����</li>
	<li id="103" onclick="boardevent(103)">�ֽż�</li>
	<li id="104" onclick="boardevent(104)">����������</li>
</ul>
<hr style="margin-bottom:0px;">
<table id="boardtable">
<%
	Vector<QuestionBean> vlist = mgr.getQuestionList(start,cnt);
	for(int i=0;i<vlist.size();i++){
		QuestionBean bean = vlist.get(i);
	%>
	<tr id="q">
		<td style="font-weight:bold;font-size: 18px;"><%=bean.getTitle() %></td>
		<td width="50px" style="color:#888;">�亯<%=bean.getAnswer_count() %></td>
		<td width="130px" style="color:#888;"><%=bean.getDirectory() %></td>
		<td style="text-align: right;color:#888;" id="test">
		<script>
			document.write(Cal(1236));
		</script>
		
		</td>
	</tr>
	
	<%
	}
%>


</table>
<table style="margin: 20px auto;">
<tr>
<td>
<!-- ����¡ �� �� Start -->
		<!-- ������ -->
		<%if(nowBlock>1){%>
		<a id="page" href="javascript:block('<%=nowBlock-1 %>')"><%="< "%>����</a>
			<%} %>
			<!-- ����¡ -->
		<%
				int pageStart = (nowBlock-1)*pagePerBlock+1;
				int pageEnd = (pageStart+pagePerBlock/*10*/)<totalPage?
						pageStart+pagePerBlock:totalPage+1;
				for(;pageStart<pageEnd;pageStart++){
		%>
		
		<a id="page" href="javascript:pageing('<%=pageStart%>')">
			<%if(nowPage==pageStart){%><font color="blue"><%}%>
				<%=pageStart%>
			<%if(nowPage==pageStart){%></font><%}%>
		</a>
		
		<%}//--for%>
		<!-- ������ -->
			<%if(totalBlock>nowBlock){%>
			
			<a id="page" href="javascript:block('<%=nowBlock+1 %>')">���� ></a>
			<%} %>
		<!-- ����¡ �� �� End -->
			</td>
</tr>
</table>
</div><!-- board -->

</div><!-- mainboard -->

<!-- ������ -->
<div id="profile">

<div style="padding-top: 20px;padding-left: 30px;background-color:aliceblue;height: 169px;">
<p style="color:#888;">������ �亯�� �ϰ�ʹٸ�,</p>
<button id="nlogin" type="button" onclick="location.href='../joon/login.jsp' "/><br><br><br><br>
<p id="new" style="color:#888;text-align: right;font-size: 15px;">ȸ������</p>
</div>
<hr style="margin-top:0px;">

<div style="padding-top: 20px;padding-left: 20px;padding-right: 20px;">
<p style="font-weight: bold">����iN �α��±�</p>
<p><span class="tag">#����ڵ����</span>
<span class="tag">#����</span>
<span class="tag">#����</span></p>
<p><a class="tag">#Ʈ��ġ</a>
<a class="tag">#û�����</a>
<a class="tag">#������</a></p>
<p><a class="tag">#�ڷγ�</a>
<a class="tag">#����Ȱ��</a>
<a class="tag">#�ڱ�Ұ���</a></p>
</div>
<hr>
<div style="padding-left: 30px;">
<h4>������ ������ �亯</h4>
<span id="total">123,123/123,123</span><br>
<span  id="total_date">2020.12.28</span>
<h4>���� �亯��</h4>
<span id="total">123,123,123,123</span><br>
<span id="total_date">since 2002</span>
</div>
</div>




</div><!-- maincontent -->
</div><!-- body -->
</body>


<!-- my menu -->
<span id="menutable" style="display:none" >
	<table>
	<tr>
	<th colspan="4" align="left" height="10px" width="280px">
	My Menu</th>
	</tr>
		<tr>
			<td>ī��</td>
			<td>��α�</td>
			<td>����</td>
			<td>����</td>
		</tr>
		<tr>
			<td>����</td>
			<td>����</td>
			<td>����Ʈ</td>
			<td>����</td>
		</tr>
		<tr>
			<td>����</td>
			<td>��ȭ</td>
			<td>����</td>
			<td>�ε���</td>
		</tr>
		<tr>
			<td>����</td>
			<td>����</td>
			<td>å</td>
			<td>������</td>
		</tr>
	</table>
</span>

<form name="readFrm">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	<input type="hidden" name="num">
</form>

<%@ include file="footer.jsp" %>
</html>