package com.kh.samdado.business.model.vo.hotel;

import java.sql.Date;

import org.springframework.security.access.annotation.Secured;

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

public class Room {
//	HOTEL_NO	NUMBER
//	BUS_CODE	NUMBER
//	HOTEL_NAME	VARCHAR2(100 BYTE)
//	HOTER_PRICE	NUMBER
//	HOTEL_DATE	DATE
//	HOTEL_MODIFY	DATE
//	HOTEL_PEOPLE	VARCHAR2(10 BYTE)
//	HOTEL_AMENITY	VARCHAR2(100 BYTE)
//	HOTEL_STATE	VARCHAR2(1 BYTE)
	
//	숙박번호
//	사업장고유번호
//	숙박명
//	가격
//	등록일
//	수정일
//	인원
//	편의시설 : 주차, 조식 등등
//	Y/N 삭제여부
	
	private int hotel_no;
	private int bus_code;
	private String hotel_name;
	private int hotel_price;
	private Date hotel_date;
	private Date hotel_modify;
	private String hotel_people;
	private String hotel_amenity;
	private String hotel_state;
}
