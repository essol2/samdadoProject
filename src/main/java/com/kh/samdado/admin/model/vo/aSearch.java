package com.kh.samdado.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class aSearch {
	
	private String searchCondition;	// 검색 조건
	private String searchValue;		// 검색 값
	private String existFile;		// 검색 첨부 파일

}
