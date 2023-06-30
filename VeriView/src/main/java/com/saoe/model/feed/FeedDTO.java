package com.saoe.model.feed;

import java.util.List;

import com.saoe.model.member.MemberDTO;
import com.saoe.model.reply.ReplyDTO;
import com.saoe.model.review.ReviewPicDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class FeedDTO {

	// 게시자 테이블에서 게시자의 닉네임과 프로필사진을 가져옴
	private String id;
	private String nick;
	private String profile;
	
	// 리뷰 데이터를 담음
	private int review_no;
	private String review_content;
	private String review_post_date;
	private String review_update_date;
	
	// 리뷰한 식당을 담음
	private int rest_no;
	private String rest_name;
	private String rest_addr;

	// 리뷰한 식당의 카테고리를 담음
	private int code_no;
	private String main_cate;
	private String sub_cate;
	
	private List<ReplyDTO> replyList;
	private List<ReviewPicDTO> reviewPicList;

}
