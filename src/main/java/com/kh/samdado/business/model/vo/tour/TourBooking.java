package com.kh.samdado.business.model.vo.tour;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
//@Data
public class TourBooking {
	
	private int booking_no;			// 예약번호
	private String bus_name;		// 사업장이름
	private String pay_name;		// 상품이름
	private Date booking_date;		// 예약등록일
	private Date booking_modify;	// 수정일
	private String booking_address;	// 주소
	private String booking_pay;		// 금액
	private int booking_number;		// 인원
	private String booking_phone;	// 전화번호
	private Date booking_trv;		// 여행날짜
	private String us_no;			// 회원번호
	private String pro_no;			// 상품번호
	private int bus_code;			// 사업장고유번호
}
