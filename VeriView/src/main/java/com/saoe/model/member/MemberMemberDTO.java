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

public class MemberMemberDTO {
	
	@NonNull private String id;
	@NonNull private String actor_id;
	private int member_follow_yn;
	private int member_block_yn;
	private int member_rep_yn;
	private String member_follow_date;
	private String member_block_date;
	private String member_rep_date;	

}
