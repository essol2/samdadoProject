package com.kh.samdado.business.model.vo.hotel;


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
public class RoomAtt {
	private String file_no;		// 파일코드
	private String file_name;	// 파일명
	private String file_root;	// 파일경로
	private String file_status;	// 파일상태
	private String file_rename;	// 리네임
	private String file_lv;		// 대표사진lv=0 / 일반사진lv=1
	private int room_no;		// 숙박번호
}
