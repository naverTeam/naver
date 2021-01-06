package hok;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import hok.DBConnectionMgr;

public class MemberMgr {
	
		private DBConnectionMgr pool;
	
		public MemberMgr() {
			pool = DBConnectionMgr.getInstance();
		}

	//Admin Login
		public boolean adminCheck(String admin_id, String admin_pwd) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			boolean flag = false;
			try {
				con = pool.getConnection();
				sql = "select admin_id, admin_pwd from tblMallAdmin where admin_id = ? and admin_pwd = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, admin_id);
				pstmt.setString(2, admin_pwd);
				rs = pstmt.executeQuery();
				flag = rs.next();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con);
			}
			return flag;
		}
}
