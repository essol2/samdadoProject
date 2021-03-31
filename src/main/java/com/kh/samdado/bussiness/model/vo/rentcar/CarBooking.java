package com.kh.samdado.bussiness.model.vo.rentcar;

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

public class CarBooking {
//	BOOKING_NO	NUMBER
//	BUS_NAME	VARCHAR2(100 BYTE)
//	PAY_NAME	VARCHAR2(100 BYTE)
//	BOOKING_DATE	DATE
//	BOOKING_MODIFY	DATE
//	BOOKING_ADDRESS	VARCHAR2(100 BYTE)
//	BOOKING_PAY	VARCHAR2(20 BYTE)
//	BOOKING_NUMBER	NUMBER
//	BOOKING_PHONE	VARCHAR2(20 BYTE)
//	BOOKING_TRV	DATE
//	US_NO	VARCHAR2(15 BYTE)
//	RENT_NO2	NUMBER
//	BUS_CODE	NUMBER
	
	private int booking_no;
	private String bus_name;
	private String pay_name;
	private Date booking_date;
	private Date booking_modify;
	private String booking_address;	// db 컬럼에서 삭제
	private String booking_pay;		
	private int booking_number;		// db 컬럼에서 삭제
	private String booking_phone;
	private Date booking_trv;
	private String us_no;
	private int rent_no;			// db 컬럼명 변경해야 됨  (RENT_NO2 > RENT_NO)
	private int bus_code;
}
