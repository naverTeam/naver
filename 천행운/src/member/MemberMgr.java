package member;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import member.MemberBean;

public class MemberMgr {
	
	private DBConnectionMgr pool;
	
	public MemberMgr(){
		pool = DBConnectionMgr.getInstance();
	}
	//���̵� ã��
	public String findId(String name, String phone) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String str = null;
		try {
			con = pool.getConnection();
			sql = "select id from navermember where name=? and mobile=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				str = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return str;
	}
	//��й�ȣ ã��
	public String findPwd(String id, String name, String phone) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String str = null;
		try {
			con = pool.getConnection();
			sql = "select pwd from navermember where id=? and name=? and mobile=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				str = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return str;
	}
	//��й�ȣ ����
	public boolean updatePassword(String id, String pwd, String newPwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select * from navermember where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();			
			if(rs.next())
				pstmt.close();
				sql = "UPDATE navermember SET pwd=? WHERE id=? AND pwd=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, newPwd);
				pstmt.setString(2, id);
				pstmt.setString(3, pwd);				
				int cnt = pstmt.executeUpdate();
				if(cnt==1)
					flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	//ȸ��Ż��
	public boolean deleteMember(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "DELETE from navermember WHERE id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			int cnt = pstmt.executeUpdate();
			if(cnt==1)
				flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	////�α���
	public boolean loginMember(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from NaverMember where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			//if(rs.next()) flag=true;
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	//id �ߺ�üũ
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from NaverMember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	//ȸ������
	public boolean insertMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert NaverMember(id, pwd, name, birth_yyyy, birth_mm, birth_dd, gender, phone) values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,bean.getId());
			pstmt.setString(2,bean.getPwd());
			pstmt.setString(3,bean.getName());;
			pstmt.setString(4,bean.getBirth_yyyy());
			pstmt.setString(5,bean.getBirth_mm());
			pstmt.setString(6,bean.getBirth_dd());
			pstmt.setString(7,bean.getGender());
			pstmt.setString(8,bean.getPhone());
			if(pstmt.executeUpdate() == 1) flag = true;
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
				pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
}