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
		int proNum=1;
		//��û�� numPerPage ó��
		if(request.getParameter("numPerPage") != null){
			//Integer.parseInt(request.getParameter("numPerPage"));
			numPerPage = UtilMgr.parseInt(request," numPerPage");
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
		
		totalRecord = mgr.getTotalCount(keyField,keyWord,proNum);
		//out.print(totalRecord);
		
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

	<table width="95%">
	<tr>
		<td >
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