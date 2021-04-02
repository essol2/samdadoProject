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
public class RouteDetail {
	
	private int detail_no;	// 한 루트 안에서의 여행지 순서
	private int route_no;	// 루트 번호
	private int spot_no;	// 여행지 번호
	private int bus_code;	// 사업장 고유 번호
}
