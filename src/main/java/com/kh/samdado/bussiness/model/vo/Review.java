package com.kh.samdado.bussiness.model.vo;

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
	private int rev_no;			// 후기번호
	private String rev_comment;	// 후기내용
	private Date rev_date;		// 후기등록
	private Date rev_modify;	// 후기수정
	private String rev_status;	// 상태
	private String rev_lv;		// 댓글/리뷰
	private String img_path;	// 경로
	private String img_name;	// 원본이름
	private String img_rename;	// 바꾼이름
	private String us_no;		// 회원번호
	private int bus_code;		// 사업장고유번호
	
}
