package com.saoe.controllers.memberController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saoe.model.member.InterestDAO;
import com.saoe.model.member.InterestDTO;

public class InsertInter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String[] inter = request.getParameterValues("inter");
		
		List<InterestDTO> interList = new ArrayList<InterestDTO>();
		
		for(int i = 0; i < inter.length; i++) {
			System.out.println(id+Integer.parseInt(inter[i]) );
			interList.add(new InterestDTO(id, Integer.parseInt(inter[i])));
		}
		
		InterestDAO dao = new InterestDAO();
		int cnt = dao.insertInter(interList);
		
		if(cnt > 0) {
			System.out.println("관심사 등록 성공");
		}else {
			System.out.println("관심사 등록 실패");
		}
		
		response.sendRedirect("feed.jsp");
		
	
	}

}
