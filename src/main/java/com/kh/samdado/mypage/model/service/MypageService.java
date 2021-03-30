package com.kh.samdado.mypage.model.service;

import com.kh.samdado.user.model.vo.User;

public interface MypageService {

	// 1. 이메일, 전화번호 변경 메소드
	public int updateUserInfo(User u);

}
