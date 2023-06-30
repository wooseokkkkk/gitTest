package com.saoe.controllers.ajaxCont;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.saoe.model.feed.FeedDAO;
import com.saoe.model.feed.FeedDTO;
import com.saoe.model.member.SessionUserDTO;
import com.saoe.model.reply.ReplyDTO;
import com.saoe.model.review.ReviewPicDTO;

public class FeedCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int code_no = Integer.parseInt(request.getParameter("code_no"));
		
		FeedDAO feedDAO = new FeedDAO();
		
		List<FeedDTO> feedList = new ArrayList<FeedDTO>();
		
		if(code_no == 0) {
			feedList = feedDAO.selectFeed();
		}else if(code_no == 6){
			HttpSession session = request.getSession();
			SessionUserDTO member = (SessionUserDTO)session.getAttribute("member");
			
			feedList = feedDAO.selectUserFeed(member.getId());
		}else {
			feedList = feedDAO.selectCateFeed(code_no);
		}
		
		if(feedList.size() > 0) {
			JSONArray jarray = new JSONArray();
			for(FeedDTO feed : feedList) {
				JSONObject json = new JSONObject();
				json.put("id", feed.getId());
				json.put("nick", feed.getNick());
				json.put("profile", feed.getProfile());
				json.put("review_no", feed.getReview_no());
				json.put("review_content", feed.getReview_content());
				json.put("review_post_date", feed.getReview_post_date());
				json.put("review_update_date", feed.getReview_update_date());
				json.put("rest_no", feed.getRest_no());
				json.put("rest_name", feed.getRest_name());
				json.put("rest_addr", feed.getRest_addr());
				json.put("code_no", feed.getCode_no());
				json.put("main_cate", feed.getMain_cate());
				json.put("sub_cate", feed.getSub_cate());
				
				
				if(feed.getReplyList().size() > 0) {
					List<ReplyDTO> repList = feed.getReplyList();
					JSONArray replyList = new JSONArray();					
					for(ReplyDTO reply : repList) {
						JSONObject rep = new JSONObject();
						rep.put("reply_no", reply.getReply_no());
						rep.put("review_no", reply.getReview_no());
						rep.put("reply_date", reply.getReply_date());
						rep.put("id", reply.getId());
						rep.put("reply_content", reply.getReply_content());
						rep.put("parent_no", reply.getParent_no());
						
						replyList.add(rep);
					}
					json.put("replyList", replyList);
				
				}
				if(feed.getReviewPicList().size() > 0) {
					List<ReviewPicDTO> picList = feed.getReviewPicList();
					JSONArray reviewPicList = new JSONArray();
					for(ReviewPicDTO reviewPic : picList) {
						JSONObject pic = new JSONObject();
						pic.put("review_pic_no", reviewPic.getReview_pic_no());
						pic.put("review_no", reviewPic.getReview_no());
						pic.put("review_pic_src", reviewPic.getReview_pic_src());
						pic.put("review_pic_size", reviewPic.getReview_pic_size());
						
						reviewPicList.add(pic);
						
					}
					json.put("reviewPicList", reviewPicList);
					
				}
				
				jarray.add(json);
			}
			
			response.setCharacterEncoding("utf-8");
			System.out.println(jarray.toJSONString());
			response.getWriter().print(jarray);
		}
		
		
		
		
		
		
	}

}
