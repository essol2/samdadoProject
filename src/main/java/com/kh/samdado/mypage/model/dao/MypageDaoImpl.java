package com.kh.samdado.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.admin.model.vo.A_board;
import com.kh.samdado.business.model.vo.Jjim;
import com.kh.samdado.business.model.vo.Review;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.common.model.vo.Alliance;
import com.kh.samdado.common.model.vo.Income;
import com.kh.samdado.mypage.model.vo.AccountBook;
import com.kh.samdado.mypage.model.vo.Alert;
import com.kh.samdado.mypage.model.vo.ApplyPageInfo;
import com.kh.samdado.mypage.model.vo.Booking;
import com.kh.samdado.mypage.model.vo.Point;
import com.kh.samdado.mypage.model.vo.QnA;
import com.kh.samdado.mypage.model.vo.RouteMP;
import com.kh.samdado.mypage.model.vo.SearchPoint;
import com.kh.samdado.route.model.vo.RouteFinal;
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
	
	// 안읽은 알림 select 메소드
	@Override
	public List<Alert> selectAlertList(User u) {
		return sqlSession.selectList("mypageMapper.selectAlertList", u);
	}
	
	// 읽은 알림 select 메소드
	@Override
	public List<Alert> selectYAlertList(User u) {
		return sqlSession.selectList("mypageMapper.selectYAlertList", u);
	}

	// 알림 상세보기 객체 찾아오는 메소드
	@Override
	public Alert selectDetailAlert(Alert al) {
		return sqlSession.selectOne("mypageMapper.selectDetailAlert", al);
	}
	
	// 알림 nstatus update
	@Override
	public int updateNstatus(Alert al) {
		return sqlSession.update("mypageMapper.updateNstatus", al);
	}
	
	// 제휴회원 - 알람을 위한 포인트 찾아오기
	@Override
	public int findThisPB(Business selectBusCodeUser) {
		return sqlSession.selectOne("mypageMapper.findThisPB", selectBusCodeUser);
	}

	// 제휴회원 - 포인트가 500보다 아래라고 알림주기
	@Override
	public int insertPointAlert(Point fdp) {
		return sqlSession.insert("mypageMapper.insertPointAlert", fdp);
	}
	
	// 제휴회언 알림 -100 될 때 마다 new pno 알아오기
	@Override
	public int findNewPno(Business selectBusCodeUser) {
		return sqlSession.selectOne("mypageMapper.findNewPno", selectBusCodeUser);
	}
	
	// 제휴회원 - 광고 관리 메소드
	@Override
	public List<Alliance> selectAdvertList(String usno) {
		return sqlSession.selectList("mypageMapper.selectAdvertList", usno);
	}
	
	// 신청중에 있는 사업장 전체 갯수 구하기
	@Override
	public int selectApplyListCount(String usno) {
		return sqlSession.selectOne("mypageMapper.selectApplyListCount", usno);
	}
	
	// 제휴회원 - 광고 신청을 진행중인 사업장 리소드 select 메소드
	@Override
	public List<Alliance> selectAppAdvertList(ApplyPageInfo api, String usno) {
		int offset = (api.getCurrentPage()-1) * api.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, api.getBoardLimit());
		return sqlSession.selectList("mypageMapper.selectAppAdvertList", usno, rowBounds);
	}
	
	// 제휴회원 - 프리미엄 광고 내역 불러오기
	@Override
	public List<Business> selectPBusList(String usno) {
		return sqlSession.selectList("mypageMapper.selectPBusList", usno);
	}
	

	// 제휴회원 - 광고 클릭수 계산해서 까져오기
	@Override
	public int selectClickCount(String usno) {
		return sqlSession.selectOne("mypageMapper.selectClickCount", usno);
	}
	
	// 제휴회원 - 광고관리 차트 데이터 리스트
	@Override
	public List<Business> selectAlliChartList(String usno) {
		return sqlSession.selectList("mypageMapper.selectAlliChartList", usno);
	}

	// 제휴회원 -  포인트 충전 내역 insert 메소드
	@Override
	public int insertNewPayment(Income ic) {
		return sqlSession.insert("mypageMapper.insertNewPayment", ic);
	}

	//제휴회원 - 포인트 DB에 포인트 넣어주는 메소드
	@Override
	public int insertNewPoint(Point po) {
		return sqlSession.insert("mypageMapper.insertNewPoint", po);
	}

	// 제휴회원 - 기존 회원의 포인트 정보 가져오는 메소드
	@Override
	public Point prePoint(Point po) {
		return sqlSession.selectOne("mypageMapper.prePoint", po);
	}
	
	// 제휴회원 - 포인트 리스트 출력 메소드
	@Override
	public List<Point> selectPointList(String usno) {
		return sqlSession.selectList("mypageMapper.selectPointList", usno);
	}

	//제휴회원 - point 테이블에 검색결과 조회하러 가기
	@Override
	public List<SearchPoint> selectSearchList(SearchPoint sp) {
		return sqlSession.selectList("mypageMapper.selectSearchList", sp);
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

	// 일반회원 - 가계부 조회 메소드
	@Override
	public List<AccountBook> selectAccountList(AccountBook ab) {
		return sqlSession.selectList("mypageMapper.selectAccountList", ab);
	}

	// 일반회원 - 가계부 입력 메소드
	@Override
	public int insertNewAcc(AccountBook ab) {
		return sqlSession.insert("mypageMapper.insertNewAcc", ab);
	}

	// 일반회원 - 가계부 가장 최근 날짜 가져오기
	@Override
	public List<AccountBook> selectRecentDate(String un) {
		return sqlSession.selectList("mypageMapper.selectRecentDate", un);
	}

	// 일반회원 - 가계부 on.off 버튼 클릭시 db 내용 바꾸기
	@Override
	public int updateOnOffBtn(AccountBook abObject) {
		return sqlSession.update("mypageMapper.updateOnOffBtn", abObject);
	}

	//일반회원 - 가계부 기존 해당 컬럼 객체 값 가져오기
	@Override
	public AccountBook selectOrigin(AccountBook ab) {
		return sqlSession.selectOne("mypageMapper.selectOrigin", ab);
	}

	// 일반회원 - 가계부 삭제
	@Override
	public int deleteAcc(int accno) {
		return sqlSession.delete("mypageMapper.deleteAcc", accno);
	}

	// 일반회원 - 차트 리스트 조회 메소드
	@Override
	public List<AccountBook> selectChartList(AccountBook ab) {
		return sqlSession.selectList("mypageMapper.selectChartList", ab);
	}

	// 제휴회원 - QnA 새로운 알림 등록
	@Override
	public int insertQnANews(Alert a) {
		return sqlSession.insert("mypageMapper.insertQnANews", a);
	}

	// 제휴회원 - Alliance 새로운 알림 등록을 위한 alno 찾아오기.
	@Override
	public int findAlno(Alliance a) {
		return sqlSession.selectOne("mypageMapper.findAlno", a);
	}

	// 제휴회원 - Alliance 새로운 알림 등록
	@Override
	public int insertAlliNews(Alert al) {
		return sqlSession.insert("mypageMapper.insertAlliNews", al);
	}
	
	// 제휴회원 - Alliance 배너 광고 승인시 usno 찾아오기
	@Override
	public String findAlliUsno(Alliance alliance) {
		return sqlSession.selectOne("mypageMapper.findAlliUsno", alliance);
	}

	// 제휴회원 - Alliance 승인시 새로운 알림 등록
	@Override
	public int insertNewApprove(Alert alert) {
		return sqlSession.insert("mypageMapper.insertNewApprove", alert);
	}

	// 제휴회원 - 포인트 충전 시 user DB에 update
	@Override
	public int updatePbalance(Point po) {
		// TODO Auto-generated method stub
		return sqlSession.update("mypageMapper.updatePbalance", po);
	}

	// 제휴회원 - Report 승인시 알림 등록
	@Override
	public int insertNewReport(Alert a) {
		return sqlSession.insert("mypageMapper.insertNewReport", a);

	}
	// 일반회원 - hotel book list 찾아오기
	@Override
	public List<Booking> selectHotelBookList(String usno) {
		return sqlSession.selectList("mypageMapper.selectHotelBookList", usno);
	}

	// 일반회원 - tour book list 찾아오기
	@Override
	public List<Booking> selectTourBookList(String usno) {
		return sqlSession.selectList("mypageMapper.selectTourBookList", usno);
	}

	// 일반회원 - car book list 찾아오기
	@Override
	public List<Booking> selectCarBookList(String usno) {
		return sqlSession.selectList("mypageMapper.selectCarBookList", usno);
	}

	// 일반회원 - 내예약 취소
	@Override
	public int deleteBooking(Booking b) {
		System.out.println("dao까지는 잘 오니?");
		return sqlSession.delete("mypageMapper.deleteBooking", b);
	}
	// 일반회원 - 후기등록
	@Override
	public int insertReview(Review r) {
		sqlSession.insert("mypageMapper.insertReview", r);
		return sqlSession.selectOne("mypageMapper.selectThisNo", r);
	}

	// 일반회원 - 후기작성 표기
	@Override
	public int updateCheck(Review r) {
		return sqlSession.update("mypageMapper.updateCheck", r);
	}

	// 일반회원 - 후기 수정 디테일 가져오기
	@Override
	public Review selectReview(Review r) {
		return sqlSession.selectOne("mypageMapper.selectReview", r);
	}
	
	// 일반회원 - 후기수정 업데이트
	@Override
	public int updateReview(Review r) {
		return sqlSession.update("mypageMapper.updateReview", r);
	}
	
	// 일반회원 - 찜목록 넣기 전에 이미 있는지 확인하기
	@Override
	public Jjim findJjimNo(Jjim j) {
		return sqlSession.selectOne("mypageMapper.findJjimNo", j);
	}

	// 일반회원 - 찜목록 넣기
	@Override
	public int insertJjim(Jjim j) {
		return sqlSession.insert("mypageMapper.insertJjim", j);
	}
	
	//일반회원 - 다시 찜하기
	@Override
	public int updateJjim(String jjim_no) {
		return sqlSession.update("mypageMapper.updateJjim", jjim_no);
	}

	// 일반회원 - 찜목록 삭제
	@Override
	public int deleteJjim(Jjim j) {
		return sqlSession.update("mypageMapper.deleteJjim", j);
	}

	// 일반회원 - 찜목록 찾아오기
	@Override
	public List<Jjim> selectJjimList(String usno) {
		return sqlSession.selectList("mypageMapper.selectJjimList", usno);
	}

	// 제휴회원 - 로그인시 내소식 확인하기
	@Override
	public int findNewNews(User u) {
		return sqlSession.selectOne("mypageMapper.findNewNews", u);
	}

	// 관리자 공지사항 news에 insert
	@Override
	public int insertNewBoard(A_board aboard) {
		return sqlSession.insert("mypageMapper.insertNewBoard", aboard);
	}

	// 관리자 공지사항 bno 찾아오기
	@Override
	public int findNewBno(A_board aboard) {
		return sqlSession.selectOne("mypageMapper.findNewBno", aboard);
	}

	// 회원 탈퇴
	@Override
	public int updateUserStatus(User u) {
		return sqlSession.update("mypageMapper.updateUserStatus", u);
	}

	// 내 루트 찾기
	@Override
	public List<RouteFinal> selectMyRoute(String u) {
		return sqlSession.selectList("mypageMapper.selectMyRoute", u);
	}

	// 사용자 별로 가지고 있는 루트 갯수
	@Override
	public List<RouteMP> selectRouteNum(String u) {
		return sqlSession.selectList("mypageMapper.selectRouteNum", u);
	}

	// 루트 별로 가지고 있는 관광지 개수
	@Override
	public int selectStandard(int routeNum) {
		return sqlSession.selectOne("mypageMapper.selectStandard", routeNum);
	}

	// 길찾기 내 찜하기 
	@Override
	public List<Business> findHotelJjimList(User u) {
		return sqlSession.selectList("mypageMapper.findHotelJjimList", u);
	}

}
