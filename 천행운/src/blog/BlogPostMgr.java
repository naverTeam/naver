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
	//메인페이지 영역////////////////////////////////////
	//주제별 큰 블로그 하나 가져오기
	public BlogPostBean getHotPost(String topic) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			BlogPostBean bean = new BlogPostBean();
			try {
				con = pool.getConnection();
				sql = "select * from blog_post where postTopic=? and postLike =(select max(postLike) from blog_post)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, topic);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bean.setId(rs.getString("id"));
					bean.setPostNo(rs.getInt("postNo"));
					bean.setPostTitle(rs.getString("postTitle"));
					bean.setPostImg(rs.getString("postImg"));
					bean.setPostText(rs.getString("postText"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return bean;
		}
	//주제별 작은 블로그 세개 가져오기
	public Vector<BlogPostBean> getMainList(String topic) {
		Vector<BlogPostBean> vlist = new Vector<BlogPostBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select * from blog_post where postTopic=? limit 0,3";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, topic);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BlogPostBean bean = new BlogPostBean();
				bean.setPostCNum(rs.getInt("postCNum"));
				bean.setId(rs.getString("id"));
				bean.setPostNo(rs.getInt("postNo"));
				bean.setPostTitle(rs.getString("postTitle"));
				bean.setPostImg(rs.getString("postImg"));
				bean.setPostText(rs.getString("postText"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	//추천이웃을 위한 글 가져오기
	public Vector<BlogPostBean> getPopList(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BlogPostBean> vlist = new Vector<BlogPostBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM blog_post WHERE NOT id=? GROUP BY id ORDER BY postLike";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BlogPostBean bean = new BlogPostBean();
				bean.setId(rs.getString("id"));
				bean.setPostTitle(rs.getString("postTitle"));
				bean.setPostText(rs.getString("postText"));
				bean.setPostCNum(rs.getInt("postCNum"));
				bean.setPostNo(rs.getInt("postNo"));
				bean.setPostImg(rs.getString("postImg"));
				vlist.addElement(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	//개인블로그 영역///////////////////////////////////////////////////////////////////
	//카테고리의 게시글 페이징&블럭처리를 위한 총 게시물 수 가져오기
	public int getTotalCount(int cateNum, String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int cnt = 0;
		try {
			con = pool.getConnection();
			sql = "SELECT COUNT(*) FROM blog_post WHERE postCNum=? AND id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cateNum);
			pstmt.setString(2, id);
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
	public BlogPostBean getNewPost(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BlogPostBean bean = new BlogPostBean();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM blog_post WHERE id=?  ORDER BY postNo DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.first()) {
				bean.setId(rs.getString("id"));
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
	
	public Vector<BlogPostBean> getPostList(String id, int cateNum, int start, int cnt){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BlogPostBean> vlist = new Vector<BlogPostBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM blog_post join post_category on blog_post.id = post_category.id WHERE blog_post.id=? AND post_category.blogCateNum=? AND blog_post.postCNum=? limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, cateNum);
			pstmt.setInt(3, cateNum);
			pstmt.setInt(4, start);
			pstmt.setInt(5, cnt);			
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
	
	//카테고리의 최근 글 하나 가져오기
	public BlogPostBean getCateNewPost(String id, int cateNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BlogPostBean bean = new BlogPostBean();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM blog_post WHERE id=? AND postCNum=? AND postNo=(SELECT MAX(postNo) FROM blog_post)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, cateNum);			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setPostNo(rs.getInt("postNo"));
				bean.setPostTitle(rs.getString("postTitle"));
				bean.setPostText(rs.getString("postText"));
				bean.setPostImg(rs.getString("postImg"));
				bean.setPostCNum(rs.getInt("postCNum"));
				bean.setPostDate(rs.getString("postDate"));
				bean.setPostLike(rs.getInt("postLike"));
				bean.setPostView(rs.getInt("postView"));
			}
			pstmt.close();
			sql="update blog_post set postView=postView+1 where id=? and postCNum=? and postNo=(SELECT MAX(postNo))";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, cateNum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	//카테고리의 선택한 글 하나 가져오기
	public BlogPostBean getCateInNumPost(String id, int cateNum, int postNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BlogPostBean bean = new BlogPostBean();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM blog_post WHERE id=? AND postCNum=? AND postNo=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, cateNum);
			pstmt.setInt(3, postNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setPostNo(rs.getInt("postNo"));
				bean.setPostTitle(rs.getString("postTitle"));
				bean.setPostText(rs.getString("postText"));
				bean.setPostImg(rs.getString("postImg"));
				bean.setPostCNum(rs.getInt("postCNum"));
				bean.setPostDate(rs.getString("postDate"));
				bean.setPostLike(rs.getInt("postLike"));
				bean.setPostView(rs.getInt("postView"));
			}
			pstmt.close();
			sql="update blog_post set postView=postView+1 where id=? and postCNum=? and postNo=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, cateNum);
			pstmt.setInt(3, postNum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	//주제별 인기글 가져오기
	
	//테스트 데이터 집어넣기용
	public void insertTestData(int cateNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert blog_post (id, postTitle, postText, postImg, postCNum, postTopic, postDate, postLike, postView) values ('cjsgoddns', '제목xptmxm', '내용쓰asdxptmxm', '3333.jpg', ?, 'IT', now(), 5, 10)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cateNum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	public static void main(String[] args) {
		int cateNum = 1;
		for (int i = 0; i < 100; i++) {
			BlogPostMgr post = new BlogPostMgr();
			post.insertTestData(cateNum);
		}
	}
}
