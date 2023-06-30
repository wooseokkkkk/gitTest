package com.saoe.controllers.memberController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saoe.model.member.MemberDAO;
import com.saoe.model.member.MemberDTO;
import com.saoe.model.member.MemberMemberDTO;
import com.saoe.model.member.SessionUserDTO;

public class BlockMemberCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		int state = Integer.parseInt(request.getParameter("state"));

		HttpSession session = request.getSession();
		SessionUserDTO member = (SessionUserDTO) session.getAttribute("member");

		MemberMemberDTO memberMember = new MemberMemberDTO();
		memberMember.setId(id);
		memberMember.setActor_id(member.getId());
		memberMember.setMember_block_yn(state);

		MemberDAO dao = new MemberDAO();

		int cnt = dao.blockMember(memberMember);

		if (cnt > 0) {
			System.out.println("회원 차단 성공");
		} else {
			System.out.println("회원 차단 실패");
		}

		response.sendRedirect("profile.jsp?id="+id);
	}

}
