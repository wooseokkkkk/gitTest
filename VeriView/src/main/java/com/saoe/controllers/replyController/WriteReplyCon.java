package com.saoe.controllers.replyController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saoe.model.member.MemberDTO;
import com.saoe.model.member.SessionUserDTO;
import com.saoe.model.reply.ReplyDAO;
import com.saoe.model.reply.ReplyDTO;

@WebServlet("/WriteReplyCon")
public class WriteReplyCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		SessionUserDTO member = (SessionUserDTO)session.getAttribute("member");
		String id = member.getId();
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		String reply_content = request.getParameter("reply_content");
		
		
		ReplyDTO reply = new ReplyDTO(review_no, id, reply_content);
		if(request.getParameter("parent_no") != null) {
			int parent_no = Integer.parseInt(request.getParameter("parent_no"));
			reply.setParent_no(parent_no);
		}
		
		int cnt = new ReplyDAO().writeReply(reply);
		
		if(cnt > 0) {
			System.out.println("댓글 작성 성공");
		}else {
			System.out.println("댓글 작성 실패");
		}
		
		response.sendRedirect("feed.jsp");
		
	
	}

}
