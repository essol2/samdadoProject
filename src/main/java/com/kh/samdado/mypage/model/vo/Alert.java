package com.kh.samdado.mypage.model.vo;

import java.sql.Date;

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
public class Alert {
	/*
	 * QnA
	QNA_NO	NUMBER
	QCONT	VARCHAR2(1500 BYTE)
	QDATE	DATE
	QREPLY	VARCHAR2(100 BYTE)
	QSTATUS	CHAR(1 BYTE)
	US_NO	VARCHAR2(15 BYTE)
	CHECK_NEWS	VARCHAR2(10 BYTE)
	
	* 광고
	AL_NO	NUMBER
	AL_INTRO	VARCHAR2(300 BYTE)
	AL_SUBDATE	DATE
	ALSTATUS	VARCHAR2(5 BYTE)
	START_DATE	DATE
	A_IMG_PATH	VARCHAR2(50 BYTE)
	A_IMG_NAME	VARCHAR2(50 BYTE)
	A_IMG_CNAME	VARCHAR2(50 BYTE)
	A_MASSAGE	VARCHAR2(100 BYTE)
	US_NO	VARCHAR2(15 BYTE)
	BUS_CODE	NUMBER
	CHECK_NEWS	VARCHAR2(10 BYTE)
	
	* 포인트
	PNO	NUMBER
	PDATE	DATE
	PDETAIL	VARCHAR2(300 BYTE)
	PBALANCE	NUMBER
	PAMOUNT	NUMBER
	US_NO	VARCHAR2(15 BYTE)
	CHECK_NEWS	VARCHAR2(10 BYTE)
	
	* 결제
	PAY_NO	NUMBER
	ITEM	VARCHAR2(30 BYTE)
	AMOUNT	VARCHAR2(30 BYTE)
	PDATE	DATE
	
	*신고
	REPORT_NO	NUMBER
	REP_RES	VARCHAR2(30 BYTE)
	REP_CONT	VARCHAR2(50 BYTE)
	RDATE	DATE
	RSTATUS	CHAR(1 BYTE)
	REXDATE	DATE
	R_IMG_PATH	VARCHAR2(200 BYTE)
	R_IMG_NAME	VARCHAR2(100 BYTE)
	R_IMG_CNAME	VARCHAR2(100 BYTE)
	US_NO	VARCHAR2(15 BYTE)
	R_COUNT	NUMBER
	REF_BUS_CODE	NUMBER
	CHECK_NEWS	VARCHAR2(10 BYTE)
	
	* ALERT
	NNO	NUMBER
	US_NO	NUMBER
	NTITLE	VARCHAR2(1000 BYTE)
	NSTATUS	VARCHAR2(5 BYTE)
	NCATE	VARCHAR2(10 BYTE)
	NKEYNO	NUMBER
	
	* Business
	BUS_CODE	NUMBER
	US_NO	VARCHAR2(15 BYTE)
	BUS_NAME	VARCHAR2(100 BYTE)
	BUS_ADDRESS	VARCHAR2(100 BYTE)
	BUS_INTRO	VARCHAR2(400 BYTE)
	BUS_DATE	DATE
	BUS_MODIFY	DATE
	AD_COUNT	NUMBER
	BUS_CLASSIFY	VARCHAR2(1 BYTE)
	BUS_CATEGORY	VARCHAR2(30 BYTE)
	BUS_STATUS	VARCHAR2(1 BYTE)
	BUS_PHONE	VARCHAR2(30 BYTE)
	HOTEL_CATEGORY	VARCHAR2(10 BYTE)
	TOUR_CATEGORY	VARCHAR2(30 BYTE)
	TOUR_TEMA	VARCHAR2(30 BYTE)
	AL_NO	NUMBER
	BUS_OPENING	VARCHAR2(50 BYTE)
	RES_CATEGORY	VARCHAR2(30 BYTE)
	*/
	
	private int nno;
	private String usno;
	private String ntitle;
	private String nstatus;
	private String ncate;
	private int nkeyno;
	private Date ndate;

	
	private int qno;
	private String qcont;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date qdate;
	private String qreply;
	private char qstatus;
	private int alno;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date alSubDate;
	private String alstatus;
	private Date alStartDate;
	private String almessage;
	private int bus_code;
	private int pno;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date podate;
	private String pdetail;
	private int pbalance;
	private String poamount;
	private int payno;
	private String item;
	private String amount;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date pdate;
	private int reno;
	private String repres;
	private String repcont;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date rdate;
	private char rstatus;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date rexdate;
	private String rimgcname;
	private int rcount;
	private String bus_name;
	
	/*
	 *  BNO	NUMBER
		BTITLE	VARCHAR2(100 BYTE)
		BDATE	DATE
		BCONTENT	VARCHAR2(300 BYTE)
		BSTATUS	VARCHAR2(5 BYTE)
		US_NO	VARCHAR2(15 BYTE)
		US_PART	VARCHAR2(15 BYTE)
	 * */
	private int bno;
	private String btitle;
	private Date bdate;
	private String bcontent;
}
