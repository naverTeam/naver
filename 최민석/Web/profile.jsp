<%@page import="in.UtilMgr"%>
<%@page import="in.QuestionBean"%>
<%@page import="java.util.Vector"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="in.QuestionMgr" />
<jsp:useBean id="bean" class="in.QuestionBean" />
<%
	if(session.getAttribute("id")==null){
		response.sendRedirect("../member/login.jsp?returnPage=../in/naver_question.jsp");
	}else{
		String id =(String)session.getAttribute("id");
		
		 int totalRecord = 0;//�ѰԽù���
			int numPerPage = 5;//�������� ���ڵ� ����(5,10,15,30)
			int pagePerBlock = 5;//���� ������ ����
			int totalPage = 0;//�� ������ ���� 
			int totalBlock =0;//�� �� ����
			int nowPage = 1;//���� ������ 
			int nowBlock = 1;//���� ��
			
			totalRecord = mgr.getIdCount(id);
			
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
<title>�� ������</title>
<link href="header.css" rel="stylesheet" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Bad Script' rel='stylesheet' type='text/css'> 
<style>
 #page{
 width: 70px;
 height: 50px;
 padding:7px;
 border: 3px solid white;
 text-decoration: none;
 color:#888;
 }
#page:hover{
border: 3px solid #ccc;
color:blue;
cursor: pointer;
}
.def{
width: 25px;
height: 25px;
}
.trc{
cursor: pointer;
}
.trc:hover{
background: aliceblue;
}
.mtd{
background: white;
color:#888;
width: 200px;
height: 50px;
font-weight: bold;
font-size: 23px;
cursor: pointer;
border: 3px solid #40c700;

}
.mtd:hover{
background: #40c700;
color:white;
}
#mtd3{
background: #40c700;
color:white;
}
</style>
<script>
var dnum=0;
window.onload=function(){
	if(document.getElementsByClassName("def")!=null){
		setInterval(defgo,10);
	}
	
}
function defgo() {
	var defe=document.getElementsByClassName("def");
	dnum++;
	for(var i =0;i<defe.length;i++){
		defe[i].style.transform="rotate("+dnum+"deg)";
	}
}
function block(block) {
	document.readFrm.nowPage.value=<%=pagePerBlock%>*(block-1)+1;
	document.readFrm.submit();
}
function pageing(page) {
	document.readFrm.nowPage.value=page;
	document.readFrm.submit();
}
</script>
</head>
<body>
<%@ include file="header.jsp" %> 
<div id="body">
<hr style="margin-top:0px;margin-bottom: 0px;">
</div>

<div style="background: #ddd;height: 800px;">
<div style="width: 1000px;height: 800px;background: white;margin: 0px auto;">
<h1 align="center"><%=id %> ���� ������</h1>
<hr style="width: 70%;height: 5px;margin-right: 150px;">

<table style="margin-left: 190px;border-spacing: 0px;margin-bottom: 0px;margin-top: 30px;">
<tr align="center">
<td class="mtd"  onclick="location.href='profile2.jsp'">���� ����</td>
<td class="mtd" id="mtd3"  >���� ����</td>
<td class="mtd"  onclick="location.href='profile3.jsp'">���� �亯</td></tr>
</table>

<div style="height: 450px;margin-left: 110px;margin-top: 30px;">


<h1>���� ���� ��(<%=totalRecord %>)��</h1>
<%double u = mgr.getIdUnChoiceQ(id); %>
<%int uc= (int)(u/totalRecord*100); %>
<h3>ä�÷� : <font color="#40c700"><%=uc %>%</font></h3>
<h3></h3>
<table style="border-spacing: 0px;">
<tr style="border-bottom: 2px solid #40c700;">
<td width="50px;" style="border-bottom: 2px solid #40c700;
padding-bottom: 20px;"align="center">��ȣ</td>
<td width="400px;" style="border-bottom: 2px solid #40c700;padding-bottom: 20px;padding-left: 20px;">����</td>
<td width="80px;" style="border-bottom: 2px solid #40c700;padding-bottom: 20px;"align="center">�亯 Ƚ��</td>
<td width="80px;" style="border-bottom: 2px solid #40c700;padding-bottom: 20px;"align="center">ä�� ����</td>
<td width="130px;" style="border-bottom: 2px solid #40c700;padding-bottom: 20px;"align="center">�ۼ� ��¥</td>
</tr>
	<% Vector<QuestionBean> vlist = mgr.getMyList(start,cnt,id);
           for(int i =0;i<vlist.size();i++){ 
           bean = vlist.get(i);%>
<tr class="trc" onclick="location.href='boardRead.jsp?qnum=<%=bean.getQnum()%>'">
<td height="60px;"align="center" style="border-bottom: 2px solid #ccc;"><%=totalRecord-start-i %></td>
<td style="border-bottom: 2px solid #ccc;font-weight: bold"><%=bean.getTitle() %> 
<font color="#40c700"> [<%=bean.getPoint() %>]</font></td>
<td style="border-bottom: 2px solid #ccc;"align="center"><%=bean.getAnswer_count() %>ȸ</td>
<td style="border-bottom: 2px solid #ccc;"align="center">
<%if(bean.getChoice()!=null){%>
<img  id="img" src="img/choice.jpeg" style="width: 20px;height: 20px;">
<%}else{ %>
<img class="def" src="img/def.png" style=" transform: rotate(30deg);">
<%} %>
</td>
<td style="border-bottom: 2px solid #ccc;">
<%=bean.getDate().substring(0,bean.getDate().length()-5)%></td>
</tr>
<%} %>
<tr>
<td colspan="5" align="center" height="60px">
<!-- ����¡ �� �� Start -->
		<!-- ������ -->
		<%if(nowBlock>1){%>
		<a id="page" href="javascript:block('<%=nowBlock-1%>')"><%="< "%>����</a>
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
			
			<a id="page" href="javascript:block('<%=nowBlock+1%>')">���� ></a>
			<%} %>
		<!-- ����¡ �� �� End -->
			</td>
</tr>
</table>

</div>








</div>

</div>

<form name="readFrm">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
</form>

<%@ include file="footer.jsp" %>
</body>
<%}%>