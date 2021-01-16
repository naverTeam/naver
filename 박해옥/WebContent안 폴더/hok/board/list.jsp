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
		int proNum=UtilMgr.parseInt(request,"proNum");
		//요청된 numPerPage 처리
		if(request.getParameter("numPerPage") != null){
			//Integer.parseInt(request.getParameter("numPerPage"));
			numPerPage = UtilMgr.parseInt(request,"numPerPage");
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
		
		totalRecord = mgr.getTotalCount(keyField, keyWord, proNum);
		out.print(totalRecord);
		 
		if(request.getParameter("nowPage")!=null){
			nowPage=UtilMgr.parseInt(request,"nowPage");
		}
		
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
<script type="text/javascript">

	function check() {
		if(document.searchFrm.keyWord.value ==""){
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		
		document.searchFrm.submit();
	}
	
	function list() {
		document.listFrm.action="list.jsp";
		document.listFrm.submit();
		
	}
	
	function numPerFn(numPerPage) {
		document.readFrm.numPerPage.value=numPerPage;
		document.readFrm.submit();
		
	}
	
	function pageing(page){
		document.readFrm.nowPage.value=page;
		document.readFrm.submit();
	}

	function block(block) {
		document.readFrm.nowPage.value=<%=pagePerBlock%>*(block-1)+1;
		document.readFrm.submit();
	}
	
	function read(num) {
		document.readFrm.num.value=num;
		document.readFrm.action="read.jsp";
		document.readFrm.submit();
		
	}
</script>
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

	<table width="95%" >
	<tr>
		<td align="center" colspan="2" >
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
						int num = bean.getNum();
						String subject = bean.getSubject();
						String name = bean.getName();
						String regdate = bean.getRegdate();
						int depth = bean.getDepth();
						int count = bean.getCount();
						String filename = bean.getFilename();
						//댓글 count
					//int bcount=cmgr.getBCommentCount(num);
				%>	
				<tr align="center">
					<td><%=totalRecord-start-i %></td>
					<td align="left">
						<%for (int j=0; j<depth ;j++){out.println("&nbsp;&nbsp;");} %>
						<a href="javascript:read('<%=num%>')"><%=subject%></a>
						<%if(filename != null && !filename.equals("")) {%>
								<img src="img/icon_file.gif" align="middle">
						<%}//if%>
					<%-- 	<%if(bcount>0){ %>
						<font color ="read">(<%=bcount %>)</font>
						<%} %>  --%>
					</td>
					<td><%=name %></td>
					<td><%=regdate %></td>
					<td><%=count %></td>
				
				</tr>	
				<%}//for%>
			</table>	
		<%}//else%>
		</td>
	</tr>
	<tr>
		<td colspan="2"><br><br></td>
	</tr>
	<tr>
		<td >
		<!-- 페이징 및 블럭 start -->
		<!-- 이전 블럭 -->
		<%if(nowBlock > 1) {%>
			<a href="javascript:block('<%=nowBlock-1 %>')">prev...</a>
		<%} %>
		<!-- 페이징 -->
		<%
			int pageStart = (nowBlock-1)*pagePerBlock+1;
			int pageEnd = (pageStart + pagePerBlock)<totalPage?
							pageStart + pagePerBlock:totalPage+1;
			for(;pageStart<pageEnd;pageStart++){
		%>	
		<a href = "javascript:pageing('<%=pageStart%>')">
				<%if(nowPage==pageStart){ %><font color="blue">   <%} %>
					[<%=pageStart %>]
				<%if(nowPage==pageStart){ %> </font><%} %>
		</a>
			
			<% }//for%>
		<!-- 다음블럭 -->	
		<%if(totalBlock>nowBlock){ %>
				<a href="javascript:block('<%=nowBlock+1 %>')">...next</a>
		<%} %>	
		<!-- 페이징 및 블럭 end -->	
		</td>
		<td align="right" >
			<a href = "post.jsp?proNum=<%=proNum%>">[글쓰기]</a>
			<a href="javascript:list()">[처음으로]</a>
		</td>
	</tr>
	</table>
	
	<hr width="95%">
	<form name="searchFrm">
		<table width="95%" cellpadding="4" cellspacing="0">
			<tr>
				<td align="center" valign="bottom">
					<select name="keyField" size="1" >
	    				<option value="name"> 이 름</option>
	    				<option value="subject"> 제 목</option>
	    				<option value="content"> 내 용</option>
   					</select>
					<input size="16" name="keyWord">
					<input type="button" value="찾기" onclick="javascript:check()">
					<input type="hidden" name="nowPage" value="1">
					<input type="hidden" name="proNum" value="<%=proNum%>">
					
				</td>
			</tr>
		</table>
	</form>
	
	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true">
		<input type="hidden" name="nowPage" value="1">
		<input type="hidden" name="proNum" value="<%=proNum%>">
	</form>
	
	<form name="readFrm">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<input type="hidden" name="num" >
	</form>	
	
</table>
<%@ include file="bottom.jsp" %>
</body>
</html>