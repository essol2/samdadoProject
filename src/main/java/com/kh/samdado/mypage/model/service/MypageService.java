package com.kh.samdado.mypage.model.service;

import java.util.List;

import com.kh.samdado.admin.model.vo.PageInfo;
import com.kh.samdado.business.model.vo.Jjim;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.common.model.vo.Alliance;
import com.kh.samdado.common.model.vo.Income;
import com.kh.samdado.mypage.model.vo.AccountBook;
import com.kh.samdado.mypage.model.vo.Alert;
import com.kh.samdado.mypage.model.vo.ApplyPageInfo;
import com.kh.samdado.mypage.model.vo.Booking;
import com.kh.samdado.mypage.model.vo.Point;
import com.kh.samdado.mypage.model.vo.QnA;
import com.kh.samdado.mypage.model.vo.SearchPoint;
import com.kh.samdado.user.model.vo.User;

public interface MypageService {

	// 이메일, 전화번호 변경 메소드
	public int updateUserInfo(User u);
	
	// 안읽은 알림 select 메소드	
	public List<Alert> selectAlertList(String usno);
	
	// 읽은 알림 select 메소드	
	public List<Alert> selectYAlertList(String usno);
	
	// 알림 상세보기 객체 찾아오는 메소드
	public Alert selectDetailAlert(Alert al);
	
	// 알림 nstatus update
	public int updateNstatus(Alert al);
	
	// 제휴회원 - 광고 관리 메소드
	public List<Alliance> selectAdvertList(String usno);
	
	// 신청중에 있는 사업장 전체 갯수 구하기
	public int selectApplyListCount(String usno);
	
	// 제휴회원 - 광고 신청을 진행중인 사업장 리소드 select 메소드
	public List<Alliance> selectAppAdvertList(ApplyPageInfo api, String usno);
	
	// 제휴회원 - 프리미엄 광고 내역 불러오기
	public List<Business> selectPBusList(String usno);
	
	// 제휴회원 - 광고 클릭수 계산해서 까져오기
	public int selectClickCount(String usno);
	
	// 제휴회원 - 광고관리 차트 데이터 리스트
	public List<Business> selectAlliChartList(String usno);
	
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
	public List<AccountBook> selectAccountList(AccountBook ab);

	// 일반회원 - 가계부 입력 메소드
	public int insertNewAcc(AccountBook ab);

	// 일반회원 - 가계부 가장 최근 날짜 가져오기
	public List<AccountBook> selectRecentDate(String un);

	// 일반회원 - 가계부 on.off 버튼 클릭시 db 내용 바꾸기
	public int updateOnOffBtn(AccountBook abObject);

	// 일반회원 - 가계부 기존 해당 컬럼 객체 값 가져오기
	public AccountBook selectOrigin(AccountBook ab);

	// 일반회원 - 가계부 삭제
	public int deleteAcc(int accno);

	// 일반회원 - 가계부 차트 조회
	public List<AccountBook> selectChartList(AccountBook ab);

	// 제휴회원 - QnA 새로운 알림 등록
	public int insertQnANews(Alert a);

	// 제휴회원 - Alliance 새로운 알림 등록을 위한 alno 찾아오기.
	public int findAlno(Alliance a);

	// 제휴회원 - Alliance 새로운 알림 등록
	public int insertAlliNews(Alert al);

	// 제휴회원 - Alliance 배너 광고 승인시 usno 찾아오기
	public String findAlliUsno(Alliance alliance);

	// 제휴회원 - Alliance 승인시 새로운 알림 등록
	public int insertNewApprove(Alert alert);

	// 제휴회원 - Report 승인시 알림 등록
	public int insertNewReport(Alert a);

	
}
