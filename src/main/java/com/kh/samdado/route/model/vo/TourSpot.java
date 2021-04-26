package com.kh.samdado.route.model.vo;

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
public class TourSpot {
	
	private int spot_no;			// 여행지 번호
	private int spot_lo;			// 여행지 위치 (동/서/남/북)
	private int spot_them;			// 여행지 테마
	private String spot_title;		// 여행지 이름
	private String spot_path;		// 여행지 이미지 저장 경로
	private String spot_oname;		// 여행지 이미지 원본 파일 이름
	private String spot_content;	// 여행지 소개글
	private String spot_price;
	private String spot_address;
	
}
