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

public class ReportMemberCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String member_rep_content = request.getParameter("member_rep_content");
		
		HttpSession session = request.getSession();
		SessionUserDTO member = (SessionUserDTO)session.getAttribute("member");
		
		MemberMemberDTO memberMember = new MemberMemberDTO();
		memberMember.setId(id);
		memberMember.setActor_id(member.getId());
		memberMember.setMember_rep_yn(1);
		memberMember.setMember_rep_content(member_rep_content);
		System.out.println(1111111);
		MemberDAO dao = new MemberDAO();
		
		int cnt = dao.reportMember(memberMember);
		
		if(cnt > 0) {
			System.out.println("회원 신고 성공");
		}else {
			System.out.println("회원 신고 실패");			
		}
		
		response.sendRedirect("profile.jsp?id="+id);
	
	}

}
