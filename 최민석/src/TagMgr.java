package in;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class TagMgr {

	private DBConnectionMgr pool;
	
	public TagMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//게시물 내용검색
	public Vector<TagBean> getTag(String searchKey){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<TagBean> vlist = new Vector<TagBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM tagname WHERE  tag like ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKey+"%");
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				TagBean bean = new TagBean();
				bean.setTag(rs.getString("tag"));
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
