package blog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BlogSettingMgr {
private DBConnectionMgr pool;
	
	public BlogSettingMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public int getMaxCateNum(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int mcn = 0; //*maxCateNum
		try {
			con = pool.getConnection();
			sql = "SELECT MAX(blogCateNum) FROM post_category WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mcn = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return mcn;
	}
	
	public boolean changeCate(String cName, String id,int cNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "UPDATE post_category set blogCateName=? where id=? AND blogCateNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cName);
			pstmt.setString(2, id);
			pstmt.setInt(3, cNum);
			if(pstmt.executeUpdate()==1);
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public boolean deleteCate(String id, int cNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "DELETE FROM post_category WHERE id=? AND blogCateNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, cNum);
			if(pstmt.executeUpdate()==1);
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	public boolean insertCate(String id, String cName, int cNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "INSERT post_category (id, blogCateName, blogCateNum) VALUES(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, cName);
			pstmt.setInt(3, cNum);
			if(pstmt.executeUpdate()==1);
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
}
