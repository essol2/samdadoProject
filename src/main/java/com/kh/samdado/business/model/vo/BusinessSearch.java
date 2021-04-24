package com.kh.samdado.business.model.vo;

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
public class BusinessSearch {
	
	private int searchKind;		// 검색 업장종류(호텔:1, 관광지:2, 음식점:3, 렌트카:4)
	private String searchValue;		// 검색 값
	

}