package com.kh.samdado.mypage.model.service;

import java.util.List;

import com.kh.samdado.business.model.vo.Alliance;
import com.kh.samdado.business.model.vo.Jjim;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.common.model.vo.Income;
import com.kh.samdado.mypage.model.vo.AccountBook;
import com.kh.samdado.mypage.model.vo.Alert;
import com.kh.samdado.mypage.model.vo.Booking;
import com.kh.samdado.mypage.model.vo.Point;
import com.kh.samdado.mypage.model.vo.QnA;
import com.kh.samdado.mypage.model.vo.SearchPoint;
import com.kh.samdado.user.model.vo.User;

public interface MypageService {

	// 이메일, 전화번호 변경 메소드
	public int updateUserInfo(User u);
	
	// 알림 select 메소드
	public List<Alert> selectAlertList(String usno);
	
	// 제휴회원 - 광고 관리 메소드
	public List<Alliance> selectAdvertList(String usno);
	
	// 제휴회원 - 포인트 충전 내역 insert 메소드
	public int insertNewPayment(Income ic);

	// 제휴회원 - 포인트 DB에 포인트 넣어주는 메소드
	public int insertNewPoint(Point po);
	
	// 제휴회원 - 기존 회원의 포인트 정보 가져오는 메소드
	public Point prePoint(Point po);
	
	// 제휴회원 - 포인트 리스트 출력 메소드
	public List<Point> selectPointList(String usno);
	
	//제휴회원 - point 테이블에 검색결과 조회하러 가기
	public List<SearchPoint> selectSearchList(SearchPoint sp);
	
	// 제휴회원 - 사업장 조회 메소드
	public List<Business> selectBussList(String usno);

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
