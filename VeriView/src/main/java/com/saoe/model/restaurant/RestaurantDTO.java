package com.saoe.model.restaurant;

import java.util.List;

import com.saoe.model.category.CategoryDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class RestaurantDTO {
	
	private int rest_no;
	private int code_no;
	private String rest_name;
	private String rest_profile;
	private String rest_tel;
	private String rest_addr;
	private String rest_addr2;
	private float rest_naver_score;
	private float rest_kakao_score;
	private float rest_google_score;
	private float rest_score;
	private String rest_post_date;

	private String main_cate;
	private String sub_cate;
	
	
	// 음식점 사진 테이블에서 사진들을 가져옴
	private List<RestPicDTO> restPicList;
	
	
	
	

}
