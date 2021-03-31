package com.kh.samdado.bussiness.model.vo.hotel;

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

public class RoomBooking {
	
//	BOOKING_NO	NUMBER
//	BOOKING_PRODUCT	VARCHAR2(100 BYTE)
//	BOOKING_DATE	DATE
//	BOOKING_MODIFY	DATE
//	BOOKING_ADDRESS	VARCHAR2(100 BYTE)
//	BOOKING_PAY	VARCHAR2(20 BYTE)
//	BOOKING_NUMBER	NUMBER
//	BOOKING_PHONE	VARCHAR2(20 BYTE)
//	BOOKING_TRV	DATE
//	US_NO	VARCHAR2(15 BYTE)
//	HOTEL_NO	NUMBER
//	BUS_CODE	NUMBER
	
	private int booking_no;
	private String booking_product;
	private Date booking_date;
	private Date booking_modify;
	private String booking_address;	
	private String booking_pay;		
	private int booking_number;		
	private String booking_phone;
	private Date booking_trv;
	private String us_no;
	private int hotel_no;
	private int bus_code;
}
