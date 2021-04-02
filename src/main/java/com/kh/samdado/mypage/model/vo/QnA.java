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
public class QnA {
//	QNA_NO	NUMBER
//	QCONT	VARCHAR2(1500 BYTE)
//	QDATE	DATE
//	QREPLY	VARCHAR2(100 BYTE)
//	QSTATUS	CHAR(1 BYTE)
//	US_NO	VARCHAR2(15 BYTE)
	
	private int qnano;
	private String qcont;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date qdate;
	private String qreply;
	private char qstatus;
	private String usno;
	
	private String usname; // USER 테이블 조인을 위한 필드
	
}
