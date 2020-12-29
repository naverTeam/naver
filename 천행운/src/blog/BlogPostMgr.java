package blog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class BlogPostMgr {
	private DBConnectionMgr pool;
	
	public BlogPostMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public BlogPostBean getNewPost(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BlogPostBean bean = new BlogPostBean();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM blog_post WHERE id=? AND postNo=(SELECT MAX(postNo) FROM blog_post);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setPostNo(rs.getInt("postNo"));
				bean.setPostTitle(rs.getString("postTitle"));
				bean.setPostText(rs.getString("postText"));
				bean.setPostImg(rs.getString("postImg"));
				bean.setPostCNum(rs.getInt("postCNum"));
				bean.setPostTopic(rs.getString("postTopic"));
				bean.setPostLike(rs.getInt("postLike"));
				bean.setPostView(rs.getInt("postView"));
				bean.setPostDate(rs.getString("postDate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	
	public BlogPostBean getMaxViewPost(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BlogPostBean bean = new BlogPostBean();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM blog_post WHERE id=? AND postView=(SELECT MAX(postView) FROM blog_post);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setPostNo(rs.getInt("postNo"));
				bean.setPostTitle(rs.getString("postTitle"));
				bean.setPostText(rs.getString("postText"));
				bean.setPostImg(rs.getString("postImg"));
				bean.setPostCNum(rs.getInt("postCNum"));
				bean.setPostTopic(rs.getString("postTopic"));
				bean.setPostLike(rs.getInt("postLike"));
				bean.setPostView(rs.getInt("postView"));
				bean.setPostDate(rs.getString("postDate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	public BlogPostBean getMaxLikePost(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BlogPostBean bean = new BlogPostBean();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM blog_post WHERE id=? AND postLike=(SELECT MAX(postLike) FROM blog_post);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setPostNo(rs.getInt("postNo"));
				bean.setPostTitle(rs.getString("postTitle"));
				bean.setPostText(rs.getString("postText"));
				bean.setPostImg(rs.getString("postImg"));
				bean.setPostCNum(rs.getInt("postCNum"));
				bean.setPostTopic(rs.getString("postTopic"));
				bean.setPostLike(rs.getInt("postLike"));
				bean.setPostView(rs.getInt("postView"));
				bean.setPostDate(rs.getString("postDate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	
	public BlogPostBean getPost(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BlogPostBean bean = new BlogPostBean();
		try {
			con = pool.getConnection();
			sql = "select * from blog_post where postNo=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setPostNo(rs.getInt("postNo"));
				bean.setPostTitle(rs.getString("postTitle"));
				bean.setPostText(rs.getString("postText"));
				bean.setPostImg(rs.getString("postImg"));
				bean.setPostCNum(rs.getInt("postCNum"));
				bean.setPostTopic(rs.getString("postTopic"));
				bean.setPostLike(rs.getInt("postLike"));
				bean.setPostView(rs.getInt("postView"));
				bean.setPostDate(rs.getString("postDate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	public Vector<BlogPostBean> getPostList(String id, int cateNum){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BlogPostBean> vlist = new Vector<BlogPostBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM blog_post join post_category on blog_post.id = post_category.id WHERE blog_post.id=? AND post_category.blogCateNum=? AND blog_post.postCNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, cateNum);
			pstmt.setInt(3, cateNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BlogPostBean bean = new BlogPostBean();
				bean.setPostNo(rs.getInt("postNo"));
				bean.setPostTitle(rs.getString("postTitle"));
				bean.setPostText(rs.getString("postText"));
				bean.setPostImg(rs.getString("postImg"));
				bean.setPostCNum(rs.getInt("postCNum"));
				bean.setPostDate(rs.getString("postDate"));
				bean.setPostLike(rs.getInt("postLike"));
				bean.setPostView(rs.getInt("postView"));
				vlist.addElement(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
}
