<%@page import="hok.BoardBean"%>
<%@page import="hok.UtilMgr"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="hok.BoardMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		String nowPage = request.getParameter("nowPage");
		String numPerPage = request.getParameter("numPerPage");
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
		int num = UtilMgr.parseInt(request,"num");
		
		//조회수 증가
		mgr.upCount(num);
		//게시물 읽기
		BoardBean bean = mgr.getBoard(num);
		String name = bean.getName();
		String subject = bean.getSubject();
		String regdate = bean.getRegdate();
		String content=bean.getContent();
		String filename = bean.getFilename();
		int filesize = bean.getFilesize();
		String ip = bean.getIp();
		int count = bean.getCount();
		//읽어온 게시물 수정, 삭제 위해 세션에 저장
		session.setAttribute("bean",bean);
		
%>
<html>
<head>
<title>Naver Board</title>
<script type="text/javascript">
	function down(filename) {
		document.downFrm.filename.value=filename;
		document.downFrm.submit();
	}
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	function cInsert() {
		if(document.cFrm.comment.value==""){
			alert("댓글을 입력하세요.");
			document.cFrm.comment.focus();
			return;
		}
		document.cFrm.submit();
	}
	function cDel(cnum){
		document.cFrm.cnum.value=cnum;
		document.cFrm.flag.value="del";
		document.cFrm.submit();
	}
</script>
</head>
<body bgcolor="#ECF6CE" topmargin="50">
<%@ include file="top.jsp" %>
<table width="75%" align="center" bgcolor="#FFFF99" border="1">
<tr>
<td align="center" bgcolor="#FFFFCC">
	<table align="center" width="95%" cellpadding="3">
	<tr>
		<td bgcolor="#84F399" height="25" align="center"><b>글&nbsp;&nbsp;읽&nbsp;&nbsp;기</b></td>
	</tr>
	<tr>
		<td colspan="2">
			<table cellpadding="3" cellspacing="0" width="100%">
				<tr>
					<td align="center" bgcolor="#DDDDDD" width="10%"> 이름 </td>
					<td bgcolor="#FFFFE8"><%=name%></td>
					<td align="center" bgcolor="#DDDDDD" width="10%"> 등록날짜 </td>
					<td bgcolor="#FFFFE8"><%=regdate%></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#DDDDDD" > 제목</td>
					<td bgcolor="#FFFFE8" colspan="3"><%=subject%></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#DDDDDD">첨부파일</td>
					<td bgcolor="#FFFFE8" colspan="3">
							<%if(filename!=null && !filename.equals("")){%>
									<a href="javascript:down('<%=filename%>')"><%=filename%></a>
									<font color="blue">(<%=UtilMgr.intFormat(filesize)%>)bytes</font>
							<%}else{out.println("첨부된 파일이 없습니다.");} %>
					</td>
				</tr>
				<tr>
					<td colspan="4"><br/><pre><%=content%></pre><br/></td>
				</tr>
				<tr>
					<td colspan="4" align="right">
					<%=ip%>로 부터 글을 남기셨습니다./ 조회수 <%=count%>
					</td>
				</tr>
				
			</table>
			<tr><td width="100%"><hr/></td></tr>
			<tr><td align="center">
			[<a href="javascript:list()">리스트</a>l
			<a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>&numPerPage=<%=numPerPage%>">수정</a>l
			<a href="reply.jsp?nowPage=<%=nowPage%>&numPerPage=<%=numPerPage%>">답변</a>l
			<a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">삭제</a>]<br/>
			</td></tr>
		</td>
	</tr>
	</table>
	<form method="post" name="downFrm" action="download.jsp">
		<input type="hidden" name="filename">
	</form>	
	
	<form name="listFrm">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
		<%if(!(keyWord==null||keyWord.equals(""))){ %>
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="keyWord" value="<%=keyWord%>">		
		<%}%>
	</form>
</td>
</tr>
</table>
</body>
</html>