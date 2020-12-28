package in;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;

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
				
		
				/////////////////////////////////////
				con = pool.getConnection();
				sql = "insert in_question(id,title,content,directory,";
				sql += "point,answer_count,hits,date)";
				sql += "values(?, ?, ?, ?, ?, ?,?, now())";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("id"));
				pstmt.setString(2, multi.getParameter("title"));
				pstmt.setString(3, multi.getParameter("content"));
				pstmt.setString(4, multi.getParameter("directory"));
				pstmt.setString(5, multi.getParameter("point"));
				pstmt.setString(6, multi.getParameter("answer_count"));
				pstmt.setString(7, multi.getParameter("hits"));
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
	
	
}
