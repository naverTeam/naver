package in;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import com.oreilly.servlet.MultipartRequest;

import member.MemberBean;

public class AnswerMgr {
	private DBConnectionMgr pool;
	
	public AnswerMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//�亯�Է�
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
			
			pstmt.close();
				
				sql = "update navermember set AnswerCnt = AnswerCnt+1 where id = ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, bean.getId());
				pstmt.executeUpdate();
		
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	// �亯 ��������
		public Vector<AnswerBean> getAnswerList(int qnum){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<AnswerBean> vlist = new Vector<AnswerBean>();
			try {
				con = pool.getConnection();
				sql = "select * from in_answer where qnum = ? order by choice desc";  //ä�ô亯�� ���ϸ��� ��������
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
		
		//�亯����
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
	
		//�亯 ����
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
		
		//������ ���� ����
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
				
		//������ �亯 ����
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
		//��� �亯 ����
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
				//�亯 ä��
				public boolean choiceAnswer(int anum,int qnum) {
					Connection con = null;
					PreparedStatement pstmt = null;
					String sql = null;
					boolean flag=false;
					try {
						//�Խñۿ��� �Ǻ��ϱ����� ���̽��ѹ� 
						con = pool.getConnection();
						sql = "update in_question set choice=? where qnum=?"; 
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, anum);
						pstmt.setInt(2, qnum);
						pstmt.executeUpdate();
						
						//�亯�� ä�ô亯�� �Ǻ��ϱ����� ���̽� �ѹ� 
						pstmt.close();
						sql = "update in_answer set choice=? where anum=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, 1);
						pstmt.setInt(2, anum);
						pstmt.executeUpdate();
						pstmt.close();
						
						//�Խñ��� ����Ʈ��ŭ ä�ô亯 ���̵� �߰��ϱ� 
						sql = "UPDATE navermember set inPoint = inPoint+"
								+ "(SELECT POINT FROM in_question WHERE qnum = ?) "
								+ "WHERE id = (SELECT id FROM in_answer WHERE anum = ?);";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, qnum);
						pstmt.setInt(2, anum);
						if(pstmt.executeUpdate()==1)flag=true;
						
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt);
					}return flag;
				}
				
				//���� ���帹�� ���̵� ��ȸ
				public MemberBean pid(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					MemberBean bean = new MemberBean();
					try {
						con = pool.getConnection();
						sql = "SELECT id,inPoint FROM navermember WHERE inPoint=(SELECT MAX(inPoint) FROM navermember)"; //���� ���帹�� ���̵�
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.next())
						bean.setId(rs.getString("id"));
						bean.setInPoint(rs.getInt("inPoint"));
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return bean;
				}
				//������ ���帹�� ���̵�
				public MemberBean qid(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					MemberBean bean = new MemberBean();
					try {
						con = pool.getConnection();
						sql = "SELECT id,questionCnt FROM navermember WHERE questionCnt=(SELECT MAX(questionCnt) FROM navermember)"; //���� ���帹�� ���̵�
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.next())
						bean.setId(rs.getString("id"));
						bean.setQuestionCnt(rs.getInt("questionCnt"));
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return bean;
				}
				//�亯�� ���帹�� ���̵�
				public MemberBean aid(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					MemberBean bean = new MemberBean();
					try {
						con = pool.getConnection();
						sql = "SELECT id,answerCnt FROM navermember WHERE answerCnt=(SELECT MAX(answerCnt) FROM navermember)"; //���� ���帹�� ���̵�
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.next())
						bean.setId(rs.getString("id"));
						bean.setAnswerCnt(rs.getInt("answerCnt"));
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return bean;
				}
				//��ȸ�� ���帹�� ����
				public QuestionBean hitq(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					QuestionBean bean = new QuestionBean();
					try {
						con = pool.getConnection();
						sql = "SELECT title,hits,qnum FROM in_question WHERE hits=(SELECT MAX(hits) FROM in_question)"; //���� ���帹�� ���̵�
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.next())
						bean.setTitle(rs.getString("title"));
						bean.setHits(rs.getInt("hits"));
						bean.setQnum(rs.getInt("qnum"));
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return bean;
				}
				//�������� ���� ����
				public QuestionBean pointq(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					QuestionBean bean = new QuestionBean();
					try {
						con = pool.getConnection();
						sql = "SELECT title,point,qnum FROM in_question WHERE point=(SELECT MAX(point) FROM in_question)"; //���� ���帹�� ���̵�
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.next())
						bean.setTitle(rs.getString("title"));
						bean.setPoint(rs.getInt("point"));
						bean.setQnum(rs.getInt("qnum"));
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return bean;
				}
				
				//�亯�� ���� ���� ����
				public QuestionBean answerq(){
					Connection con = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = null;
					QuestionBean bean = new QuestionBean();
					try {
						con = pool.getConnection();
						sql = "SELECT title,answer_count,qnum FROM in_question WHERE answer_count=(SELECT MAX(answer_count) FROM in_question)"; //���� ���帹�� ���̵�
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						if(rs.next())
						bean.setTitle(rs.getString("title"));
						bean.setAnswer_count(rs.getInt("answer_count"));
						bean.setQnum(rs.getInt("qnum"));
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						pool.freeConnection(con, pstmt, rs);
					}
					return bean;
				}
}
