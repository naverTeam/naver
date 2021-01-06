package in;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/naver/in/question_up")
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");
		MultipartRequest multi= new MultipartRequest(request, QuestionMgr.SAVEFOLDER,
				QuestionMgr.MAXSIZE,QuestionMgr.ENCTYPE,new DefaultFileRenamePolicy());
		//수정처리
		QuestionMgr mgr = new QuestionMgr(); 
		mgr.updateQuestion(multi);
		int qnum = Integer.parseInt(multi.getParameter("qnum"));
		response.sendRedirect("boardRead.jsp?qnum="+qnum);
		System.out.println("servlet"+qnum);
		
			 
			 
			 
}}
