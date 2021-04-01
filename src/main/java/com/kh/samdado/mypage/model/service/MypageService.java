package com.kh.samdado.mypage.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.samdado.bussiness.model.vo.Alliance;
import com.kh.samdado.bussiness.model.vo.Jjim;
import com.kh.samdado.bussiness.model.vo.bussiness.Bussiness;
import com.kh.samdado.mypage.model.vo.AccountBook;
import com.kh.samdado.mypage.model.vo.Alert;
import com.kh.samdado.mypage.model.vo.Booking;
import com.kh.samdado.mypage.model.vo.Point;
import com.kh.samdado.mypage.model.vo.QnA;
import com.kh.samdado.user.model.vo.User;

public interface MypageService {

	// 이메일, 전화번호 변경 메소드
	public int updateUserInfo(User u);
	
	// 알림 select 메소드
	public List<Alert> selectAlertList(String usno);
	
	// 제휴회원 - 광고 관리 메소드
	public List<Alliance> selectAdvertList(String usno);
	
	// 제휴회원 - 포인트 관리 메소드
	public List<Point> selectPointList(String usno);
	
	// 제휴회원 - 사업장 조회 메소드
	public List<Bussiness> selectBussList(String usno);

	// 제휴회원 - 문의 DB에 저장하는 메소드
	public int insertNewQnA(QnA qna);
	
	// 일반회원 - 찜목록 출력 메소드
	public List<Jjim> selctJjimList(String usno);
	
	// 일반회원 - 내 예약 목록 출력 메소드
	public List<Booking> selectBookList(String usno);
	
	// 일반회원 - 가계부 조회 메소드
	public List<AccountBook> selectAccountList(String usno);

	// 일반회원 - 가계부 입력 메소드
	public int insertNewAcc(AccountBook acc);
}
