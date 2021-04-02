package com.kh.samdado.mypage.model.dao;

import com.kh.samdado.user.model.vo.User;

public interface MypageDao {

	//1. 이메일, 전화번호 변경 메소드
	public int updateUserInfo(User u);


}
