package com.kh.samdado.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samdado.bussiness.model.vo.Alliance;
import com.kh.samdado.bussiness.model.vo.Jjim;
import com.kh.samdado.bussiness.model.vo.bussiness.Bussiness;
import com.kh.samdado.mypage.model.dao.MypageDao;
import com.kh.samdado.mypage.model.vo.AccountBook;
import com.kh.samdado.mypage.model.vo.Alert;
import com.kh.samdado.mypage.model.vo.Booking;
import com.kh.samdado.mypage.model.vo.Point;
import com.kh.samdado.mypage.model.vo.QnA;
import com.kh.samdado.user.model.vo.User;

@Service
public class MypageServiceImpl implements MypageService{
	@Autowired
	private MypageDao mDao;

	// 이메일, 전화번호 변경 메소드
	@Override
	public int updateUserInfo(User u) {
		return mDao.updateUserInfo(u);
	}

	// 알림 select 메소드
	@Override
	public List<Alert> selectAlertList(String usno) {
		return mDao.selectAlertLis(usno);
	}

	// 제휴회원 - 광고 관리 메소드
	@Override
	public List<Alliance> selectAdvertList(String usno) {
		return mDao.selectAdvertList(usno);
	}

	// 제휴회원 - 포인트 관리 메소드
	@Override
	public List<Point> selectPointList(String usno) {
		return mDao.selectPointList(usno);
	}

	// 제휴회원 - 사업장 조회 메소드
	@Override
	public List<Bussiness> selectBussList(String usno) {
		return mDao.selectBussList(usno);
	}
	
	// 제휴회원 - 문의 DB에 저장하는 메소드
	@Override
	public int insertNewQnA(QnA qna) {
		return mDao.insertNewQnA(qna);
	}


	// 일반회원 - 찜목록 출력 메소드
	@Override
	public List<Jjim> selctJjimList(String usno) {
		return mDao.selctJjimList(usno);
	}

	// 일반회원 - 내 예약 목록 출력 메소드
	@Override
	public List<Booking> selectBookList(String usno) {
		return mDao.selectBookList(usno);
	}

	// 일반회원 - 가계부
	@Override
	public List<AccountBook> selectAccountList(String usno) {
		return mDao.selectAccountList(usno);
	}

	// 일반회원 - 가계부 입력 메소드
	@Override
	public int insertNewAcc(AccountBook acc) {
		return mDao.insertNewAcc(acc);
	}
	
	

}
