package hok;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/hok/board/boardReply")
public class BoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		BoardMgr mgr = new BoardMgr();
		
		BoardBean reBean = new BoardBean();
		reBean.setPronum(Integer.parseInt(request.getParameter("proNum")));
		reBean.setName(request.getParameter("name"));
		reBean.setSubject(request.getParameter("subject"));
		reBean.setContent(request.getParameter("content"));
		reBean.setRef(Integer.parseInt(request.getParameter("ref")));
		reBean.setPos(Integer.parseInt(request.getParameter("pos")));
		reBean.setDepth(Integer.parseInt(request.getParameter("depth")));
		reBean.setPass(request.getParameter("pass"));
		reBean.setIp(request.getParameter("ip"));
		
		System.out.println(reBean.getRef());
		
		mgr.replyUpBoard(reBean.getRef(),reBean.getPos());
		mgr.replyBoard(reBean);
		
		String nowPage = request.getParameter("nowPage");
		String numPerPage=request.getParameter("numPerPage");
		int proNum=reBean.getPronum();
		
		response.sendRedirect("list.jsp?nowPage="+nowPage+"&numPerPage="+numPerPage+"&proNum="+proNum);
		
	}

}
