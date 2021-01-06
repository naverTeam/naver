package hok;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.mail.handlers.multipart_mixed;

public class ProductMgr {
	private DBConnectionMgr pool;
	private static final String UPLOAD = "C:/Jsp/naver/WebContent/hok/data/";
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
			sql = "select proNum,proName,price,stock,proDay,proImg,email from tblProduct order by proNum desc";
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
				bean.setEmail(rs.getString(7));
				
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
					+ "salAm,stock,name,proAddress,proPhone,proDetail,filename,"
					+ "id,zipcode,bankNa,accNo,accHo,email"
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
				bean.setFilename(rs.getString(13));
				bean.setId(rs.getString(14));
				bean.setZipcode(rs.getString(15));
				bean.setBankNa(rs.getString(16));
				bean.setAccNo(rs.getString(17));
				bean.setAccHo(rs.getString(18));
				bean.setEmail(rs.getString(19));
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
			sql = "update tblProduct set stock=stock-?,"
					+ "salAm=proAm-stock where proNum=?";
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
			sql = "insert tblProduct (name,email,proAddress,zipcode,proPhone,proName,proImg,price,proAm,stock,"
					+ "bankNa,accNo,accHo,proDetail,proDay,filename,id) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,multi.getParameter("name"));
			pstmt.setString(2, multi.getParameter("email"));
			String devAddress = multi.getParameter("cdevAd1");
			String devAd2 = multi.getParameter("cdevAd2");
			devAddress += "  "; devAddress += devAd2; 
			String devAd3 = multi.getParameter("cdevAd3");
			devAddress += "  "; devAddress += devAd3; 
			pstmt.setString(3, devAddress);
			pstmt.setString(4, multi.getParameter("czipcode"));
			pstmt.setString(5, multi.getParameter("proPhone"));
			pstmt.setString(6, multi.getParameter("proName"));
			if(multi.getFilesystemName("proImg") != null)
				pstmt.setString(7,multi.getFilesystemName("proImg"));
			else
				pstmt.setString(7,"ready.gif");
			pstmt.setInt(8,Integer.parseInt(  multi.getParameter("price")));
			pstmt.setInt(9,Integer.parseInt(  multi.getParameter("proAm")));
			pstmt.setInt(10,Integer.parseInt(  multi.getParameter("proAm")));
			pstmt.setString(11, multi.getParameter("bankNa"));
			pstmt.setString(12, multi.getParameter("accNo"));
			pstmt.setString(13, multi.getParameter("accHo"));
			pstmt.setString(14, multi.getParameter("proDetail"));
			pstmt.setString(15, UtilMgr.getDay());
			pstmt.setString(16, multi.getParameter("proDetail"));
			pstmt.setString(17, multi.getParameter("id"));

			
			int cnt = pstmt.executeUpdate();
			if(cnt==1) flag=true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//Product Update : 상품 수정
	public boolean updateProduct(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			MultipartRequest multi = new MultipartRequest(req,UPLOAD,
					MAXSIZE,ENCTYPE,new DefaultFileRenamePolicy());
			con = pool.getConnection();
			if(multi.getFilesystemName("proImg") != null) {
				//이미지도 수정
				sql="update tblProduct set name=?,email=?,proAddress=?,zipcode=?,proPhone=?,"
						+ "proName=?,proImg=?,price=?,proAm=?,stock=?,bankNa=?,"
						+ "accNo=?,accHo=?,proDetail=?,filename=?,id=? where proNum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,multi.getParameter("name"));
				pstmt.setString(2,multi.getParameter("email"));
				pstmt.setString(3,multi.getParameter("proAddress"));
				pstmt.setString(4,multi.getParameter("zipcode"));
				pstmt.setString(5,multi.getParameter("proPhone"));
				pstmt.setString(6,multi.getParameter("proName"));
				pstmt.setString(7,multi.getFilesystemName("proImg"));
				pstmt.setInt(8,Integer.parseInt(multi.getParameter("price")));
				pstmt.setInt(9,Integer.parseInt(multi.getParameter("proAm")));
				pstmt.setInt(10,Integer.parseInt(multi.getParameter("stock")));
				pstmt.setString(11,multi.getParameter("bankNa"));
				pstmt.setString(12,multi.getParameter("accNo"));
				pstmt.setString(13,multi.getParameter("accHo"));
				pstmt.setString(14,multi.getParameter("proDetail"));
				pstmt.setString(15,multi.getParameter("proDetail"));
				pstmt.setString(16,multi.getParameter("id"));
				pstmt.setInt(17,Integer.parseInt(multi.getParameter("proNum")));
					
			}else {
				//이미지도 수정 않할경우
				sql="update tblProduct set name=?,email=?,proAddress=?,zipcode=?,proPhone=?,"
						+ "proName=?,price=?,proAm=?,stock=?,bankNa=?,"
						+ "accNo=?,accHo=?,proDetail=?,filename=?,id=? where proNum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,multi.getParameter("name"));
				pstmt.setString(2,multi.getParameter("email"));
				pstmt.setString(3,multi.getParameter("proAddress"));
				pstmt.setString(4,multi.getParameter("zipcode"));
				pstmt.setString(5,multi.getParameter("proPhone"));
				pstmt.setString(6,multi.getParameter("proName"));
				pstmt.setInt(7,Integer.parseInt(multi.getParameter("price")));
				pstmt.setInt(8,Integer.parseInt(multi.getParameter("proAm")));
				pstmt.setInt(9,Integer.parseInt(multi.getParameter("stock")));
				pstmt.setString(10,multi.getParameter("bankNa"));
				pstmt.setString(11,multi.getParameter("accNo"));
				pstmt.setString(12,multi.getParameter("accHo"));
				pstmt.setString(13,multi.getParameter("proDetail"));
				pstmt.setString(14,multi.getParameter("proDetail"));
				pstmt.setString(15,multi.getParameter("id"));
				pstmt.setInt(16,Integer.parseInt(multi.getParameter("proNum")));
			}
			if( pstmt.executeUpdate()==1) flag=true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
		
	}
	
	
	//Procuct Delete : 상품 삭제(상품이미지도 삭제)
	public boolean deleteProduct(int proNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "delete from tblProduct where proNum=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, proNum);
			if( pstmt.executeUpdate() == 1) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	
	

}
