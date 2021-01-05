package naver;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class BlogMgr {
	
	private DBConnectionMgr pool;
	
	public BlogMgr() {
		pool = DBConnectionMgr.getInstance();
	}

	//통합검색결과 페이지로 블로그 5개 가져오기
	public Vector<BlogBean> getBlogInSearch(String keyWord){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BlogBean> vlist = new Vector<BlogBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM naverblog WHERE btitle LIKE ? OR bdesc LIKE ? limit 0,5";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+keyWord+"%");
			pstmt.setString(2, "%"+keyWord+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BlogBean bean = new BlogBean();
				bean.setbTitle(rs.getString("btitle"));
				bean.setbImg(rs.getString("bimg"));
				bean.setbDesc(rs.getString("bdesc"));
				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//페이징 처리를 위해 검색어에 따른 게시물 개수 가져오기
	public int getTotalCount(String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			sql = "select count(*) from naverblog where btitle like ? or bdesc like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+keyWord+"%");
			pstmt.setString(2, "%"+keyWord+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) totalCount = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	//블로그검색결과 페이지로 블로그 10개 가져오기
	public Vector<BlogBean> getSearchedBlogList(String keyWord, int start, int cnt){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BlogBean> vlist = new Vector<BlogBean>();
		try {
			con = pool.getConnection();
			sql = "SELECT * FROM naverblog WHERE btitle LIKE ? OR bdesc LIKE ? limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+keyWord+"%");
			pstmt.setString(2, "%"+keyWord+"%");
			pstmt.setInt(3, start);
			pstmt.setInt(4, cnt);			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BlogBean bean = new BlogBean();
				bean.setbTitle(rs.getString("btitle"));
				bean.setbImg(rs.getString("bimg"));
				bean.setbDesc(rs.getString("bdesc"));
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