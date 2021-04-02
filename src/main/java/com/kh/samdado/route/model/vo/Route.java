package com.kh.samdado.route.model.vo;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
//@Data
public class Route {
	
	private int or_no;	// 기본으로 추천해 주는 루트 번호
	private int spot_no;	// 여행지 번호
	
}
