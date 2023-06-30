package com.saoe.controllers.reviewController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saoe.model.feed.FeedDAO;
import com.saoe.model.feed.FeedDTO;

public class CateFeedCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		int code_no = Integer.parseInt(request.getParameter("code_no"));
		
		System.out.println(code_no);
		
		FeedDAO feedDAO = new FeedDAO();
		List<FeedDTO> feedList = feedDAO.selectCateFeed(code_no);
		
		for(FeedDTO feed : feedList) {
			System.out.println(feed.getRest_name());
		}
		
		
		
	}

}
