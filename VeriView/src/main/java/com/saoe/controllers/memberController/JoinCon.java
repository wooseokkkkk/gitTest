package com.saoe.controllers.memberController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saoe.model.member.MemberDAO;
import com.saoe.model.member.MemberDTO;

@WebServlet("/JoinCon")
public class JoinCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		
		System.out.println(id+pw+name+nick+tel+addr+birth+gender);
		
		MemberDTO dto = new MemberDTO(id, pw, name, nick, tel, addr, birth, gender, "./file/member/profile.png", "", "0", 0 , "0");
		
		MemberDAO dao = new MemberDAO();
		
		int cnt = dao.join(dto);
		
		if(cnt > 0) {
			System.out.println("가입성공");
		}else {
			System.out.println("가입실패");
		}
		
		response.sendRedirect("welcome.jsp?id="+id);
		
		
	
	}

}
