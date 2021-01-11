<%@page import="hok.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="hok.UtilMgr"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="hok.BoardMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int totalRecord = 0;//총게시물수
		int numPerPage = 10;//페이지당 레코드 개수(5,10,15)
		int pagePerBlock =15;//블럭당 페이지 개수
		int totalPage = 0;//총 페이지 개수
		int totalBlock = 0;//총 블럭 개수
		int nowPage = 1;//현재 페이지
		int nowBlock =1;//현재 블럭
		int proNum=1;
		//요청된 numPerPage 처리
		if(request.getParameter("numPerPage") != null){
			//Integer.parseInt(request.getParameter("numPerPage"));
			numPerPage = UtilMgr.parseInt(request," numPerPage");
		}
		
		//검색에 필요한 변수
		String keyField = "", keyWord="";
		if(request.getParameter("keyWord") !=null){
			keyField = request.getParameter("keyField");
			keyWord = request.getParameter("keyWord");
		}
		
		//검색 후에 다시 처음 리스트 요청
		if(request.getParameter("reload") != null &&
				request.getParameter("reload").equals("true")){
			keyField = "";  keyWord="";
		}
		
		totalRecord = mgr.getTotalCount(keyField,keyWord,proNum);
		//out.print(totalRecord);
		
		//sql문에 들어가는 start, cnt 선언
		int start =(nowPage*numPerPage)-numPerPage;
		int cnt = numPerPage;
		
		//전체페이지 개수
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//전체블럭 개수
		totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//현재블럭
		nowBlock=(int)Math.ceil((double)nowPage/pagePerBlock);
		
%>
<html>
<head>
<title>NaverMall BoardList</title>
</head>
<body bgcolor="#ECF6CE" topmargin="50">
<%@ include file="top.jsp" %>
<table width="75%" align="center" bgcolor="#FFFF99" border="1">
<tr>
<td align="center" bgcolor="#FFFFCC">
	<table width="95%" >
		<tr>
			<td>
			Total : <%=totalRecord %>Articles(<font color="red">
			<%=nowPage+"/"+totalPage %>Pages </font>)
			</td>
			<td align="right">
				<form name="npFrm" method="post">
					<select name="numPerPage" size="1"
					onchange="numPerFn(this.form.numPerPage.value)">
						<option value="5">5개 보기</option>
						<option value="10" selected>10개 보기</option>
						<option value="15">15개 보기</option>
						<option value="30">30개 보기</option>
					</select>
				</form>
				<script >document.npFrm.numPerPage.value=<%=numPerPage%>;</script>
			</td>
		</tr>
	</table>

	<table width="95%">
	<tr>
		<td >
		<%
			Vector<BoardBean> vlist =
			mgr.getBoardList(keyField, keyWord, start, cnt, proNum);
			//마지막 페이지에 10개 이하의 개수 리턴될수 있음으로 listSize변수가 필요 하다
			int listSize = vlist.size();
			if(vlist.isEmpty()){
				out.println("등록된 게시물이 없습니다.");
			}else{
		%>
			<table width="100%" cellspacing="0">
				<tr align="center" bgcolor="#84F399">
					<td width="10%">번호</td>
					<td width="55%">제목</td>
					<td width="10%">이름</td>
					<td width="15%">날짜</td>
					<td width="10%">조회수</td>
				</tr>
				<%
					for(int i=0; i<numPerPage ;i++){
						if(i==listSize) break;
						BoardBean bean = vlist.get(i);	
						}
				%>
			</table>	
			
		<%
			}//else
		%>
		</td>
	</tr>
	</table>
</table>
</body>
</html>