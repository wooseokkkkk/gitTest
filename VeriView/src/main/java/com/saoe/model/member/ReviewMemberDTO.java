package com.saoe.model.member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter

public class ReviewMemberDTO {
	
	@NonNull private int review_no;
	@NonNull private String actor_id;
	private int review_gb;
	private int review_scrap_yn;
	private int review_block_yn;
	private int review_rep_yn;
	private String review_rep_content;

}
