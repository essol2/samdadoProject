package com.kh.samdado.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class A_board {
	
//	BNO	NUMBER
//	BTITLE	VARCHAR2(100 BYTE)
//	BDATE	DATE
//	BCONTENT	VARCHAR2(300 BYTE)
//	BSTATUS	VARCHAR2(5 BYTE)
//	US_NO	VARCHAR2(15 BYTE)
//	US_PART	VARCHAR2(15 BYTE)
	
	private int bno;
	private String btitle;
	private Date bdate;
	private String bcontent;
	private String bstatus;
	private String usno;
	private String uspart;
	
}
