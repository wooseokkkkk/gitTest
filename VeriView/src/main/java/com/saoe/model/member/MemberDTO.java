package com.saoe.model.member;

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

public class MemberDTO {
	
	@NonNull private String id;
	@NonNull private String pw;
	private String name;
	private String nick;
	private String tel;
	private String addr;
	private String birth;
	private String gender;
	private String profile;
	private String profile_message;
	private String join_date;
	private int member_score;
	private String grade;

}


