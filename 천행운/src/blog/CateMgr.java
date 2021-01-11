package blog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class CateMgr {
	private DBConnectionMgr pool;
	public CateMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public Vector<CateBean> getBlogCategory(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<CateBean>vlist = new Vector<CateBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM post_category WHERE id=? ORDER BY blogcatenum asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CateBean bean = new CateBean();
				bean.setBlogCateName(rs.getString("blogcatename"));
				bean.setBlogCateNum(rs.getInt("blogcatenum"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//블로그 생성 시 기본 카테고리
	public void insertBaseCategory(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "INSERT post_category (id, blogCateNum, blogCateName) VALUES (?, 1, '기본')";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//카테고리 번호로 카테고리명 가져오기
	public String getCateName(String id, int cateNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String str = null;
		try {
			con = pool.getConnection();
			sql = "select blogCateName from post_category where id=? and blogCateNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, cateNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				str = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return str;
	}
	public Vector<Integer> getBlogCateNum(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<Integer> vlist = new Vector<Integer>();
		try {
			con = pool.getConnection();
			sql = "SELECT blogCateNum FROM post_category WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int i = (rs.getInt(1));
				vlist.addElement(i);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public int getMaxCateNum(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int mcn = 0; //*maxCateNum
		try {
			con = pool.getConnection();
			sql = "SELECT max(blogCateNum) FROM post_category WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next())
				mcn = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return mcn;
	}
}