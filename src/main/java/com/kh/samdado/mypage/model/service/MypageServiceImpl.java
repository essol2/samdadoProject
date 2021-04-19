package com.kh.samdado.mypage.model.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samdado.admin.model.vo.PageInfo;
import com.kh.samdado.business.model.vo.Jjim;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.common.model.vo.Alliance;
import com.kh.samdado.common.model.vo.Income;
import com.kh.samdado.mypage.model.dao.MypageDao;
import com.kh.samdado.mypage.model.vo.AccountBook;
import com.kh.samdado.mypage.model.vo.Alert;
import com.kh.samdado.mypage.model.vo.ApplyPageInfo;
import com.kh.samdado.mypage.model.vo.Booking;
import com.kh.samdado.mypage.model.vo.Point;
import com.kh.samdado.mypage.model.vo.QnA;
import com.kh.samdado.mypage.model.vo.SearchPoint;
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
	
	// 신청중에 있는 사업장 전체 갯수 구하기
	@Override
	public int selectApplyListCount(String usno) {
		return mDao.selectApplyListCount(usno);
	}
	
	// 제휴회원 - 광고 신청을 진행중인 사업장 리소드 select 메소드
	@Override
	public List<Alliance> selectAppAdvertList(ApplyPageInfo api, String usno) {
		return mDao.selectAppAdvertList(api, usno);
	}
	
	// 제휴회원 - 프리미엄 광고 내역 불러오기
	@Override
	public List<Business> selectPBusList(String usno) {
		return mDao.selectPBusList(usno);
	}
	
	// 제휴회원 - 광고 클릭수 계산해서 까져오기
	@Override
	public int selectClickCount(String usno) {
		return mDao.selectClickCount(usno);
	}
	
	// 제휴회원 - 광고관리 차트 데이터 리스트
	@Override
	public List<Business> selectAlliChartList(String usno) {
		return mDao.selectAlliChartList(usno);
	}
	// 제휴회원 - 포인트 충전 내역 insert 메소드
	@Override
	public int insertNewPayment(Income ic) {
		return mDao.insertNewPayment(ic);
	}

	//제휴회원 - 포인트 DB에 포인트 넣어주는 메소드
	@Override
	public int insertNewPoint(Point po) {
		return mDao.insertNewPoint(po);
	}
	
	// 제휴회원 - 기존 회원의 포인트 정보 가져오는 메소드
	@Override
	public Point prePoint(Point po) {
		return mDao.prePoint(po);
	}
	
	// 제휴회원 - 포인트 리스트 출력 메소드
	@Override
	public List<Point> selectPointList(String usno) {
		return mDao.selectPointList(usno);
	}
	
	//제휴회원 - point 테이블에 검색결과 조회하러 가기
	@Override
	public List<SearchPoint> selectSearchList(SearchPoint sp) {
		return mDao. selectSearchList(sp);
	}

	// 제휴회원 - 사업장 조회 메소드
	@Override
	public List<Business> selectBussList(String usno) {
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
	public List<AccountBook> selectAccountList(AccountBook ab) {
		return mDao.selectAccountList(ab);
	}

	// 일반회원 - 가계부 입력 메소드
	@Override
	public int insertNewAcc(AccountBook ab) {
		return mDao.insertNewAcc(ab);
	}

	// 일반회원 - 가계부 가장 최근 날짜 가져오기
	@Override
	public List<AccountBook> selectRecentDate(String un) {
		return mDao.selectRecentDate(un);
	}

	// 일반회원 - 가계부 on.off 버튼 클릭시 db 내용 바꾸기
	@Override
	public int updateOnOffBtn(AccountBook abObject) {
		return mDao.updateOnOffBtn(abObject);
	}

	// 일반회원 - 가계부 기존 해당 컬럼 객체 값 가져오기
	@Override
	public AccountBook selectOrigin(AccountBook ab) {
		return mDao.selectOrigin(ab);
	}

	// 일반회원 - 가계부 삭제
	@Override
	public int deleteAcc(int accno) {
		return mDao.deleteAcc(accno);
	}

	// 일반회원 - 가계부 차트 조회 메소드
	@Override
	public List<AccountBook> selectChartList(AccountBook ab) {
		return mDao.selectChartList(ab);
	}

	// 제휴회원 - QnA 새로운 알림 등록
	@Override
	public int insertQnANews(Alert a) {
		return mDao.insertQnANews(a);
	}

	// 제휴회원 - Alliance 새로운 알림 등록을 위한 alno 찾아오기.
	@Override
	public int findAlno(Alliance a) {
		return mDao.findAlno(a);
	}
	
	// 제휴회원 - Alliance 새로운 알림 등록
	@Override
	public int insertAlliNews(Alert al) {
		return mDao.insertAlliNews(al);
	}

	// 제휴회원 - Alliance 배너 광고 승인시 usno 찾아오기
	@Override
	public String findAlliUsno(Alliance alliance) {
		return mDao.findAlliUsno(alliance);
	}
	
	// 제휴회원 - Alliance 승인시 새로운 알림 등록
	@Override
	public int insertNewApprove(Alert alert) {
		return mDao.insertNewApprove(alert);
	}

}
