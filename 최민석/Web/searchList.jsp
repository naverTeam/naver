<%@page import="java.util.Vector"%>
<%@page import="in.UtilMgr"%>
<%@page import="in.QuestionBean"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="in.QuestionMgr" />
<%request.setCharacterEncoding("EUC-KR");
      String searchKey = request.getParameter("searchKey");
      
      int totalTitleCount = 0;//�ѰԽù���
      int totalContentCount= 0;//�ѰԽù���
       
  	int numPerPage = 5;//�������� ���ڵ� ����
  	int pagePerBlock = 10;//���� ������ ����
  	
  	int totalPage = 0;//�� ������ ���� 
  	int totalPage2 = 0;//�� ������ ���� 
  	
  	int totalBlock =0;//�� �� ����
  	int totalBlock2 =0;//�� �� ����
  	
  	int nowPage11 = 1;//���� ������ 
  	int nowPage22 = 1;//���� ������ 
  	
  	int nowBlock = 1;//���� ��
  	int nowBlock2 = 1;//���� ��
  	
  	//����Ʈ �������ǰ�
	int where=9;
	if(request.getParameter("where")!=null){
		where = Integer.parseInt(request.getParameter("where"));
	}
  	//��ü �Խù� ���� 
	totalTitleCount = mgr.getTitleCount(searchKey);
	totalContentCount = mgr.getContentCount(searchKey);
	
	//��û�� ������ �ޱ�
	if(request.getParameter("nowPage11")!=null){
		nowPage11 = UtilMgr.parseInt(request, "nowPage11");
	}
	if(request.getParameter("nowPage22")!=null){
		nowPage22 = UtilMgr.parseInt(request, "nowPage22");
	}
	
	//sql���� �� limit�� ���� 
	int start =  (nowPage11*numPerPage)-numPerPage;
	int cnt = numPerPage;
	int start2 =  (nowPage22*numPerPage)-numPerPage;
	int cnt2 = numPerPage;
	
	
	//��ü������ ����
	totalPage = (int)Math.ceil((double)totalTitleCount/numPerPage);
	//��ü�� ����
	 totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
	//�����
	nowBlock = (int)Math.ceil((double)nowPage11/pagePerBlock);
	//��ü������ ����2
	totalPage2 = (int)Math.ceil((double)totalContentCount/numPerPage);
	//��ü�� ����2
	 totalBlock2 = (int)Math.ceil((double)totalPage2/pagePerBlock);
	//�����2
	nowBlock2 = (int)Math.ceil((double)nowPage22/pagePerBlock);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�˻� ���</title>
<link href="header.css" rel="stylesheet" type="text/css">
<style>
.tagA{
background: rgb(119,188,215,0.3);
}
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
#body{
 background-color: white;
 padding-bottom: 30px;
 height: 100%;
 }
 #optionTable{
 width:1000px;
 margin: 50px auto;
 }
 #titleTable{
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
 li{
 float: left;
 margin-left: 30px;
 font-size: 18px;
 color:#aaaaaa;
 cursor: pointer;
 font-weight:900;
 }
li:hover{
 color:#40c700;
 font-weight: 900;
 }
</style> 
<script>
function boardlist(where) {
	document.readFrm15.where.value = where;
	document.readFrm15.submit();
}
function pageing(page) {
	document.readFrm15.nowPage11.value=page;
	document.readFrm15.searchKey.value="<%=searchKey%>";
	document.readFrm15.submit();
}
function block(block) {
	document.readFrm15.nowPage11.value=<%=pagePerBlock%>*(block-1)+1;
	document.readFrm15.searchKey.value="<%=searchKey%>";
	document.readFrm15.submit();
}

