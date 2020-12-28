package blog;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class PostingMgr {
	private DBConnectionMgr pool;
	public static final String SAVEFOLDER = "C:/Jsp/naver/WebContent/blog/data/";
	public static final String ENCTYPE = "EUC-KR";
	public static int MAXSIZE = 10*1024*1024;
	
	public PostingMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public void insertPost(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			File dir = new File(SAVEFOLDER);
			if(!dir.exists())
				dir.mkdirs();
			
			MultipartRequest multi = 
					new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
			String[] fileName = new String[5];
			
			int fileSize = 0;
			if(multi.getFilesystemName("filename[]")!=null) {
				for (int i = 0; i < fileName.length; i++) {
					/* fileName[i]=(filename[]); */
				}
			}
			con = pool.getConnection();
			sql = "INSERT blog_post (id, postTitle, postText, postImg, postCNum, postTopic, postDate, postLike, postView)"
					+ "VALUES (?, ?, ?, ?, ?, ?, now(), 0, 0);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("bid"));
			pstmt.setString(2, multi.getParameter("title"));
			pstmt.setString(3, multi.getParameter("text"));
			for (int i = 0; i < fileName.length; i++) {
				pstmt.setString(4, fileName[i]);
			}			
			pstmt.setString(5, multi.getParameter("category"));
			pstmt.setString(6, multi.getParameter("topic"));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
}
