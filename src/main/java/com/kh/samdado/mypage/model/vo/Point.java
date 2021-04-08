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
public class Point {
//	PNO	NUMBER
//	PDATE	DATE
//	PDETAIL	VARCHAR2(300 BYTE)
//	PBALANCE	VARCHAR2(30 BYTE)
//	PAMOUNT	VARCHAR2(30 BYTE)
//	US_NO	VARCHAR2(15 BYTE)
	
	private int pno;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date pdate;
	private String pdetail;
	private int pbalance;
	private int pamount;
	private String usno;
	
	private String usname;	// user 테이블 조인
}
