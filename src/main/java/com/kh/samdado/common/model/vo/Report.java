package com.kh.samdado.common.model.vo;

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
public class Report {
	
//	REPORT_NO	NUMBER
//	REP_RES	VARCHAR2(30 BYTE)
//	REP_CONT	VARCHAR2(50 BYTE)
//	RDATE	DATE
//	RSTATUS	CHAR(1 BYTE)
//	REXDATE	DATE
//	R_IMG_PATH	VARCHAR2(50 BYTE)
//	R_IMG_NAME	VARCHAR2(50 BYTE)
//	R_IMG_CNAME	VARCHAR2(50 BYTE)
//	US_NO	VARCHAR2(15 BYTE)
//	R_COUNT	NUMBER
//	REF_BUS_CODE	NUMBER
	
	private int report_no;		// 신고번호
	private String rep_res;		// 신고 사유
	private String rep_cont;	// 신고 내용 간단 기재
	private Date rdate;			// 신고 날짜
	private String rstatus;		// 상태
	private Date rexdate;		// 신고만기일. 관리자 승인후 업데이트
	private String r_img_path;	// 첨부파일이미지경로
	private String r_img_name;	// 첨부파일 원본이름
	private String r_img_cname;	// 첨부파일 바꾼이름
	private String usno;		// 신고당한 회원번호			// 유저 테이블 조인
	private int r_count;		// 신고 누적 횟수
	private int bus_code;       // 신고받은사업장고유번호		// 비지니스 테이블 조인
	


}
