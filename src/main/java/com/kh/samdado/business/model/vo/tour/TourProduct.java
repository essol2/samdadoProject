package com.kh.samdado.business.model.vo.tour;

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
public class TourProduct {
	
	private int pro_no;			// 상품번호
	private int bus_code;		// 사업장고유번호
	private String pro_name;	// 상품이름
	private String pro_price;	// 상품가격
	private String pro_adult;
	private String pro_youth;
	private String pro_child;
	private String pro_fac;
}
