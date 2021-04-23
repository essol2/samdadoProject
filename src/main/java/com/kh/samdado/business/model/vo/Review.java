package com.kh.samdado.business.model.vo;

import java.sql.Date;

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
public class Review {
	
	/*
	 *  REV_NO	NUMBER
		REV_COMMENT	VARCHAR2(100 BYTE)
		REV_DATE	DATE
		REV_MODIFY	DATE
		REV_STATUS	VARCHAR2(1 BYTE)
		REV_LV	VARCHAR2(5 BYTE)
		IMG_PATH	VARCHAR2(50 BYTE)
		IMG_NAME	VARCHAR2(50 BYTE)
		IMG_RENAME	VARCHAR2(50 BYTE)
		US_NO	VARCHAR2(15 BYTE)
		BUS_CODE	NUMBER
		RE_STAR	NUMBER
	 */
	
	private int rev_no;			// 후기번호
	private String rev_comment;	// 후기내용
	private Date rev_date;		// 후기등록
	private Date rev_modify;	// 후기수정
	private String rev_status;	// 상태
	private String rev_lv;		// 댓글/리뷰
	private String img_path;	// 경로
	private String img_name1;	// 원본이름1
	private String img_name2;	// 원본이름1
	private String img_name3;	// 원본이름1
	private String img_rename1;	// 바꾼이름
	private String img_rename2;
	private String img_rename3;
	private String us_no;		// 회원번호
	private int bus_code;		// 사업장고유번호
	private String re_star;
	private String rev_hct; // h이냐 t이냐 c이냐
	
	private int c_booking_no;
	private String c_bus_name;
	private String c_booking_product;
	private Date c_booking_date;
	private Date c_booking_modify;
	private String c_booking_address;	
	private String c_booking_pay;		
	private int c_booking_number;		
	private String c_booking_phone;
	private Date c_booking_trv;	
	private int rent_no;			
	private int c_bus_code;
	
	private int r_booking_no;
	private String r_bus_name;
	private String r_booking_product;
	private Date r_booking_date;
	private Date r_booking_modify;
	private String r_booking_address;	
	private String r_booking_pay;		
	private int r_booking_number;		
	private String r_booking_phone;
	private Date r_booking_trv;
	private int room_no;
	private int r_bus_code;
	
	private int t_booking_no;			// 예약번호
	private String t_bus_name;			// 사업장이름
	private String t_booking_product;	// 상품이름
	private Date t_booking_date;		// 예약등록일
	private Date t_booking_modify;		// 수정일
	private String t_booking_address;	// 주소
	private String t_booking_pay;		// 금액
	private int t_booking_number;		// 인원
	private String t_booking_phone;		// 전화번호
	private Date t_booking_trv;			// 여행날짜	
	private String pro_no;				// 상품번호
	private int t_bus_code;				// 사업장고유번호
	
	private String file_no;
	private String file_name;
	private String file_root;
	private String file_status;
	private String file_rename;
	private String file_lv;
	
	// review 썼나 확인
	private String r_review_check;
	private String c_review_check;
	private String t_review_check;


	private String bus_name;
	private String bus_address;
	private String bus_intro;
	private Date bus_date;
	private Date bus_modify;
	private int ad_count;
	private String bus_classify;
	private String bus_category;
	private String bus_status;
	private String bus_phone;
	private String res_category;
	private String hotel_category;
	private String tour_category;
	private String tour_tema;
	private int al_no;
	private String bus_opening;
	private String hotel_facility;
	private String usname; // user 테이블 조인
	
	private int booking_no;
}
