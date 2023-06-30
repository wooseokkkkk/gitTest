package com.saoe.controllers.memberController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;

import com.saoe.model.member.InterestDAO;
import com.saoe.model.member.InterestDTO;
import com.saoe.model.member.MemberDAO;
import com.saoe.model.member.MemberDTO;
import com.saoe.model.member.SessionUserDTO;

public class UpdateMemberCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String profile_message = request.getParameter("profile_message");
		String[] inter = request.getParameterValues("inter");
		
		HttpSession session = request.getSession();
		SessionUserDTO member = (SessionUserDTO)session.getAttribute("member");
		
		MemberDTO updateMember = new MemberDTO(member.getId(), pw);
		updateMember.setTel(tel);
		updateMember.setAddr(addr);
		updateMember.setProfile_message(profile_message);
		
		List<InterestDTO> interList = new ArrayList<InterestDTO>();

		for(int i = 0; i < inter.length; i++) {
			interList.add(new InterestDTO(member.getId(), Integer.parseInt(inter[i])));
		}
		
		MemberDAO m_dao = new MemberDAO();
		int cnt = m_dao.updateMember(updateMember);
		
		if(cnt > 0) {
			System.out.println("회원 정보 수정 성공");
		}else {
			System.out.println("회원 정보 수정 실패");			
		}
		
		InterestDAO i_dao = new InterestDAO();
		cnt = i_dao.updateInter(interList, member.getId());
		
		if(cnt > 0) {
			System.out.println("회원 관심사 수정 성공");
		}else {
			System.out.println("회원 관심사 수정 실패");			
		}
		
		
		response.sendRedirect("updateMember.jsp");
		
	
	}

}
