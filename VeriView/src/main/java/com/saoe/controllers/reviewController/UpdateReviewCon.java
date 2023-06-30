package com.saoe.controllers.reviewController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saoe.model.review.ReviewDAO;
import com.saoe.model.review.ReviewDTO;

public class UpdateReviewCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		String review_content = request.getParameter("review_content");
		
		ReviewDTO review = new ReviewDTO();
		
		review.setReview_no(review_no);
		review.setReview_content(review_content);
		
		int cnt = new ReviewDAO().updateReview(review);
		
		String moveURL = "feed.jsp";
		
		if(cnt > 0) {
			System.out.println("리뷰 수정 성공");
		}else {
			System.out.println("리뷰 수정 실패");
		}
		
		response.sendRedirect(moveURL);
	
	}

}
