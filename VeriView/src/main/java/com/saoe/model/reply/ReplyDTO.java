package com.saoe.model.reply;

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


public class ReplyDTO {
	
	// 댓글 테이블에서 가져옴
	private int reply_no;
	@NonNull private int review_no;
	private String reply_date;
	@NonNull private String id;
	@NonNull private String reply_content;
	private int parent_no;	

}
