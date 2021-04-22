package com.kh.samdado.business.model.vo;

import java.sql.Date;

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
public class Jjim {
	private String jjim_no;		// 찜시퀀스번호
	private	Date jjim_date;		// 찜한날짜
	private String jjim_status;	// 찜 상태
	private int bus_code;		// 사업장고유번호
	private String us_no;		// 회원번호
	
}
