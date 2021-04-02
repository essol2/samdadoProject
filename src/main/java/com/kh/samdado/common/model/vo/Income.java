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
//	PAY_NO	NUMBER
//	ITEM	VARCHAR2(30 BYTE)
//	AMOUNT	VARCHAR2(30 BYTE)
//	PDATE	DATE
//	EXDATE	DATE
//	US_NO	VARCHAR2(15 BYTE)

	private int payno;
	private String item;
	private int amount;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date pdate;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date exdate;
	private String usno;
}
