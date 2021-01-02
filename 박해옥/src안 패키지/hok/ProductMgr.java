package hok;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductMgr {
	private DBConnectionMgr pool;
	private static final String UPLOAD = "C:/Jsp/myapp/WebContent/hok/data/";
	private static final String ENCTYPE = "EUC-KR";
	private static final int MAXSIZE = 10*1024*1024;
	
	public ProductMgr() {
		pool =DBConnectionMgr.getInstance();
	}
	
	//product List
	public Vector<ProductBean> getProductList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProductBean> vlist = new Vector<ProductBean>();
		try {
			con = pool.getConnection();
			sql = "select proNum,proName,price,stock,proDay,proImg from tblProduct order by proNum desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setProNum(rs.getInt(1));
				bean.setProName(rs.getString(2));
				bean.setPrice(rs.getInt(3));
				bean.setStock(rs.getInt(4));
				bean.setProDay(rs.getString(5));
				bean.setProImg(rs.getString(6));
				vlist.addElement(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
		
	}
	
	//Product Detail
	public ProductBean getProduct(int proNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ProductBean bean = new ProductBean();
		try {
			con = pool.getConnection();
			sql = "select proNum,proImg,proName,price,proDay,proAm,"
					+ "salAm,stock,name,proAddress,proPhone,proDetail"
					+ " from tblProduct where proNum= ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,proNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setProNum(rs.getInt(1));
				bean.setProImg(rs.getString(2));
				bean.setProName(rs.getString(3));
				bean.setPrice(rs.getInt(4));
				bean.setProDay(rs.getString(5));
				bean.setProAm(rs.getInt(6));
				bean.setSalAm(rs.getInt(7));
				bean.setStock(rs.getInt(8));
				bean.setName(rs.getString(9));
				bean.setProAddress(rs.getString(10));
				bean.setProPhone(rs.getString(11));
				bean.setProDetail(rs.getString(12));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	//Product Stock Reduce(구매 -> 재고, 판매량 수정)
	public void reduceProduct(OrderBean order) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update tblProduct set stock=stock-? where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,order.getOrdAm());
			pstmt.setInt(2,order.getProNum());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return;
	}
	
	/////admin mode///////
	//Product Insert : 상품 저장
	public boolean insertProduct(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag=false;
		try {
			MultipartRequest multi = new MultipartRequest(req,UPLOAD,
					MAXSIZE,ENCTYPE, new DefaultFileRenamePolicy());
			con = pool.getConnection();
			sql = "";
			pstmt = con.prepareStatement(sql);
			int cnt = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//Product Update : 상품 수정
	
	//Procuct Delete : 상품 삭제
	
	
	

}
