package blog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class BlogMgr {
	private DBConnectionMgr pool;
	
	public BlogMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean getBlogState(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select * from blog where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next())
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	//블로그 가져오기 (배너이미지, 프로필 등 블로그페이지세팅)
	public BlogBean getBlogPage(String id){
		Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				BlogBean bean = new BlogBean();
				try {
					con = pool.getConnection();
					sql = "SELECT * FROM blog WHERE id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						bean.setProfileDesc(rs.getString("profiledesc"));
						bean.setProfileImage(rs.getString("profileimg"));
						bean.setBannerImg(rs.getString("blogbanner"));	
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return bean;
			}
	
	//블로그 내에 카테고리 몇 개 있는지 확인
	public String getBlogMaxCateNum(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String maxCateNum = null;
		try {
			con = pool.getConnection();
			sql = "SELECT blogcatenum FROM post_category WHERE id=? AND blogcatenum=(SELECT MAX(blogcatenum) FROM post_category)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				maxCateNum = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxCateNum;
	}
}