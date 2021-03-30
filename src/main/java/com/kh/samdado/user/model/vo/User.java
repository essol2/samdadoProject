package com.kh.samdado.user.model.vo;

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
public class User {
	
	private int usno;
	private String usid;
	private String uspwd;
	private String usname;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date usbirth;
	private String usemail;
	private String usphone;
	private String busno;
	private String uspart;
	private String usstatus;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date usstop;
	private String authKey;
}
