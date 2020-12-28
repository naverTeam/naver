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
	}