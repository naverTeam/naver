package hok;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardMgr {
	
	private DBConnectionMgr pool;
	public static final String SAVEFOLDER = "C:/Jsp/myapp/WebContent/hok/board/fileupload/";
	public static final String ENCTYPE = "EUC-KR";
	public static int MAXSIZE = 10*1024*1024;//10MB
	
	public BoardMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Bpard Insert
	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			//���Ͼ��ε�//
			File dir = new File(SAVEFOLDER);
			if(!dir.exists())//������ ���ٸ�
				dir.mkdirs();//���������� ��� ��������
			//mkdir : ���������� ������ ���� �Ұ�
			//mkdirs : ���������� ��� ��������
			MultipartRequest multi = new MultipartRequest(req, SAVEFOLDER,
					MAXSIZE,ENCTYPE,new DefaultFileRenamePolicy());//���������� �ߺ��� ������ ������� �̸��� �ٲ㼭 ����
			String filename = null;
			int filesize = 0;
			if(multi.getFilesystemName("filename") != null) {
				//�Խù��� ���� ���ε�
				filename = multi.getFilesystemName("filename");
				filesize = (int)multi.getFile("filename").length();
			}
			String content = multi.getParameter("content");//�Խù� ����
			String contentType = multi.getParameter("contentType");//����Ÿ��
			if(contentType.equals("TEXT")) {
					content = UtilMgr.replace(content, "<", "&lt;");
			}
			//�亯�� ���� ref ����
			int ref = getMaxNum()+1;
			//////////////////////////////////////////////////
			con = pool.getConnection();
			sql = "insert tblBoard(name, content,subject,ref,pos,depth,"
					+ "regdate,pass,count,ip,filename,filesize,pronum) "
					+ "values(?,?,?,?,0,0,now(),?,0,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,multi.getParameter("name"));
			pstmt.setString(2,content);
			pstmt.setString(3,multi.getParameter("subject"));
			pstmt.setInt(4,ref);
			pstmt.setString(5,multi.getParameter("pass"));
			pstmt.setString(6,multi.getParameter("ip"));
			pstmt.setString(7,filename);
			pstmt.setInt(8,filesize);
			pstmt.setInt(9,Integer.parseInt( multi.getParameter("proNum")));
			
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//Board Max Num : num�� �ִ� ��
	public int getMaxNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int maxNum = 0;
		try {
			con = pool.getConnection();
			sql = "select max(num) from tblBoard";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) maxNum=rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return maxNum;
	}
	//Board Total Count : �� �Խù� ��
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("")||keyWord==null) {
				//�˻��� �ƴѰ�� 
				sql = "select count(*) from tblBoard";
				pstmt = con.prepareStatement(sql);
			}else {
				sql = "select count(*) from tblBoard where "
						+ keyField+" like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,"%"+keyWord+"%");
			}
				rs = pstmt.executeQuery();
				if(rs.next()) totalCount=rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	//Board List : �˻����
	public Vector<BoardBean> getBoardList(String keyFileId, String keyWord, int start, int cnt){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardBean> vlist=new Vector<BoardBean>();
		try {
			con = pool.getConnection();
			if(keyWord.trim().equals("") || keyWord==null) {
				//�˻��� �ƴҶ�
				sql = "select * from tblBoard order by ref desc, pos limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,start);
				pstmt.setInt(2,cnt);
			}else {
				//�˻��϶�
				sql = "select * from tblBoard where "+ keyFileId
						+" like ? order by ref desc, pos limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,"%"+keyWord+"%");
				pstmt.setInt(2,start);
				pstmt.setInt(3,cnt);
			}
				rs = pstmt.executeQuery();
				while (rs.next()) {
					BoardBean bean = new BoardBean();
					bean.setNum(rs.getInt("num"));
					bean.setName(rs.getString("name"));
					bean.setSubject(rs.getString("subject"));
					bean.setPos(rs.getInt("pos"));
					bean.setRef(rs.getInt("ref"));
					bean.setDepth(rs.getInt("depth"));
					bean.setRegdate(rs.getString("regdate"));
					bean.setCount(rs.getInt("count"));
					bean.setFilename(rs.getString("filename"));
					vlist.addElement(bean);
				}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//Board get: �ϳ��� �Խù� ����
	

}
