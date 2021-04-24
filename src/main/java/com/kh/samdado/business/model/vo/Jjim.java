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

/*
 *  JJIM_NO	VARCHAR2(10 BYTE)
	JJIM_DATE	DATE
	JJIM_STATUS	VARCHAR2(1 BYTE)
	BUS_CODE	NUMBER
	US_NO	VARCHAR2(15 BYTE)
 * */
public class Jjim {
	private String jjim_no;		// 찜시퀀스번호
	private	Date jjim_date;		// 찜한날짜
	private String jjim_status;	// 찜 상태
	private int bus_code;		// 사업장고유번호
	private String us_no;		// 회원번호
	
	//BUSINESS JOIN
	private String bus_name;
	private String bus_address;
	private String bus_intro;
	private Date bus_date;
	private Date bus_modify;
	private int ad_count;
	private String bus_classify;
	private String bus_category;
	private String bus_status;
	private String bus_phone;
	private String res_category;
	private String hotel_category;
	private String tour_category;
	private String tour_tema;
	private int al_no;
	private String bus_opening;
	private String hotel_facility;
	private String usname; // user 테이블 조인
	
	//BUSINNESS_ATT JOINs
	private String file_rename;	// 리네임
	private String file_lv;		// 대표사진lv=0 / 일반사진lv=1
}
