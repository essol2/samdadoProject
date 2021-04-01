package com.kh.samdado.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.business.model.vo.Alliance;
import com.kh.samdado.business.model.vo.Jjim;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.common.model.vo.Income;
import com.kh.samdado.mypage.model.vo.AccountBook;
import com.kh.samdado.mypage.model.vo.Alert;
import com.kh.samdado.mypage.model.vo.Booking;
import com.kh.samdado.mypage.model.vo.Point;
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
	
	// 알림 select 메소드
	@Override
	public List<Alert> selectAlertLis(String usno) {
		return sqlSession.selectList("mypageMapper.selectAlertLis", usno);
	}
	
	// 제휴회원 - 광고 관리 메소드
	@Override
	public List<Alliance> selectAdvertList(String usno) {
		return sqlSession.selectList("mypageMapper.selectAdvertList", usno);
	}
	
	// 제휴회원 -  포인트 충전 내역 insert 메소드
	@Override
	public int insertNewPayment(Income ic) {
		return sqlSession.insert("mypageMapper.insertNewPayment", ic);
	}	
	
	// 제휴회원 - 포인트 리스트 출력 메소드
	@Override
	public List<Point> selectPointList(String usno) {
		return sqlSession.selectList("mypageMapper.selectPointList", usno);
	}
	
	// 제휴회원 - 사업장 조회 메소드
	@Override
	public List<Business> selectBussList(String usno) {
		return sqlSession.selectList("mypageMapper.selectBussList", usno);
	}
	
	// 제휴회원 - 문의 DB에 저장하는 메소드
	@Override
	public int insertNewQnA(QnA qna) {
		return sqlSession.insert("mypageMapper.insertNewQnA", qna);
	}
	
	// 일반회원 - 찜목록 출력 메소드
	@Override
	public List<Jjim> selctJjimList(String usno) {
		return sqlSession.selectList("mypageMapper.selctJjimList", usno);
	}
	
	// 일반회원 - 내 예약 목록 출력 메소드
	@Override
	public List<Booking> selectBookList(String usno) {
		return sqlSession.selectList("mypageMapper.selectBookList", usno);
	}
	
	// 일반회원 - 가계부 조회 메소드
	@Override
	public List<AccountBook> selectAccountList(String usno) {
		return sqlSession.selectList("mypageMapper.selectAccountList", usno);
	}

	// 일반회원 - 가계부 입력 메소드
	@Override
	public int insertNewAcc(AccountBook acc) {
		return sqlSession.insert("mypageMapper.selectAccountList", acc);
	}

}
