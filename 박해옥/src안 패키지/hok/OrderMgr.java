package hok;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class OrderMgr {
	private  DBConnectionMgr pool;
	
	public OrderMgr() {
			pool = DBConnectionMgr.getInstance();
	}
	
public void insertOrder(OrderBean order) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblorder (id,proNum,ordAm,payMent, ordDay,state) "
					+ "values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,order.getId());//�ֹ�id
			pstmt.setInt(2,order.getProNum());//��ǰ��ȣ
			pstmt.setInt(3,order.getOrdAm());//�ֹ� ����
			pstmt.setInt(4,order.getPayment());//����ݾ�
			pstmt.setString(5,UtilMgr.getDay());//�ֹ� ��¥
			//������(1),����(2),�Ա�Ȯ��(3),����غ�(4),�����(5),�Ϸ�(6)
			pstmt.setString(6,"1");
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
		
	}
	
	//Order Insert : �ֹ�
	
	public void insertOrder2(OrderBean order) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblorder (id,proNum,ordAm, ordDay,state,"
					+ "payMent,ordPhone,payMe,payName,devAddress,"
					+ "zipcode,devName,devPhone,applynum,paid_amount) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,order.getId());//�ֹ�id
			pstmt.setInt(2,order.getProNum());//��ǰ��ȣ
			pstmt.setInt(3,order.getOrdAm());//�ֹ� ����
			pstmt.setString(4,UtilMgr.getDay());//�ֹ� ��¥
			//������(1),����(2),�Ա�Ȯ��(3),����غ�(4),�����(5),�Ϸ�(6)
			pstmt.setString(5,"1");//����
			pstmt.setInt(6,order.getPayment());//����ݾ�
			pstmt.setString(7,order.getOrdPhone());//�ֹ��� ��ȭ��ȣ
			pstmt.setString(8,order.getPayMe());//������
			pstmt.setString(9,order.getPayName());//�Ա��ڸ�
			pstmt.setString(10,order.getDevAddress());//������ּ�
			pstmt.setString(11,order.getZipcode());//�����ȣ
			pstmt.setString(12,order.getDevName());//�޴»��
			pstmt.setString(13,order.getDevPhone());//�޴»�� ��ȭ��ȣ
			pstmt.setInt(14, order.getApplynum());//���簪
			pstmt.setInt(15, order.getPaid_amount());//����ݾ�
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
		
	}
	
	//Order List : �ֹ� ����Ʈ
	public Vector<OrderBean> getOrderList(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<OrderBean> vlist = new Vector<OrderBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblOrder where id=? order by ordNum desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderBean order = new OrderBean();
				order.setOrdNum(rs.getInt("ordNum"));//�ֹ���ȣ
				order.setId(rs.getString("id"));//�ֹ��� ���
				order.setProNum(rs.getInt("proNum"));//�ֹ���ǰ��ȣ
				order.setOrdAm(rs.getInt("ordAm"));//�ֹ�����
				order.setPayment(rs.getInt("payment"));//�ֹ��ݾ�
				order.setOrdDay(rs.getString("ordDay"));//�ֹ���¥
				order.setState(rs.getString("state"));//�ֹ� ����
				vlist.addElement(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
		
	}
	
	//-------------admin mode-------------------//
	
	//Order All List : ��� �� �ֹ� ����Ʈ
	public Vector<OrderBean> getOrderList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<OrderBean> vlist = new Vector<OrderBean>();
		try {
			con = pool.getConnection();
			sql = "select * from tblOrder order by ordNum desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OrderBean order = new OrderBean();
				order.setOrdNum(rs.getInt("ordNum"));//�ֹ���ȣ
				order.setId(rs.getString("id"));//�ֹ� id
				order.setProNum(rs.getInt("proNum"));//�ֹ��� ��ǰ��ȣ
				order.setOrdDay(rs.getString("ordDay"));
				order.setState(rs.getString("state"));
				vlist.addElement(order);
											
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//Order Detail : �ֹ� �� ����
	public OrderBean getOrderDetail(int ordNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		OrderBean order = new OrderBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblOrder where ordNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,ordNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				order.setOrdNum(rs.getInt("ordNum"));
				order.setId(rs.getString("id"));
				order.setOrdAm(rs.getInt("ordAm"));
				order.setPayment(rs.getInt("payment"));
				order.setOrdDay(rs.getString("ordDay"));
				order.setState(rs.getString("state"));
				order.setProNum(rs.getInt("proNum"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return order;
	}
	
	//Order Update : �ֹ� ���� ����
	//������(1), ����(2), �Ա�Ȯ��(3), ����غ�(4), �����(5), �Ϸ�(6)
	public boolean updateOrder(int ordNum, String state) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag=false;
		try {
			con = pool.getConnection();
			sql = "update tblOrder set state=? where ordNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, state);
			pstmt.setInt(2, ordNum);
			if(pstmt.executeUpdate()==1) flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//Order Delete : �ֹ� ����
	public boolean deleteOrder(int ordNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag=false;
		try {
			con = pool.getConnection();
			sql = "delete from tblOrder whrer ordNum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ordNum);
			if(pstmt.executeUpdate()==1) flag=true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
		
	}
}
