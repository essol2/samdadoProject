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

public class Rentcar {
//	RENT_NO	NUMBER
//	BUS_CODE	NUMBER
//	RENT_NAME	VARCHAR2(100 BYTE)
//	RENT_ADDRESS	VARCHAR2(100 BYTE)
//	RENT_INTRO	VARCHAR2(400 BYTE)
//	RENT_FUEL	VARCHAR2(20 BYTE)
//	RENT_PRICE	VARCHAR2(50 BYTE)
//	RENT_DATE	DATE
//	RENT_MODIFY	DATE
	
	private int rent_no;
	private int bus_code;
	private String rent_name;
	private String rent_address;
	private String rent_intro;
	private String rent_fuel;
	private String rent_price;
	private Date rent_date;
	private Date rent_modify;
}
