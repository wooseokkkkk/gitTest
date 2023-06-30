package com.saoe.controllers.messageController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saoe.model.member.MemberDTO;
import com.saoe.model.member.SessionUserDTO;
import com.saoe.model.message.MessageDAO;
import com.saoe.model.message.MessageDTO;

public class WriteMessageCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		SessionUserDTO member= (SessionUserDTO)session.getAttribute("member");
		
		String send_id = member.getId();
		String receive_id = request.getParameter("receive_id");
		String message_content = request.getParameter("message_content");
		
		MessageDTO msg = new MessageDTO(send_id, receive_id, message_content);

		if(request.getParameter("review_no") != null) {
			int review_no = Integer.parseInt(request.getParameter("review_no"));
			msg.setReview_no(review_no);
		}		
		
		MessageDAO dao = new MessageDAO();
		
		int cnt = dao.sendMessage(msg);
		
		if(cnt > 0) {
			System.out.println("쪽지 보내기 성공");
		}else {
			System.out.println("쪽지 보내기 실패");			
		}
		
		response.sendRedirect("messageMain.jsp");
	
	}

}
