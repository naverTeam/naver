package in;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import in.UtilMgr;
import member.MemberBean;
import in.DBConnectionMgr;

public class QuestionMgr {

	private DBConnectionMgr pool;
	public static final String SAVEFOLDER = "C:/Jsp/naver/WebContent/naver/in/fileupload/";
	public static final String ENCTYPE = "EUC-KR";
	public static int MAXSIZE = 10*1024*1024;//10MB
	
	public QuestionMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Question Insert
		public void insertQuestion(HttpServletRequest req) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			
			try {
				
				/////파일업로드//////////////////////////
				File dir = new File(SAVEFOLDER);
				if(!dir.exists())//폴더가 없다면 
					dir.mkdirs();
				//mkdir : 상위폴더가 없으면 생성불가
				//mkdirs : 상위폴더가 없어도 생성가능
				MultipartRequest multi = 
						new MultipartRequest(req, SAVEFOLDER,MAXSIZE,ENCTYPE
								,new DefaultFileRenamePolicy());
				String filename1 = null;
				String filename2 = null;
				int filesize = 0;
				int filesize2 = 0;
				
				if(multi.getFilesystemName("filename1")!=null) {
					//게시물에 파일 업로드
					filename1 = multi.getFilesystemName("filename1");
					filesize = (int)multi.getFile("filename1").length();
				}
				if(multi.getFilesystemName("filename2")!=null) {
					//게시물에 파일 업로드
					filename2 = multi.getFilesystemName("filename2");
					filesize2 = (int)multi.getFile("filename2").length();
				}
				
				String content  = multi.getParameter("content");
				content = UtilMgr.replace(content, "<", "&lt;");
				int point =0;
				if(multi.getParameter("point")!=null&&!multi.getParameter("point").equals(""))
				 point = Integer.parseInt(multi.getParameter("point"));
				/////////////////////////////////////
				con = pool.getConnection();
				sql = "insert in_question(id,title,content,directory,";
				sql += "point,date,filename,filedata,filesize,filename2,filedata2,filesize2,tag)";
				sql += "values(?, ?, ?, ?, ?, now(),?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,multi.getParameter("id"));
				pstmt.setString(2, multi.getParameter("title"));/////
				pstmt.setString(3, content);
				pstmt.setString(4, multi.getParameter("directory"));
				pstmt.setInt(5, point);//////
				pstmt.setString(6, filename1);
				pstmt.setString(7, multi.getParameter("filedata"));
				pstmt.setInt(8, filesize);
				pstmt.setString(9, filename2);
				pstmt.setString(10, multi.getParameter("filedata2"));
				pstmt.setInt(11, filesize2);
				
				if(multi.getParameterValues("tag")!=null) {
				String tag[] = multi.getParameterValues("tag");
				String taglist="";
				for (int i = 0; i < tag.length; i++) {
				taglist += tag[i];
				}
				pstmt.setString(12, taglist);
				}else {
					pstmt.setString(12,"");
				}
				
				pstmt.executeUpdate();
			
				pstmt.close();
				
				//질문수 +1
				sql = "update navermember set questionCnt = questionCnt+1,inPoint = inPoint-? where id = ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, 10);
				pstmt.setString(2, multi.getParameter("id"));
				pstmt.executeUpdate();
				pstmt.close();
				
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		
		}
		
