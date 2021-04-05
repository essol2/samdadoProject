package com.kh.samdado.mypage.model.vo;

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
public class AccountBook {
//  ACC_NO
//	US_NO	VARCHAR2(15 BYTE)
//	ACC_TRIPD	DATE
//	ACC_NAME	VARCHAR2(200 BYTE)
//	ACC_CLASSIFY	VARCHAR2(200 BYTE)
//	ACC_WON	NUMBER
//	ACC_WRITED	DATE
//	ACC_DUTCH	VARCHAR2(10 BYTE)
//	ACC_ONEWON	NUMBER
//	ACC_ACCOMPANY	NUMBER
//	ACC_FINWON	NUMBER
//  ACC_PSTATUS	VARCHAR2(5 BYTE)
	
	private int accno;
	private String usno;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date accTripDate;
	private String accName;
	private String accClassify;
	private int accWon;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date accWrited;
	private String accDutch;
	private int accOneWon;
	private int accAccompany;
	private int accFinWon;
	private String accPstatus;
	private Date searchDate;
}