function pageing2(page) {
	document.readFrm15.nowPage22.value=page;
	document.readFrm15.searchKey.value="<%=searchKey%>";
	document.readFrm15.submit();
}
function block2(block) {
	document.readFrm15.nowPage22.value=<%=pagePerBlock%>*(block-1)+1;
	document.readFrm15.searchKey.value="<%=searchKey%>";
	document.readFrm15.submit();
}

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
//�ؽ�Ʈ���� key���� <b> ó��
function textReplace(text,key) {  
	var key2 = new RegExp(key,"g");
	var retext = text.replace(key2,'<b>'+key+'</b>');
	return retext;
}
//content���� �˻��� ���� 180���� �ڸ���
function contentSubstring(content,key) {
	
	var e = content.indexOf(key);
	
		return content.substring(e,180);
		
}
</script>
</head> 
<%@ include file="header.jsp" %> 
<body>
<div id="body">
<hr style="margin-top:0px;margin-bottom: 20px;">


<table id="optionTable">
<tr><td style="padding-bottom: 5px;"><b><font color="#40c700"><%=searchKey%></font> �� ���� �˻���� �Դϴ�</b></td></tr>
<tr><td  style="border-top: 2px solid #aaa;padding-top: 5px;">
<form name = "whereFrm" method="post">
	<li id="9"  style="margin-left: 10px" onclick="boardlist(9)">�ֽż�</li>
	<li id="7" onclick="boardlist(7)">�亯������</li>
	<li id="6" onclick="boardlist(6)">����������</li>
	</form>
	<script>
	var w = document.getElementById('<%=where%>');
			w.style.color='#40c700';
			w.style.fontWeight='bold';
	</script>
	</td></tr>
</table>
 
<%Vector<QuestionBean> vlist = mgr.getSearchTitleList(searchKey,start,cnt,where);%>
<table id ="titleTable"> 
<tr><td colspan="5" height="50px"  style="padding-left: 10px;"><b>���� �˻� (��  <%=mgr.getTitleCount(searchKey) %>��)</b></td></tr>
<%if(mgr.getTitleCount(searchKey)==0){ %>
 <tr><td>�˻������� �����ϴ�.</td></tr>
	<%}else{%>
<%
for(int i=0;i<vlist.size();i++){
	QuestionBean bean = vlist.get(i);
%> 
<tr>
<%if(bean.getFilename()!=null&&!bean.getFilename().equals("")){ %>
<td rowspan="4" width="100px"><img src="fileupload/<%=bean.getFilename()%>" width="100px" height="100px"></td>
<%}else{ %>
<td rowspan="4" width="100px"><img src="img/noimg.jpg" width="100px" height="100px"></td>

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

<tr><td colspan="4" height="20px;">
<%if(bean.getTag()!=null){
	String[] tagArray = bean.getTag().split("#");
	for(int j=1;j<tagArray.length;j++){  /*0���迭�� �����̹Ƿ� 1������ ����(split Ư��)*/%>
	        <a class="tagA"><%="#"+tagArray[j]%></a>&nbsp;&nbsp;&nbsp;
	<%} }%>
</td></tr>

<tr><td width="80px" class="tdcss">��ȸ�� : <%=bean.getHits() %></td>
 <td width="70px"class="tdcss"> &nbsp�亯 : <%=bean.getAnswer_count() %></td>
 <td width="120px" class="tdcss">&nbsp&nbsp<script>document.write(Cal('<%=bean.getDate()%>'));</script></td>
<td height="20px;"  style="color:#aaa;">&nbsp&nbspQ&A > <%=bean.getDirectory()%></td>
 </tr>
  <tr><td height="30px"></td></tr>
<%} %>

<tr>
<td colspan="5" align="center">
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
			<%if(nowPage11==pageStart){%><font color="blue"><%}%>
				<%=pageStart%>
			<%if(nowPage11==pageStart){%></font><%}%>
		</a>
		
		<%}//--for%>
		<!-- ������ -->
			<%if(totalBlock>nowBlock){%>
			
			<a id="page" href="javascript:block('<%=nowBlock+1%>')">���� ></a>
			<%} %>
		<!-- ����¡ �� �� End -->
			</td>
</tr>

<%} %>
</table>


