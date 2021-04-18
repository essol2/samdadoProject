package com.kh.samdado.business.model.vo.hotel;

import java.sql.Date;
import java.util.List;

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
//	room_NO	NUMBER
//	BUS_CODE	NUMBER
//	room_NAME	VARCHAR2(100 BYTE)
//	romm_PRICE	NUMBER
//	room_DATE	DATE
//	room_MODIFY	DATE
//	room_PEOPLE	VARCHAR2(10 BYTE)
//	room_AMENITY	VARCHAR2(100 BYTE)
//	room_STATE	VARCHAR2(1 BYTE)
	
//	숙박번호
//	사업장고유번호
//	숙박명
//	가격
//	등록일
//	수정일
//	인원
//	편의시설 : 주차, 조식 등등
//	Y/N 삭제여부
	
	private int room_no;
	private int bus_code;
	private String room_name;
	private String room_price;
	private Date room_date;
	private Date room_modify;
	private String room_people;
	private String room_amenity;
	private String room_state;

}
