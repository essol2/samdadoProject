package com.kh.samdado.route.model.vo;

import java.sql.Date;

import com.kh.samdado.common.model.vo.Alliance;

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
public class SpotBus {
	
	private int spot_no;			// 여행지 번호
	private int spot_lo;			// 여행지 위치 (동/서/남/북)
	private int spot_them;			// 여행지 테마
	private String spot_title;		// 여행지 이름
	private String spot_path;		// 여행지 이미지 저장 경로
	private String spot_oname;		// 여행지 이미지 원본 파일 이름
	private String spot_content;	// 여행지 소개글
	private int spot_price;
	private String spot_address;
	
	private int bus_code;
	private String us_no;
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
	private String file_rename;  // 비즈니스 첨부파일경로 join
	private String file_lv;
	private String usname; // user 테이블 조인
	// 관광지리스트 조인
	private String pro_name;	// 상품이름
	private String pro_price;	// 상품가격
	private String pro_adult;
	private String pro_youth;
	private String pro_child;
	private String pro_fac;
	private int pro_no;
}
