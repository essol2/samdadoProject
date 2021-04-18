package com.kh.samdado.common.model.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.kh.samdado.mypage.model.vo.QnA;

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
public class Income {
	
//	PAY_NO	NUMBER              결제번호
//	ITEM	VARCHAR2(30 BYTE)   결제 아이템
//	AMOUNT	NUMBER              결제 OR 포인트 금액
//	PDATE	DATE                결제 날짜
//	EXDATE	DATE			        배너 제외 프리미엄 광고 만기일
//	US_NO	VARCHAR2(15 BYTE)   회원번호
	
	private int payno;
	private String item;
	private int amount;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date pdate;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date exdate;
	private String usno;
 
	private int primonth;

	private String usname; 			// user 테이블 조인 후 추가 컬럼
	private String bus_category;    // business 테이블 조인 후 추가 컬럼
	private int bus_code;           // business 테이블 조인 후 추가 컬럼

	
	private String ptodate;	        // 관리자 서치 날짜 포멧팅을 위한 컬럼
	private String pextodate;	    // 관리자 서치 날짜 포멧팅을 위한 컬럼
	

}
