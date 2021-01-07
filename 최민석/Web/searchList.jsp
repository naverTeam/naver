<%@page import="java.util.Vector"%>
<%@page import="in.UtilMgr"%>
<%@page import="in.QuestionBean"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");
      String searchKey = request.getParameter("searchKey");
%>
<jsp:useBean id="mgr" class="in.QuestionMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�˻� ���</title>
<link href="header.css" rel="stylesheet" type="text/css">
<style>
#body{
 background-color: white;
 padding-bottom: 30px;
 height: 100%;
 }
 #optionTable{
 width:1300px;
 margin: 50px auto;
 }
 #titleTable{
 background-color:aliceblue;
 width:1000px;
 margin: 50px auto;
 border-spacing: 0px;
 }
  #contentTable{
 width:1000px;
 margin: 50px auto;
 border-spacing: 0px;
 }
 .tdcss{
 border-right: 2px solid #aaa;
 color:#aaa;
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
	 
	 let y = boardDate.substring(0,4); //�Խñ� �⵵
	 let mon ="";                     //�Խñ� ��
	 let d ="";                     //�Խñ� ��
	 
	 if(boardDate.substring(5,6)==0){     //���ڸ� ����� 0 ����
		 mon = boardDate.substring(6,7);
	 }else{
		 mon = boardDate.substring(5,7);
	 }
	 
	 if(boardDate.substring(8,9)==0){     //���ڸ� ����� 0 ����
		 d = boardDate.substring(9,10);
	 }else{
		 d = boardDate.substring(8,10);
	 }

	 let h = boardDate.substring(10,13);//�Խù� ��
	 let m = boardDate.substring(14,16);//�Խù� ��
	 let s = boardDate.substring(17,19);//�Խù� ��
	 
	 if(s.substring(0,1)==0)  //���ڸ������ ���� 0�ڸ���
		 s=s.substring(1,2);
	 
	 var nymd = year+"-"+month+"-"+date;  //���� �����
	 var bymd = y+"-"+mon+"-"+d;  //�Խñ� �����
	 
	 if(nymd!=bymd){
	    return bymd;
	 }else if(hours-h>=2){
		return hours-h+"�ð���";
	 }else if(hours-h==1){
		 return m-minutes<=0?"1�ð���":minutes+60-m+"����";
	 }else if(hours==h){
		 return minutes==m?seconds-s+"����":minutes-m+"����";
	 }
}
function textReplace(text,key) {
	var key2 = new RegExp(key,"g");
	var retext = text.replace(key2,'<b>'+key+'</b>');
	return retext;
}
function contentSubstring(content) {
	var e = content;
	alert(e);
	if(e.length>250){
		return e.substring(0,250);
	}else{
		return e;
	}
		
}
</script>
</head> 
<%@ include file="header.jsp" %> 
<body>
<div id="body">
<hr style="margin-top:0px;margin-bottom: 20px;">

<table id="optionTable">
<th><%=searchKey%> �� ���� �˻���� �Դϴ�.</th>
<tr><td height="200px;" >option</td></tr>
</table>


<table id ="titleTable"> 
<%Vector<QuestionBean> vlist = mgr.getSearchTitleList(searchKey);
for(int i=0;i<vlist.size();i++){
	QuestionBean bean = vlist.get(i);
%> 
<th align="left">���� �˻�</th>
<tr>
<%if(bean.getFilename()!=null&&!bean.getFilename().equals("")){ %>
<td rowspan="3" width="100px"><img src="fileupload/<%=bean.getFilename()%>" width="100px" height="100px"></td>
<%} %>
<td height="20px;" colspan="4"><a href="boardRead.jsp?qnum=<%=bean.getQnum()%>">
<script>
document.write(textReplace('<%=bean.getTitle()%>','<%=searchKey%>'));
</script></a>
<%if(bean.getPoint()!=0){ %>
		<span style="color:#40c700;font-weight: bold;"> [<%=bean.getPoint() %>]</span>
		<%} %>
		<%if(bean.getFilename()!=null){ %>
		<img  src="img/down.png" style="width: 20px;height: 20px;">
		<%} %> </td></tr>
<tr><td height="50px;" style="word-break:break-all" colspan="4">
<script>
var cont = `<%=bean.getContent()%>`;
document.write(contentSubstring(cont)+'...');
</script>
</td></tr>

<tr><td width="80px" class="tdcss">��ȸ�� : <%=bean.getHits() %></td>
 <td width="70px"class="tdcss"> &nbsp�亯 : <%=bean.getAnswer_count() %></td>
 <td width="90px" class="tdcss">&nbsp&nbsp<script>document.write(Cal('<%=bean.getDate()%>'));</script></td>
<td height="20px;"  style="color:#aaa;">&nbsp&nbspQ&A > <%=bean.getDirectory()%></td>
 </tr>
<%} %>
</table>



<table id ="contentTable"> 
<th align="left">���� �˻�</th>
<%Vector<QuestionBean> vlist2 = mgr.getSearchContentList(searchKey);
for(int i=0;i<vlist2.size();i++){
	QuestionBean bean = vlist2.get(i);
%> 
<tr>
<%if(bean.getFilename()!=null&&!bean.getFilename().equals("")){ %>
<td rowspan="3" width="100px" ><img src="fileupload/<%=bean.getFilename()%>" width="100px" height="100px"></td>
<%}else{ %>
<td rowspan="3" width="100px"></td>

<%} %>
<td height="30px;" colspan="4">
<a href="boardRead.jsp?qnum=<%=bean.getQnum()%>"><%=bean.getTitle()%></a>
<%if(bean.getPoint()!=0){ %>
<span style="color:#40c700;font-weight: bold;" > [<%=bean.getPoint() %>]</span>
<%} %> 
<%if(bean.getFilename()!=null&&!bean.getFilename().equals("")){ %>
<img  src="img/down.png" style="width: 20px;height: 20px;">
<%} %> 
</td></tr>
<tr><td height="50px;" style="word-break:break-all" colspan="4">
<script>
var con = `<%=bean.getContent() %>`;
document.write(textReplace(con,'<%=searchKey%>'));
</script></td></tr>

<tr><td width="80px" class="tdcss">��ȸ�� : <%=bean.getHits() %></td>
 <td width="70px"class="tdcss"> &nbsp�亯 : <%=bean.getAnswer_count() %></td>
 <td width="120px" class="tdcss">&nbsp&nbsp<script>document.write(Cal('<%=bean.getDate()%>'));</script></td>
<td height="30px;"  style="color:#aaa;">&nbsp&nbspQ&A > <%=bean.getDirectory()%></td>
 </tr>
 <tr><td height="30px"></td></tr>
 <%} %>
</table>



</div><!-- body div -->
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
		<tr>
		<td colspan="4" align="center" style="border-top: 1px solid #888;" onclick="location.href='logout.jsp'">�α׾ƿ�</td>
		</tr>
	</table>
</span>
<%@ include file="footer.jsp" %>
</html>