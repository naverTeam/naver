package chu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import blog.BlogPostBean;

public class SearchBlogMgr {
	private DBConnectionMgr pool;
	
	public SearchBlogMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public Vector<BlogPostBean> getSearchBlog(String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BlogPostBean> vlist = new Vector<BlogPostBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM blog_post WHERE postTitle LIKE ? or postText LIKE ? limit 0,5";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+keyWord+"%");
			pstmt.setString(2, "%"+keyWord+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BlogPostBean bean = new BlogPostBean();
				bean.setPostNo(rs.getInt("postNo"));
				bean.setPostTitle(rs.getString("postTitle"));
				bean.setPostText(rs.getString("postText"));
				bean.setPostImg(rs.getString("postImg"));
				bean.setPostCNum(rs.getInt("postCNum"));
				bean.setPostTopic(rs.getString("postTopic"));
				bean.setPostLike(rs.getInt("postLike"));
				bean.setPostView(rs.getInt("postView"));
				bean.setPostDate(rs.getString("postDate"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public Vector<BlogPostBean> getSearchBlogOnly(String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BlogPostBean> vlist = new Vector<BlogPostBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM blog_post WHERE postTitle LIKE ? or postText LIKE ? limit 0,10";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+keyWord+"%");
			pstmt.setString(2, "%"+keyWord+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BlogPostBean bean = new BlogPostBean();
				bean.setPostNo(rs.getInt("postNo"));
				bean.setPostTitle(rs.getString("postTitle"));
				bean.setPostText(rs.getString("postText"));
				bean.setPostImg(rs.getString("postImg"));
				bean.setPostCNum(rs.getInt("postCNum"));
				bean.setPostTopic(rs.getString("postTopic"));
				bean.setPostLike(rs.getInt("postLike"));
				bean.setPostView(rs.getInt("postView"));
				bean.setPostDate(rs.getString("postDate"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	public int getTotalCount(String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int cnt = 0;
		try {
			con = pool.getConnection();
			sql = "select count(*) from blog_post where postTitle LIKE ? or postText LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+keyWord+"%");
			pstmt.setString(2, "%"+keyWord+"%");
			rs = pstmt.executeQuery();
			if(rs.next())
				cnt = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return cnt;
	}
}
