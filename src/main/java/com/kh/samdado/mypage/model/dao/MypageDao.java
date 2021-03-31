package com.kh.samdado.mypage.model.dao;

import com.kh.samdado.mypage.model.vo.QnA;
import com.kh.samdado.user.model.vo.User;

public interface MypageDao {

	//1. 이메일, 전화번호 변경 메소드
	public int updateUserInfo(User u);

	// 2. 문의 DB에 저장하는 메소드
	public int insertNewQnA(QnA qna);


}
