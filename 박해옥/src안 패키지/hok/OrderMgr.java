package hok;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class OrderMgr {
	private  DBConnectionMgr pool;
	
	public OrderMgr() {
			pool = DBConnectionMgr.getInstance();
	}
	
	//Insert : ¡÷πÆ
	
	public void insertOrder(OrderBean order) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "";
			pstmt = con.prepareStatement(sql);
			int cnt = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
		
	}
}
