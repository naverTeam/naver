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
		
		/*카테고리 업데이트는 3가지가 있다. 수정, 추가 삭제
		*카테고리 테이블에 아이디로 카테고리넘버를 모두 가져와서
		*리퀘스트 값과 비교해서 수정 추가 삭제를 수행하도록 함 */
		//먼저 ID값을 넣어 테이블에 있는 카테고리 번호를 순서대로 가져온다
		Vector<Integer> vlist = new Vector<Integer>();
		vlist = cateMgr.getBlogCateNum(id);
		//최대값으로 구분해서 이내일 경우 삭제, 이외일 경우 추가
		int dbMaxCNum = cateMgr.getMaxCateNum(id);
		
%>

 
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
</head>
<body>
	배너 사진: <%=bannerImg %><br>
	프로필 사진: <%=profileImg %><br>
	인사말: <%=profileDesc %><br>
	카테고리: <br>
	
	<%	for(int i=0; i<cateName.length; i++){
				out.println(cateName[i]);
			}	
	%>
	
	
	
	<%	
	
			boolean changeFlag = false;
			boolean insertFlag = false;
			//카테고리 추가하는 반복문
			for(int i=0; i<category.length; i++){
		
				for(int j = 0; j < vlist.size(); j++){
					int dbCNum = vlist.get(j);
					int myCNum = Integer.parseInt(cateNum[i]);
					if(dbCNum==myCNum){
						//out.print("유저값: "+myCNum+", DB값: "+dbCNum+"일치합니다 수정메소드"+cateName[i]+"<br>");
						setMgr.changeCate(cateName[i], id, myCNum);
						changeFlag = true;
						break;
					}else{
						//out.print("유저값: "+myCNum+", DB값: "+dbCNum+"불일치합니다<br>");
						if(j==vlist.size()-1){
							if(dbMaxCNum < myCNum){
								//out.print("&nbsp;유저값: "+myCNum+"> DB최대값: "+dbMaxCNum+"추가합니다"+cateName[i]+"<br>");
								setMgr.insertCate(id, cateName[i], myCNum);
								insertFlag = true;
								break;
							}
						}
					}
				}
			}
			
			
			boolean deleteFlag = false;
			//카테고리 삭제하는 반복문
			if(delCateNum!=null){
				for(int i=0; i< delCateNum.length; i++){
					//out.print("삭제할값 : "+delCateNum[i]+"<br>");
					int delCNum = Integer.parseInt(delCateNum[i]);
					setMgr.deleteCate(id, delCNum);
					deleteFlag = true;
				}
			}
			
			out.println("수정여부"+changeFlag);
			out.println("추가여부"+insertFlag);
			out.println("삭제여부"+deleteFlag);
	%>
</body>
</html>