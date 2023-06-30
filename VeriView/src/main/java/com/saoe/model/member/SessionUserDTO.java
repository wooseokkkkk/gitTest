package com.saoe.model.member;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class SessionUserDTO {
	
	private String id;
	private String name;
	private String nick;
	private String profile;
	private String profile_message;
	
	private List<MemberMemberDTO> memberMemberList;
	private List<ReviewMemberDTO> reviewMemberList;
	private List<RestMemberDTO> restMemberList;

}
