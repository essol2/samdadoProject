package com.kh.samdado.route.model.vo;

import java.util.Date;

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
//@Data
public class RouteFinal {
	private int route_no; 		// 루트 번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date route_date;	// 루트 날짜
	private String route_price;	// 총 예상 예산
	private String us_no;		// 회원 번호
	
	// route_detail 조인
	private int detail_no;	// 한 루트 안에서의 여행지 순서
	private int spot_no;	// 여행지 번호
	private int bus_code;	// 사업장 고유 번호
	
	
	//business join
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
	
	// tour_spot join
	private int spot_lo;			// 여행지 위치 (동/서/남/북)
	private int spot_them;			// 여행지 테마
	private String spot_title;		// 여행지 이름
	private String spot_path;		// 여행지 이미지 저장 경로
	private String spot_oname;		// 여행지 이미지 원본 파일 이름
	private String spot_content;	// 여행지 소개글
	private String spot_price;
	private String spot_address;
	
	private int rowNum;
	private int standardNum;
}
