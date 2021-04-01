package com.kh.samdado.admin.model.vo;

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

	
	private int report_no;		// 신고번호
	private String rep_res;		// 신고 사유
	private String rep_cont;	// 신고 내용 간단 기재
	private Date date;			// 신고 날짜
	private String rep_status;	// 상태
	private Date exdate;		// 신고만기일. 관리자 승인후 업데이트
	private String imgpath;		// 첨부파일이미지경로
	private String imgname;		// 첨부파일 원본이름
	private String imgcname;	// 첨부파일 바꾼이름
	private String usno;		// 신고당한 회원번호
	
	/* erd보고 변수명 임의로 작성했는데 원래 쓰시던 방법으로 편하게 수정하시면 됩니다. */

}
