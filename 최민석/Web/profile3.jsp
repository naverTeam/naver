<%@page import="in.AnswerBean"%>
<%@page import="in.UtilMgr"%>
<%@page import="java.util.Vector"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="in.QuestionMgr" />
<jsp:useBean id="bean" class="in.AnswerBean" />
<%
		request.setCharacterEncoding("EUC-KR");
if(session.getAttribute("id")==null){
	response.sendRedirect("../member/login.jsp?returnPage=../in/naver_question.jsp");
}else{
	String id =(String)session.getAttribute("id");
	
	 int totalRecord = 0;//�ѰԽù���
		int numPerPage = 5;//�������� ���ڵ� ����(5,10,15,30)
		int pagePerBlock = 5;//���� ������ ����
		int totalPage = 0;//�� ������ ���� 
		int totalBlock =0;//�� �� ����
		int nowPage2 = 1;//���� ������ 
		int nowBlock = 1;//���� ��
		
		double choiceCnt=mgr.getIdChoiceCount(id); 
		totalRecord = mgr.getId2Count(id);
		
		if(request.getParameter("nowPage2")!=null){
			nowPage2 = UtilMgr.parseInt(request, "nowPage2");
		}
		//sql���� ���� start,cnt���� 
		int start =  (nowPage2*numPerPage)-numPerPage;
		int cnt = numPerPage;
		
		//��ü������ ����
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//��ü�� ����
		 totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//�����
		nowBlock = (int)Math.ceil((double)nowPage2/pagePerBlock);
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
function block(block) {
	document.readFrm2.nowPage2.value=<%=pagePerBlock%>*(block-1)+1;
	document.readFrm2.submit();
}
function pageing(page) {
	document.readFrm2.nowPage2.value=page;
	document.readFrm2.submit();
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
<h1 align="center"><%=id%> ���� ������</h1>
<hr style="width: 70%;height: 5px;margin-right: 150px;">

<table style="margin-left: 190px;border-spacing: 0px;margin-bottom: 0px;margin-top: 30px;">
<tr align="center">
<td class="mtd" onclick="location.href='profile2.jsp'">���� ����</td>
<td  class="mtd" onclick="location.href='profile.jsp'">���� ����</td>
<td class="mtd" id="mtd3" >���� �亯</td></tr>
</table>

<div style="height: 650px;margin-left: 150px;margin-top: 30px;">

<h1>���� �亯 ��(<%=totalRecord %>)��</h1>
<%int c = (int)(choiceCnt/totalRecord *100);%>
<h3>ä�÷� :  <font color="#40c700"><%=c %>%</font></h3>

<table style="border-spacing: 0px;">
<tr style="border-bottom: 2px solid #40c700;">
<td width="60px;" style="border-bottom: 2px solid #40c700;
padding-bottom: 20px;"align="center">��ȣ</td>
<td width="400px;" style="border-bottom: 2px solid #40c700;padding-bottom: 20px;padding-left: 10px;">�亯 ����</td>
<td width="100px;" style="border-bottom: 2px solid #40c700;padding-bottom: 20px;"align="center">ä�� ����</td>
<td width="130px;" style="border-bottom: 2px solid #40c700;padding-bottom: 20px;"align="center">�ۼ� ��¥</td>
</tr>
	<% Vector<AnswerBean> vlist = mgr.getMyList2(start,cnt,id);
           for(int i =0;i<vlist.size();i++){ 
           bean = vlist.get(i);%>
<tr class="trc" onclick="location.href='boardRead.jsp?qnum=<%=bean.getQnum()%>'">
<td height="60px;"align="center" style="border-bottom: 2px solid #ccc;"><%=totalRecord-start-i%></td>
<td style="border-bottom: 2px solid #ccc;font-weight: bold;"><%=bean.getContent() %></td>
<td style="border-bottom: 2px solid #ccc;"align="center">
<% if(bean.getChoice()==0){%>
<font color="red" style="font-weight: bold">X</font>
<%}else{ %>
<img  id="img" src="img/choice.jpeg" style="width: 20px;height: 20px;">
<%} %>

</td>
<td style="border-bottom: 2px solid #ccc;">
<%=bean.getDate().substring(0,bean.getDate().length()-5)%></td>
</tr>
<%} %> 	
<tr>
<td colspan="4" align="center" height="60px">
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
			<%if(nowPage2==pageStart){%><font color="blue"><%}%>
				<%=pageStart%>
			<%if(nowPage2==pageStart){%></font><%}%>
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

<form name="readFrm2">
	<input type="hidden" name="nowPage2" value="<%=nowPage2%>">
</form>

<%@ include file="footer.jsp" %>
</body>
<%}%>