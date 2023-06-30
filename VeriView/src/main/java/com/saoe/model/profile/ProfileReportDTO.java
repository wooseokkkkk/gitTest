package com.saoe.model.profile;

import lombok.Getter;

@Getter

public class ProfileReportDTO {
	
	// 회원 테이블에서 회원의 닉네임과 프로필 정보를 가져옴
	private String id;
	private String nick;
	private String profile;
	private String member_rep_content;

}
