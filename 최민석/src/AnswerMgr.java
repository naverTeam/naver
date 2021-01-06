package in;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import com.oreilly.servlet.MultipartRequest;

public class AnswerMgr {
	private DBConnectionMgr pool;
	
	public AnswerMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//답변입력
	public boolean insertAnswer(AnswerBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert in_answer(qnum,id,content,date) values(?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,bean.getQnum());
			pstmt.setString(2,bean.getId());
			pstmt.setString(3,bean.getContent());
			if(pstmt.executeUpdate()==1)flag=true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	// 답변 가져오기
		public Vector<AnswerBean> getAnswerList(int qnum){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<AnswerBean> vlist = new Vector<AnswerBean>();
			try {
				con = pool.getConnection();
				sql = "select * from in_answer where qnum = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,qnum);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AnswerBean bean = new AnswerBean();
				bean.setAnum(rs.getInt("anum"));
				bean.setId(rs.getString("id"));
				bean.setGrade(rs.getString("grade"));
				bean.setContent(rs.getString("content"));
				bean.setDate(rs.getString("date"));
				vlist.addElement(bean);
			  }
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
		
		//답변삭제
		public void deleteAnswer(int anum) {
			System.out.println(anum);
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "delete from in_answer where anum = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,anum);
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return ;
		}
	
		//답변 수정
		public void updateAnswer(int anum,String content) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "update in_answer set content=? where anum=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, content);
				pstmt.setInt(2, anum);
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		//오늘의 답변 갯수
				public int getQuestionCnt(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int cnt=0;
					try {
						con = pool.getConnection();
						sql = "SELECT COUNT(*) FROM `in_question` WHERE DATE_FORMAT(date, \"%Y-%m-%d\") = CURDATE()";
						pstmt = con.prepareStatement(sql);
					    rs = pstmt.executeQuery();
					    if(rs.next())
					    cnt = rs.getInt("COUNT(*)");
					}catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return cnt;
				}
				
		//오늘의 답변 갯수
		public int getAnswerCnt(){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int cnt=0;
			try {
				con = pool.getConnection();
				sql = "SELECT COUNT(*) FROM `in_answer` WHERE DATE_FORMAT(date, \"%Y-%m-%d\") = CURDATE()";
				pstmt = con.prepareStatement(sql);
			    rs = pstmt.executeQuery();
			    if(rs.next())
			    cnt = rs.getInt("COUNT(*)");
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return cnt;
		}
		//모든 답변 갯수
				public int getAllAnswerCnt(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					int cnt=0;
					try {
						con = pool.getConnection();
						sql = "SELECT COUNT(*) FROM `in_answer`";
						pstmt = con.prepareStatement(sql);
					    rs = pstmt.executeQuery();
					    if(rs.next())
					    cnt = rs.getInt("COUNT(*)");
					}catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return cnt;
				}
}
