package com.saoe.model.review;

import java.util.List;

import com.saoe.model.reply.ReplyDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class ReviewDTO {
	
	// 게시글 테이블에서 가져옴
	private int review_no;
	@NonNull private String id;
	private String foreign_review_url = "";
	@NonNull private int rest_no;
	@NonNull private String review_content;
	private int review_score;
	private int review_display;
	private String review_post_date;
	private String review_update_date;
	
	// 리뷰 댓글을 담음
	private List<ReplyDTO> replyList;
	
	// 리뷰 사진을 담음
	private List<ReviewPicDTO> reviewPicList;
	
}