		//게시물 제목검색
		public Vector<QuestionBean> getSearchTitleList(String searchKey,int start,int end,int where){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<QuestionBean> vlist = new Vector<QuestionBean>();
			try {
				con = pool.getConnection();
				if(where==7) {
				sql = "SELECT * FROM in_question WHERE  title like ? order by ? limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchKey+"%");
				pstmt.setInt(2, where);
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
				rs = pstmt.executeQuery();
				}else if(where==6||where==9) {
					sql = "SELECT * FROM in_question WHERE  title like ? order by ? desc limit ?,?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+searchKey+"%");
					pstmt.setInt(2, where);
					pstmt.setInt(3, start);
					pstmt.setInt(4, end);
					rs = pstmt.executeQuery();
				}
				while(rs.next()) {
					QuestionBean bean = new QuestionBean();
					bean.setQnum(rs.getInt("qnum"));
					bean.setId(rs.getString("id"));
					bean.setTitle(rs.getString("title"));
					bean.setContent(rs.getString("content"));
					bean.setAnswer_count(rs.getInt("answer_count"));
					bean.setDirectory(rs.getString("directory"));
					bean.setDate(rs.getString("date"));
					bean.setPoint(rs.getInt("point"));
					bean.setFilename(rs.getString("filename"));
					bean.setTag(rs.getString("tag"));
					vlist.addElement(bean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
		
		public int getTitleCount(String searchKey) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int totalCount = 0;
			try {
				con = pool.getConnection();
					sql = "select count(*) from in_question where title like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+searchKey+"%");
				rs = pstmt.executeQuery();
				if(rs.next()) totalCount = rs.getInt(1);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return totalCount;
		}
		
		//게시물 내용검색
				public Vector<QuestionBean> getSearchContentList(String searchKey,int start,int end,int where){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					Vector<QuestionBean> vlist = new Vector<QuestionBean>();
					try {
						con = pool.getConnection();
						if(where==7) {
						sql = "SELECT * FROM in_question WHERE  content like ? order by ? limit ?,?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "%"+searchKey+"%");
						pstmt.setInt(2, where);
						pstmt.setInt(3, start);
						pstmt.setInt(4, end);
						rs = pstmt.executeQuery();
						}else if(where==6||where==9) {
							sql = "SELECT * FROM in_question WHERE  content like ? order by ? desc limit ?,?";
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1, "%"+searchKey+"%");
							pstmt.setInt(2, where);
							pstmt.setInt(3, start);
							pstmt.setInt(4, end);
							rs = pstmt.executeQuery();
						}
						while(rs.next()) {
							QuestionBean bean = new QuestionBean();
							bean.setQnum(rs.getInt("qnum"));
							bean.setId(rs.getString("id"));
							bean.setTitle(rs.getString("title"));
							bean.setContent(rs.getString("content"));
							bean.setAnswer_count(rs.getInt("answer_count"));
							bean.setDirectory(rs.getString("directory"));
							bean.setDate(rs.getString("date"));
							bean.setPoint(rs.getInt("point"));
							bean.setFilename(rs.getString("filename"));
							bean.setTag(rs.getString("tag"));
							vlist.addElement(bean);
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return vlist;
				}
				
				public int getContentCount(String searchKey) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
							sql = "select count(*) from in_question where content like ?";
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1, "%"+searchKey+"%");
						rs = pstmt.executeQuery();
						if(rs.next()) totalCount = rs.getInt(1);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return totalCount;
				}
		// 게시물 리스트 가져오기
	public Vector<QuestionBean> getQuestionList(int start,int end,String dir,int where){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<QuestionBean> vlist = new Vector<QuestionBean>();
		try {
			con = pool.getConnection();
			
			if(dir.equals("전체")&&where==7) {
				sql = "select * from in_question order by ?  limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,where);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}else if(dir.equals("전체")&&(where==6||where==9)) {
				sql = "select * from in_question order by ? desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,where);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}else if(!dir.equals("전체")&&where==7){
				sql = "select * from in_question where directory = ? order by ? limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,dir);
				pstmt.setInt(2, where);
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
			}else if(!dir.equals("전체")&&(where==6||where==9)){
				sql = "select * from in_question where directory = ? order by ? desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,dir);
				pstmt.setInt(2, where);
				pstmt.setInt(3, start);
				pstmt.setInt(4, end);
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				QuestionBean bean = new QuestionBean();
				bean.setQnum(rs.getInt("qnum"));
				bean.setId(rs.getString("id"));
				bean.setTitle(rs.getString("title"));
				bean.setAnswer_count(rs.getInt("answer_count"));
				bean.setDirectory(rs.getString("directory"));
				bean.setDate(rs.getString("date"));
				bean.setPoint(rs.getInt("point"));
				bean.setFilename(rs.getString("filename"));
				bean.setFilesize(rs.getInt("filesize"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//디렉토리별 데이터갯수
	public int getTotalCount(String dir) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if(dir.equals("전체")) {
				sql = "select count(*) from in_question";
				pstmt = con.prepareStatement(sql);
			}else {
				sql = "select count(*) from in_question where directory =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dir);
			}
			rs = pstmt.executeQuery();
			if(rs.next()) totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	//게시물 하나 가져오기
	public QuestionBean boardRead(int qnum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		QuestionBean bean = new QuestionBean();
		try {
			con = pool.getConnection();
			sql = "select * from in_question where qnum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,qnum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
				bean.setDirectory(rs.getString("directory"));
				bean.setDate(rs.getString("date"));
				bean.setId(rs.getString("id"));
				bean.setAnswer_count(rs.getInt("answer_count"));
				bean.setHits(rs.getInt("hits")+1);
				bean.setPoint(rs.getInt("point"));
				bean.setFilename(rs.getString("filename"));
				bean.setFiledata(rs.getString("filedata"));
				bean.setFilesize(rs.getInt("filesize"));
				bean.setFilename2(rs.getString("filename2"));
				bean.setFiledata2(rs.getString("filedata2"));
				bean.setFilesize2(rs.getInt("filesize2"));
				bean.setTag(rs.getString("tag"));
				bean.setChoice(rs.getString("choice"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	//답변시 답변수 +1
	public void answerAdd(int qnum,int cnt){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update in_question set answer_count = answer_count+? where qnum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,cnt);
			pstmt.setInt(2,qnum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return;
	}
	
	//조회수 +1
		public void hitsAdd(int qnum){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "update in_question set hits = hits+1 where qnum = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,qnum);
				pstmt.executeUpdate();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return;
		}
		//질문 삭제
		public void deleteQuestion(int qnum) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "delete from in_question where qnum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, qnum);
			    pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return;
		}
		//파일1 삭제
		public void deleteFile1(int qnum) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try { 
				QuestionBean bean = boardRead(qnum); 
				 String tempfile=bean.getFilename();
				 File f = new File(SAVEFOLDER+tempfile);
					if(f.exists()) {
						UtilMgr.delete(SAVEFOLDER+tempfile);
					}
			 
				con = pool.getConnection();
				sql = "update in_question set filename=?,filedata=?,filesize=? where qnum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "");
				pstmt.setString(2, "");
				pstmt.setInt(3,0);
				pstmt.setInt(4, qnum);
			    pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
			return;
		}
		//파일2 삭제
				public void deleteFile2(int qnum) {
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					try { 
						QuestionBean bean = boardRead(qnum); 
						 String tempfile2=bean.getFilename2();
						 File f = new File(SAVEFOLDER+tempfile2);
							if(f.exists()) {
								UtilMgr.delete(SAVEFOLDER+tempfile2);
							}
					 
						con = pool.getConnection();
						sql = "update in_question set filename2=?,filedata2=?,filesize2=? where qnum=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "");
						pstmt.setString(2, "");
						pstmt.setInt(3,0);
						pstmt.setInt(4, qnum);
					    pstmt.executeUpdate();
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}
					return;
				}
		//질문 수정
		public void updateQuestion(MultipartRequest multi) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				int qnum=Integer.parseInt(multi.getParameter("qnum"));
				String title=multi.getParameter("title");
				String directory=multi.getParameter("directory");
				String content=multi.getParameter("content");
				String filename=multi.getFilesystemName("filename1");
				String filename2=multi.getFilesystemName("filename2");
				String filedata=multi.getParameter("filedata");
				String filedata2=multi.getParameter("filedata2");
				String ofiledata = "";
				String ofiledata2 = "";
				
				if(multi.getParameter("ofiledata")!=null) {
					ofiledata = multi.getParameter("ofiledata");
				}
				if(multi.getParameter("ofiledata2")!=null) {
					ofiledata2 = multi.getParameter("ofiledata2");
				}
				
				if(filename!=null&&!filename.equals("")) {  //파일1을 수정할때 
					if(filename2==null||filename2.equals("")) {   //파일 2는 수정 하지않을때 
					//파일이 업로드 수정이되면 기존에 파일은 삭제한다
					QuestionBean bean = boardRead(qnum); 
					String tempfile=bean.getFilename();
					if(tempfile!=null&&!tempfile.equals("")) {
						 //기존에 파일이 있다면
						File f = new File(SAVEFOLDER+tempfile);
						if(f.exists()) {
							UtilMgr.delete(SAVEFOLDER+tempfile);
						}
					}
					int filesize = (int)multi.getFile("filename1").length();
					sql = "update in_question set title=?, content=?, directory=?, filename=?,filedata=?, filesize=?,filedata2=?,tag=? where qnum=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, title);
					pstmt.setString(2, content);
					pstmt.setString(3, directory);
					pstmt.setString(4, filename);
					pstmt.setString(5, filedata);
					pstmt.setInt(6, filesize);
					pstmt.setString(7, ofiledata2);
					if(multi.getParameterValues("tag")!=null) {
					String tag[] = multi.getParameterValues("tag");
					String taglist="";
					for (int i = 0; i < tag.length; i++) {
					taglist += tag[i];
					}
					pstmt.setString(8, taglist);
					}else {
						pstmt.setString(8,"");
					}
					pstmt.setInt(9,qnum);
					System.out.println("1수정2수정아님");
					
					}else if(filename2!=null&&!filename.equals("")) { //파일 2도 수정할때 
						QuestionBean bean = boardRead(qnum); 
						String tempfile=bean.getFilename();
						String tempfile2=bean.getFilename2();
						if(tempfile!=null&&!tempfile.equals("")) {
							 //기존에 파일이 있다면
							File f = new File(SAVEFOLDER+tempfile);
							if(f.exists()) {
								UtilMgr.delete(SAVEFOLDER+tempfile);
							}
						}
						if(tempfile2!=null&&!tempfile2.equals("")) {
							 //기존에 파일이 있다면
							File f2 = new File(SAVEFOLDER+tempfile2);
							if(f2.exists()) {
								UtilMgr.delete(SAVEFOLDER+tempfile2);
							}
						}
						int filesize = (int)multi.getFile("filename1").length();
						int filesize2 = (int)multi.getFile("filename2").length();
						sql = "update in_question set title=?, content=?, directory=?, filename=?,filedata=?, filesize=?, filename2=?,filedata2=?, filesize2=?,tag=?  where qnum=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, title);
						pstmt.setString(2, content);
						pstmt.setString(3, directory);
						pstmt.setString(4, filename);
						pstmt.setString(5, filedata);
						pstmt.setInt(6, filesize);
						pstmt.setString(7, filename2);
						pstmt.setString(8, filedata2);
						pstmt.setInt(9, filesize2);
						if(multi.getParameterValues("tag")!=null) {
						String tag[] = multi.getParameterValues("tag");
						String taglist="";
						for (int i = 0; i < tag.length; i++) {
						taglist += tag[i];
						}
						pstmt.setString(10, taglist);
						}else {
							pstmt.setString(10,"");
						}
						pstmt.setInt(11,qnum);
						System.out.println("1수정2수정");
					}
				}else if(filename==null||filename.equals("")) {   //파일 1는 수정 하지않을때 
					 if(filename2!=null&&!filename2.equals("")) {    //파일 2는 수정할때
						 QuestionBean bean = boardRead(qnum); 
						 String tempfile2=bean.getFilename2();
						
						 if(tempfile2!=null&&!tempfile2.equals("")) {
							 //기존에 파일이 있다면
							File f2 = new File(SAVEFOLDER+tempfile2);
							if(f2.exists()) {
								UtilMgr.delete(SAVEFOLDER+tempfile2);
							}
						}
							int filesize2 = (int)multi.getFile("filename2").length();
							sql = "update in_question set title=?, content=?, directory=?,filedata=?, filename2=?,filedata2=?, filesize2=?,tag=?  where qnum=?";
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1, title);
							pstmt.setString(2, content);
							pstmt.setString(3, directory);
							pstmt.setString(4, ofiledata);
							pstmt.setString(5, filename2);
							pstmt.setString(6, filedata2);
							pstmt.setInt(7, filesize2);
							if(multi.getParameterValues("tag")!=null) {
							String tag[] = multi.getParameterValues("tag");
							String taglist="";
							for (int i = 0; i < tag.length; i++) {
							taglist += tag[i];
							}
							pstmt.setString(8, taglist);
							}else {
								pstmt.setString(8,"");
							}
							pstmt.setInt(9,qnum);
							System.out.println("1수정아님2수정");
					 }else {  //파일 1, 2 모두 수정하지 않을때 
							sql = "update in_question set title=?, content=?, directory=?,filedata=?,filedata2=?,tag=? where qnum=?";
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1, title);
							pstmt.setString(2, content);
							pstmt.setString(3, directory);
							pstmt.setString(4, ofiledata);
							pstmt.setString(5, ofiledata2);
							if(multi.getParameterValues("tag")!=null) {
							String tag[] = multi.getParameterValues("tag");
							String taglist="";
							for (int i = 0; i < tag.length; i++) {
							taglist += tag[i];
							}
							pstmt.setString(6, taglist);
							}else {
								pstmt.setString(6,"");
							}
							pstmt.setInt(7, qnum);
							System.out.println("1수정아님2수정아님");
						}
				}
				
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		//회원정보 가져오기
		public MemberBean memberRead(String id){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			MemberBean bean = new MemberBean();
			try {
				con = pool.getConnection();
				sql = "SELECT questionCnt,answerCnt,inPoint,RANK FROM(SELECT *,( @rank := @rank + 1 ) AS RANK "
						+ "FROM navermember AS a,( SELECT @rank := 0 ) AS b "
						+ "oRder BY a.inPoint DESC) AS r "
						+ "WHERE r.id=?;";    //랭크 컬럼 임의로 만들고 순위 매긴 테이블에서 아이디로 데이터 추출하기
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bean.setQuestionCnt(rs.getInt("questionCnt"));
					bean.setAnswerCnt(rs.getInt("answerCnt"));
					bean.setInPoint(rs.getInt("inPoint"));
					bean.setGender(rs.getString("rank"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
		}
		
		
	
				//통합검색결과페이지에 5개 뿌리기
				public Vector<QuestionBean> getSearchIn(String keyWord) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					Vector<QuestionBean> vlist = new Vector<QuestionBean>();
					try {
						con = pool.getConnection();
						sql = "select * from in_question where title like ? limit 0,5";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "%"+keyWord+"%");
						rs = pstmt.executeQuery();
						while(rs.next()) {
							QuestionBean bean = new QuestionBean();
							bean.setTitle(rs.getString("title"));
							bean.setContent(rs.getString("content"));
							bean.setQnum(rs.getInt("qnum"));
							vlist.addElement(bean);
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return vlist;
				}
		
		//지식인 검색결과 페이지에 10개 뿌리고 페이징 처리
				public Vector<QuestionBean> getSearchInOnly(String keyWord, int start, int cnt) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					Vector<QuestionBean> vlist = new Vector<QuestionBean>();
					try {
						con = pool.getConnection();
						sql = "select * from in_question where title like ? limit ?, ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "%"+keyWord+"%");
						pstmt.setInt(2, start);
						pstmt.setInt(3, cnt);
						rs = pstmt.executeQuery();
						while(rs.next()) {
							QuestionBean bean = new QuestionBean();
							bean.setTitle(rs.getString("title"));
							bean.setContent(rs.getString("content"));
							bean.setQnum(rs.getInt("qnum"));
							vlist.addElement(bean);
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return vlist;
				}
				
				//나의 질문 가져오기
				public Vector<QuestionBean> getMyList(int start,int end,String id){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					Vector<QuestionBean> vlist = new Vector<QuestionBean>();
					try {
						con = pool.getConnection();
						
							sql = "select * from in_question where id=? order by date desc limit ?,?";
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1,id);
							pstmt.setInt(2, start);
							pstmt.setInt(3, end);
				
						rs = pstmt.executeQuery();
						while(rs.next()) {
							QuestionBean bean = new QuestionBean();
							bean.setQnum(rs.getInt("qnum"));
							bean.setId(rs.getString("id"));
							bean.setTitle(rs.getString("title"));
							bean.setAnswer_count(rs.getInt("answer_count"));
							bean.setDirectory(rs.getString("directory"));
							bean.setDate(rs.getString("date"));
							bean.setPoint(rs.getInt("point"));
							bean.setFilename(rs.getString("filename"));
							bean.setFilesize(rs.getInt("filesize"));
							bean.setChoice(rs.getString("choice"));
							vlist.addElement(bean);
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return vlist;
				}
				//나의 답변 가져오기
				public Vector<AnswerBean> getMyList2(int start,int end,String id){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					Vector<AnswerBean> vlist = new Vector<AnswerBean>();
					try {
						con = pool.getConnection();
						
							sql = "select * from in_answer where id=? order by date desc  limit ?,?";
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1,id);
							pstmt.setInt(2, start);
							pstmt.setInt(3, end);
						rs = pstmt.executeQuery();
						while(rs.next()) {
							AnswerBean bean = new AnswerBean();
							bean.setQnum(rs.getInt("qnum"));
							bean.setContent(rs.getString("content"));
							bean.setChoice(rs.getInt("choice"));
							bean.setDate(rs.getString("date"));
							vlist.addElement(bean);
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return vlist;
				}
				//나의 질문 갯수 가져오기 
				public int getIdCount(String id) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
							sql = "select count(*) from in_question where id= ?";
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						if(rs.next()) totalCount = rs.getInt(1);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return totalCount;
				}
				//나의 답변 갯수 가져오기 
				public int getId2Count(String id) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
							sql = "select count(*) from in_answer where id= ?";
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						if(rs.next()) totalCount = rs.getInt(1);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return totalCount;
				}
				
				//나의 답변채택 갯수 가져오기 
				public int getIdChoiceCount(String id) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
							sql = "select count(*) from in_answer where id= ? and choice=1";
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						if(rs.next()) totalCount = rs.getInt(1);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return totalCount;
				}
				
				//나의 채택하지 않은 질문 갯수 가져오기 
				public int getIdUnChoiceQ(String id) {
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int totalCount = 0;
					try {
						con = pool.getConnection();
							sql = "select count(*) from in_question where id=? and choice is not NULL";
							pstmt = con.prepareStatement(sql);
							pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						if(rs.next()) totalCount = rs.getInt(1);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return totalCount;
				}
}

