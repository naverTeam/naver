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
	
	public Vector<BlogPostBean> getPostList(String id, String cateName){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BlogPostBean> vlist = new Vector<BlogPostBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM blog_post join post_category on blog_post.id = post_category.id WHERE blog_post.id=? AND post_category.blogCateName=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, cateName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BlogPostBean bean = new BlogPostBean();
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
