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
	US_NO	VARCHAR2(15 BYTE)
	QNA_NO	NUMBER
	QCONT	VARCHAR2(1500 BYTE)
	QDATE	DATE
	QREPLY	VARCHAR2(100 BYTE)
	QSTATUS	CHAR(1 BYTE)
	
	* 광고
	AL_NO	NUMBER
	DATE	DATE
	STATUS	CHAR(1 BYTE)
	MASSAGE	VARCHAR2(50 BYTE)
	
	* 포인트
	PNO	NUMBER
	PODATE	DATE
	PDETAIL	VARCHAR2(300 BYTE)
	POAMOUNT	VARCHAR2(30 BYTE)
	
	* 결제
	PAY_NO	NUMBER
	ITEM	VARCHAR2(30 BYTE)
	AMOUNT	VARCHAR2(30 BYTE)
	PDATE	DATE
	
	*신고
	REPORT_NO	NUMBER
	REP_RES	VARCHAR2(30 BYTE)
	REP_CONT	VARCHAR2(50 BYTE)
	DATE	DATE
	STATUS	CHAR(1 BYTE)
	EXDATE	DATE
	
	* ALERT
	NNO	NUMBER
	US_NO	NUMBER
	NTITLE	VARCHAR2(1000 BYTE)
	NSTATUS	VARCHAR2(5 BYTE)
	NCATE	VARCHAR2(10 BYTE)
	NKEYNO	NUMBER
	*/
	
	private int nno;
	private String usno;
	private String ntitle;
	private String nstatus;
	private String ncate;
	private int nkeyno;

	
	private int qno;
	private String qcont;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date qdate;
	private String qreply;
	private char qstatus;
	private int alno;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date aldate;
	private char alstatus;
	private String almassage;
	private int pno;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date podate;
	private String detail;
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
	private Date exdate;
	
}
