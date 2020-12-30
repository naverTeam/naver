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
	public static final String SAVEFOLDER = "C:/Jsp/naver/WebContent/in/fileupload/";
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
				sql += "point,date)";
				sql += "values(?, ?, ?, ?, ?, now())";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,"test");
				pstmt.setString(2, multi.getParameter("title"));
				pstmt.setString(3, content);
				pstmt.setString(4, multi.getParameter("directory"));
				pstmt.setString(5, multi.getParameter("point"));
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
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	
	public int getTotalCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
				sql = "select count(*) from in_question";
				pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	
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
				bean.setHits(rs.getInt("hits"));
				bean.setPoint(rs.getInt("point"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	public boolean insertAnswer(AnswerBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert in_answer(qnum,id,content,date) values(?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,bean.getQnum());
			pstmt.setString(2,"session등록하세요");
			pstmt.setString(3,bean.getContent());
			if(pstmt.executeUpdate()==1)flag=true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
}

