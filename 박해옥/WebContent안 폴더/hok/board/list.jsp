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
		
		totalRecord = mgr.getTotalCount(keyField,keyWord);
		
%>