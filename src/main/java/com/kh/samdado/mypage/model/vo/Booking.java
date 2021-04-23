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
C_BOOKING_NO	NUMBER
C_BUS_NAME	VARCHAR2(100 BYTE)
C_PRODUCT_NAME	VARCHAR2(100 BYTE)
C_BOOKING_DATE	DATE
C_BOOKING_MODIFY	DATE
C_BOOKING_ADDRESS	VARCHAR2(100 BYTE)
C_BOOKING_PAY	VARCHAR2(20 BYTE)
C_BOOKING_NUMBER	NUMBER
C_BOOKING_PHONE	VARCHAR2(20 BYTE)
C_TOUR_DATE	DATE
US_NO	VARCHAR2(15 BYTE)
RENT_NO	NUMBER
BUS_CODE	NUMBER

 * Room
R_BOOKING_NO	NUMBER
R_PRODUCT_NAME	VARCHAR2(100 BYTE)
R_BOOKING_DATE	DATE
R_BOOKING_MODIFY	DATE
R_BOOKING_ADDRESS	VARCHAR2(1000 BYTE)
R_BOOKING_PAY	VARCHAR2(20 BYTE)
R_BOOKING_NUMBER	NUMBER
R_BOOKING_PHONE	VARCHAR2(20 BYTE)
R_TOUR_DATE	DATE
US_NO	VARCHAR2(15 BYTE)
HOTEL_NO	NUMBER
BUS_CODE	NUMBER
BUS_NAME	VARCHAR2(100 BYTE)

 * Tour
T_BOOKING_NO	NUMBER
T_BUS_NAME	VARCHAR2(100 BYTE)
T_PRODUCT_NAME	VARCHAR2(100 BYTE)
T_BOOKING_DATE	DATE
T_BOOKING_MODIFY	DATE
T_BOOKING_ADDRESS	VARCHAR2(1000 BYTE)
T_BOOKING_PAY	VARCHAR2(20 BYTE)
T_BOOKING_NUMBER	NUMBER
T_BOOKING_PHONE	VARCHAR2(20 BYTE)
T_TOUR_DATE	DATE
US_NO	VARCHAR2(15 BYTE)
PRO_NO	VARCHAR2(30 BYTE)
BUS_CODE	NUMBER
 * */
	
	private String usno;
	private int bookingLv;	// 예약종류(호텔:1/투어:2/렌트카:3)
	private int bus_code;	// 한번에 퉁쳐서 사용하기
	private String category;

	
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
	private Date r_booking_trvEnd;
	
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
	private int pro_no;					// 상품번호
	private int t_bus_code;				// 사업장고유번호
	
	private String file_no;
	private String file_name;
	private String file_root;
	private String file_status;
	private String file_rename;
	private String file_lv;
	
	// review 썼나 확인
	private String r_review_check;
	private String c_review_check;
	private String t_review_check;
}
