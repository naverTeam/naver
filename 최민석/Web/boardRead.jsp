<%@page import="in.QuestionBean"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="in.QuestionMgr" />
<%
    int qnum = Integer.parseInt(request.getParameter("qnum"));
	QuestionBean bean = mgr.boardRead(qnum);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ�</title>
<link href="header.css" rel="stylesheet" type="text/css">
<style>
#body{
background-color: #eee;
padding-bottom: 30px;
height: 100%;
}
#board{
width: 900px;
height: 100%;
background-color: white;
margin:20px auto;
border: 1px solid #ddd;
}
#qTable{
width:800px;
height:90%;
padding-top:50px;
margin: 0px auto;
}
#answer{
width: 900px;
height: 100%;
background-color: white;
margin: 20px auto;
border: 1px solid #ddd;
}
#aTable{
width:800px;
height:90%;
padding-top:50px;
margin: 0px auto;
}
#ta{
background-color: aliceblue;
border: 2px solid #888;
}
#ta:focus{
border: 2px solid #40c700;
outline: none;
}
#abtn{
width: 100px;
height: 50px;
background-color: #40c700;
border: 0px;
color:white;
outline: none;
cursor: pointer;
font-size: 20px;
font-weight: bold;
border-radius: 10px;
}
</style>
<script>
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
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="body">
<hr style="margin-top:0px;margin-bottom: 20px;">
<div id="board">
<table id = "qTable">
	<tr><td colspan="4">
	<img  src="img/question.png" style="width: 40px;height: 40px;border-radius: 10px;">
	<a style="font-size: 25px;font-weight: bold;color:#444;"><%=bean.getTitle() %>
	<span style="color:#40c700;"> [ <%=bean.getPoint() %> ]</span></a>
	</td></tr>
	<tr><td colspan="4" style="padding-top: 50px;padding-bottom: 60px;"><pre>
	<%=bean.getContent() %>
	<pre></td></tr>
<tr>
	<td width="100px" style="padding-bottom: 50px;">
		<%=bean.getId() %>
	</td>
	<td width="100px" style="padding-bottom: 50px;">
		��ȸ�� <%=bean.getHits()%>
	</td>
	<td width="100px" style="padding-bottom: 50px;">
		�亯 <%=bean.getAnswer_count()%>
	</td>
	<td width="500px" align="right" style="padding-bottom: 50px;">
		<script>
			document.write(Cal('<%=bean.getDate()%>'));  //��¥����Լ�
		</script>
	</td>
</tr>
</table>
</div>
<div id="answer">
<form method="post" name="aFrm" action="answerProc.jsp">
<table id="aTable">
<tr><td>
<img  src="img/question.png" style="width: 40px;height: 40px;border-radius: 10px;">
	<a style="font-size: 25px;font-weight: bold;color:#444;">session id �� �亯���ּ���.</a>
</td></tr>
<tr>
<td style="padding-top: 30px;"><textarea id="ta" cols="99" rows="20" name="content"></textarea></td>
</tr>
<tr>
<td align="right" style="padding-right: 80px;padding-bottom: 60px;">
<input type="hidden" name ="qnum" value="<%=qnum%>">
<input type="submit" value="�亯�ϱ�" id="abtn"></td>
</tr>
</table>
</form>
</div>

</div>
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
<%@ include file="footer.jsp" %>
</body>
</html>
