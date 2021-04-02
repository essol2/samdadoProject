package com.kh.samdado.route.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
public class RouteFinal {
	private int route_no; 		// 루트 번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date route_date;	// 루트 날짜
	private int route_price;	// 총 예상 예산
	private String us_no;		// 회원 번호
	
}
