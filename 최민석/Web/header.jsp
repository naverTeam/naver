<%@ page  contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");

String id2 = (String)session.getAttribute("id");
		%>
<!--���� ���-->
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
<form method="post" action="searchList.jsp">
<div id="mainbanner">

<span id="mainbanner_icon">
<input type="button" class="naver" onclick="location.href='../chu/index.jsp' ">
<input type="button" class="in" onclick="location.href='naverin_main.jsp' ">
<input type="text" class="text" style="margin-top: 30px" name="searchKey">
<input type="submit" class="search"  value="">

</span>


<span id="loginset">
<%if(id2==null){ %>
<button type="button" class="login" onclick="location.href='../member/login.jsp?returnPage=../in/naverin_main.jsp' ">�α���</button>
<%} else{%> 
<span id="loginon"><font color="#40c700"><%=id2%></font> �� �ݰ����ϴ�.</span>
<button type="button" id="call"></button>
<%} %>
<button type="button" class="menubar" onclick="dismenu()"></button>
</span>
</div>
</form>
<hr style="margin-top: 20px;margin-bottom:0px;">
<!--�޴��� -->
<div>
<table class="submenubar">
	<tr>
		<td class="td" align="center" width="20px" onclick="location.href='naverin_main.jsp'">Ȩ</td>
		<td class="td" align="center" width="40px">Q&A</td>
		<td class="td" align="center" width="70px">�亯�ϱ�</td>
		<td class="td" align="center" width="50px">����Ʈ</td>
		<td class="td" align="center" width="90px" onclick="location.href='bestMember.jsp'">���� ����</td>
		<td style="border-left: 1px solid #cccccc;"></td>
		<td class="td" align="center" width="50px">������</td>
		<td width="500px"></td>
		<td id="tdbtn" align="right" width="100px" style="padding-right:30px;
		background-color:#40c700;color:white;cursor:pointer;"
		onclick="location.href='naver_question.jsp'">
		<button id="write"></button>�����ϱ�</td>
	</tr>
</table>
</div>

