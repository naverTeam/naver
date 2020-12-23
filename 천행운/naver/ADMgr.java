package naver;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class ADMgr {

	private DBConnectionMgr pool;
	
	public ADMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public Vector<ADBean> getADSide() {
		Vector<ADBean> vlist = new Vector<ADBean>();
		Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				try {
					con = pool.getConnection();
					sql = "select * from naverad where adtype='side'";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()) {
						ADBean bean = new ADBean();
						bean.setImg(rs.getString("adimg"));
						bean.setUrl(rs.getString("adurl"));
						bean.setDesc(rs.getString("addesc"));
						vlist.addElement(bean);
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return vlist;
			}
	
	public ADBean getBannerAD() {
				ADBean bean = new ADBean();
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = null;
				try {
					con = pool.getConnection();
					sql = "select * from naverad where adtype='banner'";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						bean.setImg(rs.getString("adimg"));
						bean.setUrl(rs.getString("adurl"));
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					pool.freeConnection(con, pstmt, rs);
				}
				return bean;
			}
	}
