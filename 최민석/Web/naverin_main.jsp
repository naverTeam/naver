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
	
	
	String dir="��ü";
	if(request.getParameter("dir")!=null){
		dir = request.getParameter("dir");
	}
	
	int where=9;
	if(request.getParameter("where")!=null){
		where = Integer.parseInt(request.getParameter("where"));
	}
	
	
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
 margin-bottom: 50px;
 width: 720px;
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
 cursor: pointer;
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

 function Cal(boardDate) {
	 let today = new Date();   
	 let year = today.getFullYear(); // ����⵵
	 let month = today.getMonth() + 1;  // �����
	 let date = today.getDate();  // ���糯¥
	 let hours = today.getHours(); // �����
	 let minutes = today.getMinutes();  // �����
	 let seconds = today.getSeconds();  // ������
	 let ymd = boardDate.substring(0,boardDate.lastIndexOf(" "));//�Խù� �����
	 let h = boardDate.substring(10,13);//�Խù� ��
	 let m = boardDate.substring(14,16);//�Խù� ��
	 let s = boardDate.substring(17,19);//�Խù� ��
	 if(s.substring(0,1)==0)  //���ڸ������ ���� 0�ڸ���
		 s=s.substring(1,2);
	 
	 var b = year+"-"+month+"-"+date;  //���� �����
	 if(b!=ymd){
	    return ymd;
	 }else if(hours-h>=2){
		return hours-h+"�ð���";
	 }else if(hours-h==1){
		 return m-minutes<=0?"1�ð���":minutes+60-m+"����";
	 }else if(hours==h){
		 return minutes==m?seconds-s+"����":minutes-m+"����";
	 }
}
	 function boardevent(dir) {
		document.readFrm.dir.value = dir;
		document.readFrm.submit();
	}
	 function boardlist(where) {
			document.readFrm.where.value = where;
			document.readFrm.submit();
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
	
	function boardRead(qnum) {
		document.readFrm.qnum.value = qnum;
		document.readFrm.action = "boardRead.jsp";
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
<form method="post" name="diFrm">
	<ul>
		<li onclick="boardevent('��ü')" id="��ü">��ü</li>
		<li onclick="boardevent('����,�й�')" id="����,�й�">����,�й�</li>
		<li onclick="boardevent('��ǻ�����')" id="��ǻ�����">��ǻ�����</li>
		<li onclick="boardevent('����')" id="����">����</li>
		<li onclick="boardevent('�������̸�Ʈ,����')" id="�������̸�Ʈ,����">�������̸�Ʈ,����</li>
		<li onclick="boardevent('��Ȱ')" id="��Ȱ">��Ȱ</li>
		<li onclick="boardevent('�ǰ�')" id="�ǰ�">�ǰ�</li>
		<li onclick="boardevent('��ȸ,��ġ')" id="��ȸ,��ġ">��ȸ,��ġ</li>
		<li onclick="boardevent('����')" id="����">����</li>
		<li onclick="boardevent('����')" id="����">����</li>
		<li onclick="boardevent('������,����')" id="������,����">������,����</li>
		<li onclick="boardevent('����')" id="����">����</li>
	</ul>
	<hr style="width:80%; margin-top: 30px;margin-bottom: 30px;">
	<ul style="padding-bottom: 30px;">
		<label style="font-weight: bold;">��õ�о�</label>
		<li onclick="boardevent('����,��ȥ')" id="����,��ȥ">����,��ȥ</li>
		<li onclick="boardevent('�ڵ���')" id="�ڵ���">�ڵ���</li>
		<li onclick="boardevent('����,���')" id="����,���">����,���</li>
		<li onclick="boardevent('�ȵ���̵���')" id="�ȵ���̵���">�ȵ���̵���</li>
		<li onclick="boardevent('����� �׷�')" id="����� �׷�">����� �׷�</li>
		<li onclick="boardevent('���� �Խ�,����')" id="���� �Խ�,����">���� �Խ�,����</li>
		<li onclick="boardevent('�ڵ�������')" id="�ڵ�������">�ڵ�������</li>
		<li onclick="boardevent('����ϰ���')" id="����ϰ���">����ϰ���</li>
		<li onclick="boardevent('���� ����,����')" id="���� ����,����">���� ����,����</li>
		<li onclick="boardevent('����Ʈ��')" id="����Ʈ��">����Ʈ��</li>
	</ul>
	</form>
	<script>
	var e = document.getElementById('<%=dir%>');
			e.style.color='#40c700';
			e.style.fontWeight='bold';
	</script>
</div>
<!-- �Խ��� -->
<div id="board" style="margin-left: 30px;">
<h2><%=dir%></h2>
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
   			<form name = "whereFrm" method="post">
	<li id="9"  style="margin-left: 240px" onclick="boardlist(9)">�ֽż�</li>
	<li id="7" onclick="boardlist(7)">�亯������</li>
	<li id="first" onclick="boardlist('first')">ù����</li>
	<li id="6" onclick="boardlist(6)">����������</li>
	</form>
		<script>
	var w = document.getElementById('<%=where%>');
			w.style.color='#40c700';
			w.style.fontWeight='bold';
	</script>
</ul>
<hr style="margin-bottom:0px;">
<table id="boardtable">
<%
	Vector<QuestionBean> vlist = mgr.getQuestionList(start,cnt,dir,where);
	for(int i=0;i<vlist.size();i++){
		QuestionBean bean = vlist.get(i);
	%>
	<tr id="questionBoard" onclick="boardRead('<%=bean.getQnum()%>')">
		<td style="font-weight:bold;font-size: 18px;"width="330px"><%=bean.getTitle() %> 
		<span style="color:#40c700;"> [ <%=bean.getPoint() %> ]</span></td>
		<td width="50px" style="color:#888;">�亯<%=bean.getAnswer_count() %></td>
		<td width="110px" style="color:#888;"><%=bean.getDirectory() %></td>
		<td width="80px" style="text-align: right;color:#888;" id="test">
		<script>
			document.write(Cal('<%=bean.getDate()%>'));  //��¥����Լ�
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
	<input type="hidden" name="qnum">
	<input type="hidden" name="dir" value="<%=dir%>">
	<input type="hidden" name="where" value="<%=where%>">
</form>

<%@ include file="footer.jsp" %>
</html>