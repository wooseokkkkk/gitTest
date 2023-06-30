package com.saoe.model.category;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class CategoryDTO {
	
	private int code_no;
	private String main_cate;
	private String sub_cate;
	private List<CategoryDTO> sub_cateList;

}
