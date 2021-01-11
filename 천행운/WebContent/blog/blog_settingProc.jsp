<%@page import="java.util.Vector"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="blog.SettingMgr"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cateMgr" class="blog.CateMgr"/>
<jsp:useBean id="setMgr" class="blog.BlogSettingMgr"/>
<jsp:useBean id="postMgr" class="blog.BlogPostMgr"/>

<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String) session.getAttribute("id");
		MultipartRequest multi = new MultipartRequest(
				request, SettingMgr.SAVEFOLDER+id+"/", SettingMgr.MAXSIZE, SettingMgr.ENCTYPE, 
				new DefaultFileRenamePolicy());
		
		String bannerImg = multi.getFilesystemName("bannerImg");
		String profileImg = multi.getFilesystemName("profileImg");
		String profileDesc = multi.getParameter("profileDesc");
		String category[] = multi.getParameterValues("category");
		String cateNum[] = multi.getParameterValues("hideCNum");
		String delCateNum[] = multi.getParameterValues("hideDelCNum");
		String cateName[] = multi.getParameterValues("category");
		
		/*ī�װ� ������Ʈ�� 3������ �ִ�. ����, �߰� ����
		*ī�װ� ���̺� ���̵�� ī�װ��ѹ��� ��� �����ͼ�
		*������Ʈ ���� ���ؼ� ���� �߰� ������ �����ϵ��� �� */
		//���� ID���� �־� ���̺� �ִ� ī�װ� ��ȣ�� ������� �����´�
		Vector<Integer> vlist = new Vector<Integer>();
		vlist = cateMgr.getBlogCateNum(id);
		//�ִ밪���� �����ؼ� �̳��� ��� ����, �̿��� ��� �߰�
		int dbMaxCNum = cateMgr.getMaxCateNum(id);
		
%>

 
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
</head>
<body>
	��� ����: <%=bannerImg %><br>
	������ ����: <%=profileImg %><br>
	�λ縻: <%=profileDesc %><br>
	ī�װ�: <br>
	
	<%	for(int i=0; i<cateName.length; i++){
				out.println(cateName[i]);
			}	
	%>
	
	
	
	<%	
	
			boolean changeFlag = false;
			boolean insertFlag = false;
			//ī�װ� �߰��ϴ� �ݺ���
			for(int i=0; i<category.length; i++){
		
				for(int j = 0; j < vlist.size(); j++){
					int dbCNum = vlist.get(j);
					int myCNum = Integer.parseInt(cateNum[i]);
					if(dbCNum==myCNum){
						//out.print("������: "+myCNum+", DB��: "+dbCNum+"��ġ�մϴ� �����޼ҵ�"+cateName[i]+"<br>");
						setMgr.changeCate(cateName[i], id, myCNum);
						changeFlag = true;
						break;
					}else{
						//out.print("������: "+myCNum+", DB��: "+dbCNum+"����ġ�մϴ�<br>");
						if(j==vlist.size()-1){
							if(dbMaxCNum < myCNum){
								//out.print("&nbsp;������: "+myCNum+"> DB�ִ밪: "+dbMaxCNum+"�߰��մϴ�"+cateName[i]+"<br>");
								setMgr.insertCate(id, cateName[i], myCNum);
								insertFlag = true;
								break;
							}
						}
					}
				}
			}
			
			
			boolean deleteFlag = false;
			//ī�װ� �����ϴ� �ݺ���
			if(delCateNum!=null){
				for(int i=0; i< delCateNum.length; i++){
					//out.print("�����Ұ� : "+delCateNum[i]+"<br>");
					int delCNum = Integer.parseInt(delCateNum[i]);
					setMgr.deleteCate(id, delCNum);
					deleteFlag = true;
				}
			}
			
			out.println("��������"+changeFlag);
			out.println("�߰�����"+insertFlag);
			out.println("��������"+deleteFlag);
	%>
</body>
</html>