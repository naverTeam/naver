<%@page import="hok.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="hok.UtilMgr"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="hok.BoardMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
        int totalRecord = 0;//�ѰԽù���
		int numPerPage = 10;//�������� ���ڵ� ����(5,10,15)
		int pagePerBlock =15;//���� ������ ����
		int totalPage = 0;//�� ������ ����
		int totalBlock = 0;//�� �� ����
		int nowPage = 1;//���� ������
		int nowBlock =1;//���� ��
		int proNum=UtilMgr.parseInt(request,"proNum");
		//��û�� numPerPage ó��
		if(request.getParameter("numPerPage") != null){
			//Integer.parseInt(request.getParameter("numPerPage"));
			numPerPage = UtilMgr.parseInt(request,"numPerPage");
		}
		
		//�˻��� �ʿ��� ����
		String keyField = "", keyWord="";
		if(request.getParameter("keyWord") !=null){
			keyField = request.getParameter("keyField");
			keyWord = request.getParameter("keyWord");
		}
		
		//�˻� �Ŀ� �ٽ� ó�� ����Ʈ ��û
		if(request.getParameter("reload") != null &&
				request.getParameter("reload").equals("true")){
			keyField = "";  keyWord="";
		}
		
		totalRecord = mgr.getTotalCount(keyField, keyWord, proNum);
		out.print(totalRecord);
		 
		if(request.getParameter("nowPage")!=null){
			nowPage=UtilMgr.parseInt(request,"nowPage");
		}
		
		//sql���� ���� start, cnt ����
		int start =(nowPage*numPerPage)-numPerPage;
		int cnt = numPerPage;
		
		//��ü������ ����
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//��ü�� ����	
		totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//�����
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
			alert("�˻�� �Է��ϼ���.");
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
						<option value="5">5�� ����</option>
						<option value="10" selected>10�� ����</option>
						<option value="15">15�� ����</option>
						<option value="30">30�� ����</option>
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
			//������ �������� 10�� ������ ���� ���ϵɼ� �������� listSize������ �ʿ� �ϴ�
			int listSize = vlist.size();
			if(vlist.isEmpty()){
				out.println("��ϵ� �Խù��� �����ϴ�.");
			}else{
		%>
			<table width="100%" cellspacing="0">
				<tr align="center" bgcolor="#84F399">
					<td width="10%">��ȣ</td>
					<td width="55%">����</td>
					<td width="10%">�̸�</td>
					<td width="15%">��¥</td>
					<td width="10%">��ȸ��</td>
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
						//��� count
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
		<!-- ����¡ �� �� start -->
		<!-- ���� �� -->
		<%if(nowBlock > 1) {%>
			<a href="javascript:block('<%=nowBlock-1 %>')">prev...</a>
		<%} %>
		<!-- ����¡ -->
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
		<!-- ������ -->	
		<%if(totalBlock>nowBlock){ %>
				<a href="javascript:block('<%=nowBlock+1 %>')">...next</a>
		<%} %>	
		<!-- ����¡ �� �� end -->	
		</td>
		<td align="right" >
			<a href = "post.jsp?proNum=<%=proNum%>">[�۾���]</a>
			<a href="javascript:list()">[ó������]</a>
		</td>
	</tr>
	</table>
	
	<hr width="95%">
	<form name="searchFrm">
		<table width="95%" cellpadding="4" cellspacing="0">
			<tr>
				<td align="center" valign="bottom">
					<select name="keyField" size="1" >
	    				<option value="name"> �� ��</option>
	    				<option value="subject"> �� ��</option>
	    				<option value="content"> �� ��</option>
   					</select>
					<input size="16" name="keyWord">
					<input type="button" value="ã��" onclick="javascript:check()">
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