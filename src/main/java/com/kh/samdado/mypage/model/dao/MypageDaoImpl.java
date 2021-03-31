package com.kh.samdado.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.mypage.model.vo.QnA;
import com.kh.samdado.user.model.vo.User;

@Repository
public class MypageDaoImpl implements MypageDao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	//1. 이메일, 전화번호 변경 메소드
	@Override
	public int updateUserInfo(User u) {
		return sqlSession.update("mypageMapper.updateUserInfo", u);
	}
	// 2. 문의 DB에 저장하는 메소드
	@Override
	public int insertNewQnA(QnA qna) {
		return sqlSession.insert("mypageMapper.insertNewQnA", qna);
	}

	
	
}
