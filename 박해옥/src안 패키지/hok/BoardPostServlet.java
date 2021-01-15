package hok;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/hok/board/boardPost")
public class BoardPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		
		BoardMgr mgr = new BoardMgr();
		
		
		MultipartRequest multi=
				new MultipartRequest(request,BoardMgr.SAVEFOLDER,
						BoardMgr.MAXSIZE, BoardMgr.ENCTYPE,
						new DefaultFileRenamePolicy());
		
		mgr.insertBoard(multi);
		
		
		PrintWriter out = response.getWriter();
		String proNum=multi.getParameter("proNum");
		out.println(proNum);
		
		response.sendRedirect("list.jsp?proNum="+proNum);
		
	}

}
