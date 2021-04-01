package com.kh.samdado.business.model.vo;

import java.util.Date;

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
public class Alliance {
	
//	AL_NO	NUMBER
//	INTRO	VARCHAR2(100 BYTE)
//	SUBDATE	DATE
//	ALSTATUS	VARCHAR2(5 BYTE)
//	START_DATE	DATE
//	IMG_PATH	VARCHAR2(50 BYTE)
//	IMG_NAME	VARCHAR2(50 BYTE)
//	IMG_CNAME	VARCHAR2(50 BYTE)
//	MASSAGE	VARCHAR2(50 BYTE)
//	US_NO	VARCHAR2(15 BYTE)
	
	private int alno;			// 배너 광고 시퀀스pk
	private String intro;		// 간단 소개글
	private Date subdate;		// 배너 광고 신청 날짜
	private String alstatus;	// 상태
	private Date startdate;		// 배너 광고 시작 날짜
	private String imgpath;
	private String imgname;
	private String imgcname;
	private String massage;		// 승인거부시 관리자가 제휴회원에게 보낼 메세지
	private String usno;		// USER 테이블 조인
	

}
