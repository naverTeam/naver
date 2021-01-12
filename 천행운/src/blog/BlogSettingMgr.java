package blog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BlogSettingMgr {
private DBConnectionMgr pool;
	
	public BlogSettingMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	//카테고리 업데이트////////////////////////////////////////////////////
	//카테고리 마지막 숫자(최대값) 가져오기 (카테고리 추가를 위해)
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
	//카테고리 수정
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
	//카테고리 삭제
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
	//카테고리 추가
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
	
	//카테고리 외 업데이트//////////////////////////////////
	//배너 수정
	public boolean updateBannerImg(String id, String bImg) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "UPDATE blog set blogbanner=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bImg);
			pstmt.setString(2, id);
			if(pstmt.executeUpdate()==1) flag=true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//프로필 사진 수정
	public boolean updateProfileImg(String id, String pImg) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "UPDATE blog set profileImg=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pImg);
			pstmt.setString(2, id);
			if(pstmt.executeUpdate()==1) flag=true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//인사말 수정
	public boolean updateProfileDesc(String id, String pDesc) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
				sql = "UPDATE blog set profileDesc=? where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, pDesc);
				pstmt.setString(2, id);
				if(pstmt.executeUpdate()==1) flag=true;
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		return flag;
	}
}
