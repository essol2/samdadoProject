package com.kh.samdado.mypage.model.vo;

import java.sql.Date;

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
public class SearchPoint {

	private int pno;
	@DateTimeFormat(pattern = "yyyy.MM.dd")
	private Date pdate;
	private String pdetail;
	private int pbalance;
	private int pamount;
	private String usno;
	private Date startdate;
	//private Date enddate;
	private String selector;
	
}
