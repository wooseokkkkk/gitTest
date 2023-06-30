package com.saoe.controllers.reviewController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saoe.model.review.ReviewDAO;

public class DeleteReviewCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		
		ReviewDAO dao = new ReviewDAO();
		
		int cnt = dao.deleteReview(review_no);
		
		if(cnt > 0) {
			System.out.println("리뷰 삭제 성공");
		}else {
			System.out.println("리뷰 삭제 실패");
		}
		
		response.sendRedirect("feed.jsp");
	
	}

}
