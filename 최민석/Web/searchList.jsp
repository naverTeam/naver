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
<title>검색 결과</title>
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
	 let year = today.getFullYear(); // 현재년도
	 let month = today.getMonth() + 1;  // 현재월
	 let date = today.getDate();  // 현재날짜
	 let hours = today.getHours(); // 현재시
	 let minutes = today.getMinutes();  // 현재분
	 let seconds = today.getSeconds();  // 현재초
	 
	 let y = boardDate.substring(0,4); //게시글 년도
	 let mon ="";                     //게시글 월
	 let d ="";                     //게시글 일
	 
	 if(boardDate.substring(5,6)==0){     //한자리 수라면 0 제거
		 mon = boardDate.substring(6,7);
	 }else{
		 mon = boardDate.substring(5,7);
	 }
	 
	 if(boardDate.substring(8,9)==0){     //한자리 수라면 0 제거
		 d = boardDate.substring(9,10);
	 }else{
		 d = boardDate.substring(8,10);
	 }

	 let h = boardDate.substring(10,13);//게시물 시
	 let m = boardDate.substring(14,16);//게시물 분
	 let s = boardDate.substring(17,19);//게시물 초
	 
	 if(s.substring(0,1)==0)  //한자리수라면 앞의 0자르기
		 s=s.substring(1,2);
	 
	 var nymd = year+"-"+month+"-"+date;  //현재 년월일
	 var bymd = y+"-"+mon+"-"+d;  //게시글 년월일
	 
	 if(nymd!=bymd){
	    return bymd;
	 }else if(hours-h>=2){
		return hours-h+"시간전";
	 }else if(hours-h==1){
		 return m-minutes<=0?"1시간전":minutes+60-m+"분전";
	 }else if(hours==h){
		 return minutes==m?seconds-s+"초전":minutes-m+"분전";
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
<th><%=searchKey%> 에 대한 검색결과 입니다.</th>
<tr><td height="200px;" >option</td></tr>
</table>


<table id ="titleTable"> 
<%Vector<QuestionBean> vlist = mgr.getSearchTitleList(searchKey);
for(int i=0;i<vlist.size();i++){
	QuestionBean bean = vlist.get(i);
%> 
<th align="left">제목 검색</th>
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

<tr><td width="80px" class="tdcss">조회수 : <%=bean.getHits() %></td>
 <td width="70px"class="tdcss"> &nbsp답변 : <%=bean.getAnswer_count() %></td>
 <td width="90px" class="tdcss">&nbsp&nbsp<script>document.write(Cal('<%=bean.getDate()%>'));</script></td>
<td height="20px;"  style="color:#aaa;">&nbsp&nbspQ&A > <%=bean.getDirectory()%></td>
 </tr>
<%} %>
</table>



<table id ="contentTable"> 
<th align="left">내용 검색</th>
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

<tr><td width="80px" class="tdcss">조회수 : <%=bean.getHits() %></td>
 <td width="70px"class="tdcss"> &nbsp답변 : <%=bean.getAnswer_count() %></td>
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
			<td>카페</td>
			<td>블로그</td>
			<td>메일</td>
			<td>쇼핑</td>
		</tr>
		<tr>
			<td>뉴스</td>
			<td>지도</td>
			<td>포스트</td>
			<td>증권</td>
		</tr>
		<tr>
			<td>웹툰</td>
			<td>영화</td>
			<td>사전</td>
			<td>부동산</td>
		</tr>
		<tr>
			<td>게임</td>
			<td>날씨</td>
			<td>책</td>
			<td>스포츠</td>
		</tr>
		<tr>
		<td colspan="4" align="center" style="border-top: 1px solid #888;" onclick="location.href='logout.jsp'">로그아웃</td>
		</tr>
	</table>
</span>
<%@ include file="footer.jsp" %>
</html>