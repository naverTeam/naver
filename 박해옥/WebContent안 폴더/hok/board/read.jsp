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
		
		//��ȸ�� ����
		mgr.upCount(num);
		//�Խù� �б�
		BoardBean bean = mgr.getBoard(num);
		String name = bean.getName();
		String subject = bean.getSubject();
		String regdate = bean.getRegdate();
		String content=bean.getContent();
		String filename = bean.getFilename();
		int filesize = bean.getFilesize();
		String ip = bean.getIp();
		int count = bean.getCount();
		//�о�� �Խù� ����, ���� ���� ���ǿ� ����
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
			alert("����� �Է��ϼ���.");
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
		<td bgcolor="#84F399" height="25" align="center"><b>��&nbsp;&nbsp;��&nbsp;&nbsp;��</b></td>
	</tr>
	<tr>
		<td colspan="2">
			<table cellpadding="3" cellspacing="0" width="100%">
				<tr>
					<td align="center" bgcolor="#DDDDDD" width="10%"> �̸� </td>
					<td bgcolor="#FFFFE8"><%=name%></td>
					<td align="center" bgcolor="#DDDDDD" width="10%"> ��ϳ�¥ </td>
					<td bgcolor="#FFFFE8"><%=regdate%></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#DDDDDD" > ����</td>
					<td bgcolor="#FFFFE8" colspan="3"><%=subject%></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#DDDDDD">÷������</td>
					<td bgcolor="#FFFFE8" colspan="3">
							<%if(filename!=null && !filename.equals("")){%>
									<a href="javascript:down('<%=filename%>')"><%=filename%></a>
									<font color="blue">(<%=UtilMgr.intFormat(filesize)%>)bytes</font>
							<%}else{out.println("÷�ε� ������ �����ϴ�.");} %>
					</td>
				</tr>
				<tr>
					<td colspan="4"><br/><pre><%=content%></pre><br/></td>
				</tr>
				<tr>
					<td colspan="4" align="right">
					<%=ip%>�� ���� ���� ����̽��ϴ�./ ��ȸ�� <%=count%>
					</td>
				</tr>
				
			</table>
			<tr><td width="100%"><hr/></td></tr>
			<tr><td align="center">
			[<a href="javascript:list()">����Ʈ</a>l
			<a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>&numPerPage=<%=numPerPage%>">����</a>l
			<a href="reply.jsp?nowPage=<%=nowPage%>&numPerPage=<%=numPerPage%>">�亯</a>l
			<a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">����</a>]<br/>
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