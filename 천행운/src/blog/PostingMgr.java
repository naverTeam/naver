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
	public static String SAVEFOLDER = "C:/Jsp/naver/WebContent/blog/data/";
	public static final String ENCTYPE = "EUC-KR";
	public static int MAXSIZE = 10*1024*1024;
	
	public PostingMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//글 쓰기
	public void insertPost(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			MultipartRequest multi = 
					new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());	
			
			String id= multi.getParameter("hiddenid");//히든으로 넘기는 값
			String myFolder = SAVEFOLDER+id;//data 아래에 각자 아이디로 폴더 만들기
			File dir = new File(myFolder);
			if(!dir.exists())
				dir.mkdirs();
			
			con = pool.getConnection();
			sql = "INSERT blog_post (id, postTitle, postText, postImg, postCNum, postTopic, postDate, postLike, postView)"
					+ "VALUES (?, ?, ?, ?, ?, ?, now(), 0, 0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("hiddenid"));
			pstmt.setString(2, multi.getParameter("title"));
			pstmt.setString(3, multi.getParameter("text"));
			pstmt.setString(4, multi.getFilesystemName("filename"));
			pstmt.setString(5, multi.getParameter("category"));
			pstmt.setString(6, multi.getParameter("topic"));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//글 수정하기
	public void updatePost(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			MultipartRequest multi = 
					new MultipartRequest(req, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());	
			
			String id= multi.getParameter("hiddenid");//히든으로 넘기는 값
			String myFolder = SAVEFOLDER+id;//data 아래에 각자 아이디로 폴더 만들기
			File dir = new File(myFolder);
			if(!dir.exists())
				dir.mkdirs();
			
			con = pool.getConnection();
			sql = "UPDATE blog_post set postTitle=?, postText=?, postImg=?, postCNum=?, postTopic=? where id=? and postNo=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("title"));
			pstmt.setString(2, multi.getParameter("text"));
			pstmt.setString(3, multi.getFilesystemName("filename"));
			pstmt.setString(4, multi.getParameter("category"));
			pstmt.setString(5, multi.getParameter("topic"));
			pstmt.setString(6, multi.getParameter("hiddenid"));
			pstmt.setString(7, multi.getParameter("hiddenPNum"));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
}
