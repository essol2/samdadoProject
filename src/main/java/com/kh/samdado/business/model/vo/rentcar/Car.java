package com.kh.samdado.business.model.vo.rentcar;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
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
@Builder

public class Car {
//	CAR_NO	NUMBER
//	BUS_CODE	NUMBER
//	CAR_NAME	VARCHAR2(100 BYTE)
//	CAR_TYPE	VARCHAR2(100 BYTE)
//	CAR_PORDUCER	VARCHAR2(400 BYTE)
//	CAR_FUEL	VARCHAR2(20 BYTE)
//	CAR_PRICE	VARCHAR2(50 BYTE)
//	CAR_DATE	DATE
//	CAR_MODIFY	DATE
	
	
	private int car_no;
	private int bus_code;
	private String car_name;
	private String car_type;
	private String car_producer;
	private String car_fuel;
	private String car_price;
	private Date car_date;
	private Date car_modify;
	
	private List<Car> carList;
}
