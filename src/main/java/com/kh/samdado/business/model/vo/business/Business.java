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
	private String file_rename;  // 비즈니스 첨부파일경로 join
	private String file_lv;
	private String usname; // user 테이블 조인
	// 관광지리스트 조인
	private String pro_name;	// 상품이름
	private String pro_price;	// 상품가격
	private String pro_adult;
	private String pro_youth;
	private String pro_child;
	// 차 조인
	private String car_name;
	private String car_type;
	private String car_producer;
	private String car_fuel;
	private String car_price;
	// 방 조인
	private String room_name;
	private int room_price;
	private String room_people;
	private String room_amenity;
	
	// 파일 한번에 리스트로 담기위한 객체속성!
	private String file_root;	// 파일경로
	private String file_name;	// 파일명

}
