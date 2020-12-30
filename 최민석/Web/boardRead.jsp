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
<title>게시글</title>
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
	 let year = today.getFullYear(); // 현재년도
	 let month = today.getMonth() + 1;  // 현재월
	 let date = today.getDate();  // 현재날짜
	 let hours = today.getHours(); // 현재시
	 let minutes = today.getMinutes();  // 현재분
	 let seconds = today.getSeconds();  // 현재초
	 let ymd = boardDate.substring(0,boardDate.lastIndexOf(" "));//게시물 년월일
	 let h = boardDate.substring(10,13);//게시물 시
	 let m = boardDate.substring(14,16);//게시물 분
	 let s = boardDate.substring(17,19);//게시물 초
	 if(s.substring(0,1)==0)  //한자리수라면 앞의 0자르기
		 s=s.substring(1,2);
	 
	 var b = year+"-"+month+"-"+date;  //현재 년월일
	 if(b!=ymd){
	    return ymd;
	 }else if(hours-h>=2){
		return hours-h+"시간전";
	 }else if(hours-h==1){
		 return m-minutes<=0?"1시간전":minutes+60-m+"분전";
	 }else if(hours==h){
		 return minutes==m?seconds-s+"초전":minutes-m+"분전";
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
		조회수 <%=bean.getHits()%>
	</td>
	<td width="100px" style="padding-bottom: 50px;">
		답변 <%=bean.getAnswer_count()%>
	</td>
	<td width="500px" align="right" style="padding-bottom: 50px;">
		<script>
			document.write(Cal('<%=bean.getDate()%>'));  //날짜계산함수
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
	<a style="font-size: 25px;font-weight: bold;color:#444;">session id 님 답변해주세요.</a>
</td></tr>
<tr>
<td style="padding-top: 30px;"><textarea id="ta" cols="99" rows="20" name="content"></textarea></td>
</tr>
<tr>
<td align="right" style="padding-right: 80px;padding-bottom: 60px;">
<input type="hidden" name ="qnum" value="<%=qnum%>">
<input type="submit" value="답변하기" id="abtn"></td>
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
	</table>
</span>
<%@ include file="footer.jsp" %>
</body>
</html>
