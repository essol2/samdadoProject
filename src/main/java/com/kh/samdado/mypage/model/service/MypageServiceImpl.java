package com.kh.samdado.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samdado.mypage.model.dao.MypageDao;
import com.kh.samdado.mypage.model.vo.QnA;
import com.kh.samdado.user.model.vo.User;

@Service
public class MypageServiceImpl implements MypageService{
	@Autowired
	private MypageDao mDao;

	//1. 이메일, 전화번호 변경 메소드
	@Override
	public int updateUserInfo(User u) {
		return mDao.updateUserInfo(u);
	}

	// 2. 문의 DB에 저장하는 메소드
	@Override
	public int insertNewQnA(QnA qna) {
		return mDao.insertNewQnA(qna);
	}

}
