package com.kh.samdado.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.business.model.vo.Jjim;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.common.model.vo.Alliance;
import com.kh.samdado.common.model.vo.Income;
import com.kh.samdado.mypage.model.vo.AccountBook;
import com.kh.samdado.mypage.model.vo.Alert;
import com.kh.samdado.mypage.model.vo.Booking;
import com.kh.samdado.mypage.model.vo.Point;
import com.kh.samdado.mypage.model.vo.QnA;
import com.kh.samdado.mypage.model.vo.SearchPoint;
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
	
	// 일반회원 - 내 예약 목록 출력 메소드
	@Override
	public List<Booking> selectBookList(String usno) {
		return sqlSession.selectList("mypageMapper.selectBookList", usno);
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


}
