<%@ page  contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<%String id ="test"; %>
<!--메인 배너-->
<script>
function dismenu() {
	var e = document.getElementById("menutable");
	if(e.style.display=='none'){
		e.style.display='block';
	}else{
		e.style.display='none';
	}
}
</script>
<form>
<div id="mainbanner">

<span id="mainbanner_icon">
<input type="button" class="naver" onclick="location.href='../chu/index.jsp' ">
<input type="button" class="in" onclick="location.href='naverin_main.jsp' ">
<input type="text" class="text" style="margin-top: 30px">
<input type="submit" class="search" value="">
</span>


<span id="loginset">
<%if(id==null){ %>
<button type="button" class="login" onclick="location.href='../joon/login.jsp' ">로그인</button>
<%} else{%>
<a id="loginon">idtest님</a>
<button type="button" id="call"/>
<%} %>
<button type="button" class="menubar" onclick="dismenu()">
</span>
</div>
</form>
<hr style="margin-top: 20px;margin-bottom:0px;">
<!--메뉴바 -->
<div>
<table class="submenubar">
	<tr>
		<td class="td" align="center" width="20px">홈</td>
		<td class="td" align="center" width="40px">Q&A</td>
		<td class="td" align="center" width="70px">답변하기</td>
		<td class="td" align="center" width="50px">베스트</td>
		<td class="td" align="center" width="90px">명예의 전당</td>
		<td style="border-left: 1px solid #cccccc;"></td>
		<td class="td" align="center" width="50px">프로필</td>
		<td width="500px"></td>
		<td id="tdbtn" align="right" width="100px" style="padding-right:30px;
		background-color:#40c700;color:white;cursor:pointer;"
		onclick="location.href='naver_question.jsp'">
		<button id="write"></button>질문하기</td>
	</tr>
</table>
</div>

