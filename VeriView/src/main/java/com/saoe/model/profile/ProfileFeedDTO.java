package com.saoe.model.profile;

import lombok.Getter;

@Getter

public class ProfileFeedDTO {
	
	// 간단한 리뷰 데이터를 담음
	private int review_no;
	private String review_content;
	private String review_post_date;
	
	// 리뷰 사진 한장만 담음
	private String review_pic_src;
	
	// 리뷰한 식당의 이름을 담음
	private int rest_no;
	private String rest_name;
	
	private String member_rep_content;

}
