package com.kh.samdado.business.model.vo.business;

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

public class Business {
//	BUS_CODE	NUMBER
//	US_NO	VARCHAR2(15 BYTE)
//	BUS_NAME	VARCHAR2(100 BYTE)
//	BUS_ADDRESS	VARCHAR2(100 BYTE)
//	BUS_INTRO	VARCHAR2(400 BYTE)
//	BUS_DATE	DATE
//	BUS_MODIFY	DATE
//	AD_COUNT	NUMBER
//	BUS_CLASSIFY	VARCHAR2(1 BYTE)
//	BUS_CATEGORY	VARCHAR2(30 BYTE)
//	BUS_STATUS	VARCHAR2(1 BYTE)
//	BUS_PHONE	VARCHAR2(30 BYTE)
//	HOTEL_CATEGORY	VARCHAR2(10 BYTE)
//	TOUR_CATEGORY	VARCHAR2(30 BYTE)
//	TOUR_TEMA	VARCHAR2(30 BYTE)
//	AL_NO	NUMBER
	
	private int bus_code;
	private String us_no;
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
	
	private String usname; // user 테이블 조인
}
