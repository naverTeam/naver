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
}