package blog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;
import java.util.Vector;

public class NeighborMgr {
	private DBConnectionMgr pool;
	
	public NeighborMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	//���̵� �� ���� �־� �̿��������� Ȯ��
	public boolean getNeighborList(String id, String nid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select * from neighbor where logId=? and neighborId=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, nid);
			rs = pstmt.executeQuery();
			if(rs.next()) flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	//�̿� ����Ʈ ��������
	public NeighborBean getNeighborList(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		NeighborBean bean = new NeighborBean();
		try {
			con = pool.getConnection();
			sql = "select * from neighbor where logId=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bean.setId(id);
				bean.setNeighborId(rs.getString("neighborId"));
				bean.setGroupNum(rs.getInt("groupNum"));
				bean.setGroupName(rs.getString("groupName"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	//�����̿����� Ȯ��
	public boolean getUnion(String id, String nid) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select * from neighbor where logId=? and neighborId=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);			
			pstmt.setString(2, nid);			
			rs = pstmt.executeQuery();			
			pstmt.close();
			if(rs.next()) {
				sql = "select * from neighbor where logId=? and neighborId=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, nid);			
				pstmt.setString(2, id);
				if(rs.next()) {
					flag = true;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	//��α׸��ο� �� ���� ���� 6�� �̿� ���̵� ��������
	public Vector<NeighborBean> getRandomNeighbor(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<NeighborBean> vlist = new Vector<NeighborBean>();
		try {
			
			con = pool.getConnection();
			sql = "select neighborId from neighbor where logId=? order by rand() limit 6";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NeighborBean bean = new NeighborBean();
				bean.setNeighborId(rs.getString("neighborId"));
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