<hr width="70%" style="height: 3px;">

<table id ="contentTable"> 
<%Vector<QuestionBean> vlist2 = mgr.getSearchContentList(searchKey,start2,cnt2,where);%>
<tr><td colspan="5" height="50px" style="padding-left: 10px;"><b>���� �˻� (��  <%=mgr.getContentCount(searchKey) %>��)</b></td></tr>
<%if(mgr.getContentCount(searchKey)==0){ %>
<tr><td>�˻������� �����ϴ�.</td></tr>
<%}else{ %>
<%for(int i=0;i<vlist2.size();i++){
	QuestionBean bean = vlist2.get(i);
%> 
<tr>
<%if(bean.getFilename()!=null&&!bean.getFilename().equals("")){ %>
<td rowspan="4" width="100px" ><img src="fileupload/<%=bean.getFilename()%>" width="100px" height="100px"></td>
<%}else{ %>
<td rowspan="4" width="100px"><img src="img/noimg.jpg" width="100px" height="100px"></td>

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
//���� ���뿡�� �˻��� ���� �����ϵ��� �ڸ��� �˻����� bold ó��
document.write("..."+textReplace(contentSubstring(con,'<%=searchKey%>'),'<%=searchKey%>')+"...");   
</script></td></tr>

<tr><td colspan="4" height="20px;">
<%if(bean.getTag()!=null){
	String[] tagArray = bean.getTag().split("#");
	for(int j=1;j<tagArray.length;j++){  /*0���迭�� �����̹Ƿ� 1������ ����(split Ư��)*/%>
	        <a class="tagA"><%="#"+tagArray[j]%></a>&nbsp;&nbsp;&nbsp;
	<%} }%>
</td></tr>

<tr><td width="80px" class="tdcss">��ȸ�� : <%=bean.getHits() %></td>
 <td width="70px"class="tdcss"> &nbsp�亯 : <%=bean.getAnswer_count() %></td>
 <td width="120px" class="tdcss">&nbsp&nbsp<script>document.write(Cal('<%=bean.getDate()%>'));</script></td>
<td height="20px;"  style="color:#aaa;">&nbsp&nbspQ&A > <%=bean.getDirectory()%></td>
 </tr>
 <tr><td height="30px"></td></tr>
 <%} %>
 <tr>
<td colspan="5" align="center">
<!-- ����¡ �� �� Start -->
		<!-- ������ -->
		<%if(nowBlock2>1){%>
		<a id="page" href="javascript:block2('<%=nowBlock2-1 %>')"><%="< "%>����</a>
			<%} %>
			<!-- ����¡ -->
		<%
	         	 int pageStart2 = (nowBlock2-1)*pagePerBlock+1;
				int pageEnd2 = (pageStart2+pagePerBlock/*5*/)<totalPage2?
						pageStart2+pagePerBlock:totalPage2+1; 
				for(;pageStart2<pageEnd2;pageStart2++){
		%>
		
		<a id="page" href="javascript:pageing2('<%=pageStart2%>')">
			<%if(nowPage22==pageStart2){%><font color="blue"><%}%>
				<%=pageStart2%>
			<%if(nowPage22==pageStart2){%></font><%}%>
		</a>
		
		<%}//--for%>
		<!-- ������ -->
			<%if(totalBlock>nowBlock2){%>
			
			<a id="page" href="javascript:block2('<%=nowBlock2+1 %>')">���� ></a>
			<%} %>
		<!-- ����¡ �� �� End -->
			</td>
</tr>
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


<form name="readFrm15">
	<input type="hidden" name="nowPage11" value="<%=nowPage11%>">
	<input type="hidden" name="nowPage22" value="<%=nowPage22%>">
	<input type="hidden" name="where" value="<%=where%>"> 
	<input type="hidden" name="searchKey" value="<%=searchKey%>">
</form>





<%@ include file="footer.jsp" %>
</html>