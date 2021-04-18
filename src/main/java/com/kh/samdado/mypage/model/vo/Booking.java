package com.kh.samdado.mypage.model.vo;

import java.sql.Date;

import com.kh.samdado.business.model.vo.rentcar.CarBooking;

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
public class Booking {
/*
 * Car
BOOKING_NO	NUMBER
BUS_NAME	VARCHAR2(100 BYTE)
PAY_NAME	VARCHAR2(100 BYTE)
BOOKING_DATE	DATE
BOOKING_MODIFY	DATE
BOOKING_ADDRESS	VARCHAR2(100 BYTE)
BOOKING_PAY	VARCHAR2(20 BYTE)
BOOKING_NUMBER	NUMBER
BOOKING_PHONE	VARCHAR2(20 BYTE)
BOOKING_TRV	DATE
US_NO	VARCHAR2(15 BYTE)
RENT_NO2	NUMBER
BUS_CODE	NUMBER

 * Room
BOOKING_NO	NUMBER
BOOKING_PRODUCT	VARCHAR2(100 BYTE)
BOOKING_DATE	DATE
BOOKING_MODIFY	DATE
BOOKING_ADDRESS	VARCHAR2(100 BYTE)
BOOKING_PAY	VARCHAR2(20 BYTE)
BOOKING_NUMBER	NUMBER
BOOKING_PHONE	VARCHAR2(20 BYTE)
BOOKING_TRV	DATE
US_NO	VARCHAR2(15 BYTE)
HOTEL_NO	NUMBER
BUS_CODE	NUMBER

 * Tour
BOOKING_NO	NUMBER
BUS_NAME	VARCHAR2(100 BYTE)
PAY_NAME	VARCHAR2(100 BYTE)
BOOKING_DATE	DATE
BOOKING_MODIFY	DATE
BOOKING_ADDRESS	VARCHAR2(100 BYTE)
BOOKING_PAY	VARCHAR2(20 BYTE)
BOOKING_NUMBER	NUMBER
BOOKING_PHONE	VARCHAR2(20 BYTE)
BOOKING_TRV	DATE
US_NO	VARCHAR2(15 BYTE)
PRO_NO	VARCHAR2(30 BYTE)
BUS_CODE	NUMBER
 * */
	
	private String usno;
	private int bookingLv;	// 예약종류(호텔:1/투어:2/렌트카:3)
	
	private int c_booking_no;
	private String c_bus_name;
	private String c_booking_product;
	private Date c_booking_date;
	private Date c_booking_modify;
	private String c_booking_address;	
	private String c_booking_pay;		
	private int c_booking_number;		
	private String c_booking_phone;
	private Date c_booking_trv;	
	private int rent_no;			
	private int c_bus_code;
	
	private int r_booking_no;
	private String r_bus_name;
	private String r_booking_product;
	private Date r_booking_date;
	private Date r_booking_modify;
	private String r_booking_address;	
	private String r_booking_pay;		
	private int r_booking_number;		
	private String r_booking_phone;
	private Date r_booking_trv;
	private int room_no;
	private int r_bus_code;
	
	private int t_booking_no;			// 예약번호
	private String t_bus_name;			// 사업장이름
	private String t_booking_product;	// 상품이름
	private Date t_booking_date;		// 예약등록일
	private Date t_booking_modify;		// 수정일
	private String t_booking_address;	// 주소
	private String t_booking_pay;		// 금액
	private int t_booking_number;		// 인원
	private String t_booking_phone;		// 전화번호
	private Date t_booking_trv;			// 여행날짜	
	private String pro_no;				// 상품번호
	private int t_bus_code;				// 사업장고유번호
	
}
