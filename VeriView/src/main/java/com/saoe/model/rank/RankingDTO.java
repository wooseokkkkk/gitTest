package com.saoe.model.rank;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class RankingDTO {
	
	private String id;
	private String nick;
	private String profile;
	private int member_score;
	private int grade;

}
