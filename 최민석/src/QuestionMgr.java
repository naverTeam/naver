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
import in.DBConnectionMgr;

public class QuestionMgr {

	private DBConnectionMgr pool;
	public static final String SAVEFOLDER = "C:/Jsp/naver/WebContent/naver/in/fileupload/";
	public static final String ENCTYPE = "EUC-KR";
	public static int MAXSIZE = 10*1024*1024;//10MB
	
	public QuestionMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Board Insert
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
				String filename = null;
				int filesize = 0;
				if(multi.getFilesystemName("filename")!=null) {
					//게시물에 파일 업로드
					filename = multi.getFilesystemName("filename");
					filesize = (int)multi.getFile("filename").length();
				}
				String content  = multi.getParameter("content");
				content = UtilMgr.replace(content, "<", "&lt;");
		
				/////////////////////////////////////
				con = pool.getConnection();
				sql = "insert in_question(id,title,content,directory,";
				sql += "point,date,filename,filesize)";
				sql += "values(?, ?, ?, ?, ?, now(),?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,multi.getParameter("id"));
				pstmt.setString(2, multi.getParameter("title"));
				pstmt.setString(3, content);
				pstmt.setString(4, multi.getParameter("directory"));
				pstmt.setString(5, multi.getParameter("point"));
				pstmt.setString(6, filename);
				pstmt.setInt(7, filesize);
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		// 게시물 가져오기
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
				bean.setFilesize(rs.getInt("filesize"));
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
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return;
		}
		//질문 삭제
		//GuestBook Delete
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
				String filename=multi.getFilesystemName("filename");
				
				if(filename!=null&&!filename.equals("")) {
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
					int filesize = (int)multi.getFile("filename").length();
					sql = "update in_question set title=?, content=?, directory=?, filename=?, filesize=? where qnum=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, title);
					pstmt.setString(2, content);
					pstmt.setString(3, directory);
					pstmt.setString(4, filename);
					pstmt.setInt(5, filesize);
					pstmt.setInt(6,qnum);
				}else {
					sql = "update in_question set title=?, content=?, directory=? where qnum=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, title);
					pstmt.setString(2, content);
					pstmt.setString(3, directory);
					pstmt.setInt(4, qnum);
				}
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
}

