package com.saoe.controllers.reviewController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saoe.model.member.MemberDTO;
import com.saoe.model.member.SessionUserDTO;
import com.saoe.model.review.ReviewDAO;
import com.saoe.model.review.ReviewDTO;
import com.saoe.model.member.ReviewMemberDTO;

public class ScrapReviewCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		SessionUserDTO member = (SessionUserDTO)session.getAttribute("member");
		String id = member.getId();
		
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		int state = Integer.parseInt(request.getParameter("state"));
		
		ReviewMemberDTO reviewMember = new ReviewMemberDTO(review_no, id);
		reviewMember.setReview_scrap_yn(state);
		
		int cnt = new ReviewDAO().scrapReview(reviewMember);
		
		
		if(cnt > 0) {
			System.out.println("리뷰 스크랩 성공");
		}else {
			System.out.println("리뷰 스크랩 실패");			
		}
		
		response.sendRedirect("feed.jsp");
	}

}
