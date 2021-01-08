<%@ page  contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>명예의 전당</title>
<link href="header.css" rel="stylesheet" type="text/css">
<style>
td{border: 1px solid green;}
</style>

</head>
<body>
<%@ include file="header.jsp" %> 
<div id="body">
<hr style="margin-top:0px;margin-bottom: 0px;">
</div>
<div style="background-color: #ccc;height: 1500px;">

<div style="background-color: white;height: 1500px;width: 1000px;margin: 0px auto;">

<table>
<tr><td style="background-image:url('img/back.jpg');
background-repeat: no-repeat;
background-size: 100% 100%;
color:white;"
 width="1000px" height="350px;"align="center"><p style="font-size: 50px;padding-top: -100px;">명예의 전당</p>
<p id="day" style="font-size: 30px;"></p>
<p id="timer" style="font-size: 30px;"></p></td></tr>

</table>



<script>
function time() {
	var t = new Date();
	var y = t.getFullYear();
	var m = t.getMonth();
	var d = t.getDate();
	var hours = t.getHours(); // 현재시
	var minutes = t.getMinutes();  // 현재분
	var seconds = t.getSeconds();  // 현재초
	var mseconds = t.getMilliseconds()
	document.getElementById("timer").innerHTML = 
		hours+":"+minutes+":"+seconds+" : "+mseconds;
	document.getElementById("day").innerHTML = 
		y+"."+(m+1)+"."+d
}
time();
setInterval(time,10);
</script>

</div><!-- main div -->
</div><!-- backdiv -->
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