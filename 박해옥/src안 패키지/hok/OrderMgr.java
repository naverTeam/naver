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
			pstmt.setString(1,order.getId());//주문id
			pstmt.setInt(2,order.getProNum());//상품번호
			pstmt.setInt(3,order.getOrdAm());//주문 수량
			pstmt.setInt(4,order.getPayment());//결재금액
			pstmt.setString(5,UtilMgr.getDay());//주문 날짜
			//접수중(1),접수(2),입금확인(3),배송준비(4),배송중(5),완료(6)
			pstmt.setString(6,"1");
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
		
	}
	
	//Order Insert : 주문
	
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
			pstmt.setString(1,order.getId());//주문id
			pstmt.setInt(2,order.getProNum());//상품번호
			pstmt.setInt(3,order.getOrdAm());//주문 수량
			pstmt.setString(4,UtilMgr.getDay());//주문 날짜
			//접수중(1),접수(2),입금확인(3),배송준비(4),배송중(5),완료(6)
			pstmt.setString(5,"1");//상태
			pstmt.setInt(6,order.getPayment());//결재금액
			pstmt.setString(7,order.getOrdPhone());//주문자 전화번호
			pstmt.setString(8,order.getPayMe());//결재방법
			pstmt.setString(9,order.getPayName());//입금자명
			pstmt.setString(10,order.getDevAddress());//배송지주소
			pstmt.setString(11,order.getZipcode());//우편번호
			pstmt.setString(12,order.getDevName());//받는사람
			pstmt.setString(13,order.getDevPhone());//받는사람 전화번호
			pstmt.setInt(14, order.getApplynum());//결재값
			pstmt.setInt(15, order.getPaid_amount());//결재금액
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
		
	}
	
	//Order List : 주문 리스트
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
				order.setOrdNum(rs.getInt("ordNum"));//주문번호
				order.setId(rs.getString("id"));//주문한 사람
				order.setProNum(rs.getInt("proNum"));//주문상품번호
				order.setOrdAm(rs.getInt("ordAm"));//주문수량
				order.setPayment(rs.getInt("payment"));//주문금액
				order.setOrdDay(rs.getString("ordDay"));//주문날짜
				order.setState(rs.getString("state"));//주문 상태
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
	
	//Order All List : 모든 고객 주문 리스트
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
				order.setOrdNum(rs.getInt("ordNum"));//주문번호
				order.setId(rs.getString("id"));//주문 id
				order.setProNum(rs.getInt("proNum"));//주문한 상품번호
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
	
	//Order Detail : 주문 상세 정보
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
	
	//Order Update : 주문 상태 수정
	//접수중(1), 접수(2), 입금확인(3), 배송준비(4), 배송중(5), 완료(6)
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
	
	//Order Delete : 주문 삭제
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
