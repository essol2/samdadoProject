package com.kh.samdado.business.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.business.model.vo.Jjim;
import com.kh.samdado.business.model.vo.Review;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.business.model.vo.business.BusinessAtt;
import com.kh.samdado.business.model.vo.hotel.Room;
import com.kh.samdado.business.model.vo.hotel.RoomAtt;
import com.kh.samdado.business.model.vo.hotel.RoomBooking;
import com.kh.samdado.business.model.vo.rentcar.Car;
import com.kh.samdado.business.model.vo.rentcar.CarAtt;
import com.kh.samdado.business.model.vo.rentcar.CarBooking;
import com.kh.samdado.business.model.vo.tour.TourBooking;
import com.kh.samdado.business.model.vo.tour.TourProduct;
import com.kh.samdado.common.model.vo.Alliance;
import com.kh.samdado.common.model.vo.Income;
import com.kh.samdado.common.model.vo.Report;
import com.kh.samdado.user.model.vo.User;

@Repository 
public class businessDaoImpl implements businessDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertAlliance(Alliance a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("businessMapper.insertAlliance", a);
	}

	// 사업장 첨부파일 등록
	@Override
	public int insertBusAtt(List<BusinessAtt> list) {
		return sqlSession.insert("businessMapper.insertBusAtt", list);
	}
	
	// 사업장 등록
	@Override
	public int insertBusiness(Business b) {
		return sqlSession.insert("businessMapper.insertBusiness", b);
	}
	
	// 사업장 리스트 카운트
	@Override
	public int selectResListCount() {
		return sqlSession.selectOne("businessMapper.selectResListCount");
	}

	
	// 음식점 디테일
	@Override
	public Business selectRestaurant(int bus_code) {
		return sqlSession.selectOne("businessMapper.selectRestaurant", bus_code);
	}
	// 음식점 리스트
	@Override
	public List<Business> selectResList() {
		return sqlSession.selectList("businessMapper.selectResList");
	}
	
	// 렌트카 등록
	@Override
	public int insertCar(Car c) {
		return sqlSession.insert("businessMapper.insertCar", c);
	}
	@Override
	public int insertCarAtt(List<CarAtt> carList) {
		return sqlSession.insert("businessMapper.insertCarAtt", carList);
	}
	// 렌트카 리스트
	@Override
	public List<Business> selectCarList() {
		return sqlSession.selectList("businessMapper.selectCarList");
	}
	// 렌트카디테일
	@Override
	public Business selectCar(int bus_code) {
		return sqlSession.selectOne("businessMapper.selectCar", bus_code);
	}

	// 호텔등록
	@Override
	public int insertRoomAtt(RoomAtt ra) {
		return sqlSession.insert("businessMapper.insertRoomAtt", ra);
	}
	@Override
	public int insertRoom(Room r) {
		return sqlSession.insert("businessMapper.insertRoom", r);
	}
	// 호텔리스트
	@Override
	public List<Business> selectHotelList() {
		return sqlSession.selectList("businessMapper.selectHotelList");
	}
	// 호텔디테일
	@Override
	public Business selectHotel(int bus_code) {
		return sqlSession.selectOne("businessMapper.selectHotel", bus_code);
	}



	// 관광지등록
	@Override
	public int insertTour(TourProduct tp) {
		return sqlSession.insert("businessMapper.insertTour", tp);
	}
	// 관광지리스트
	@Override
	public List<Business> selectTourList() {
		return sqlSession.selectList("businessMapper.selectTourList");
	}
	// 관광지디테일
	@Override
	public Business selectTour(int bus_code) {
		return sqlSession.selectOne("businessMapper.selectTour", bus_code);
	}
	

	@Override
	public int bookingTour(TourBooking tourbooking) {
		return sqlSession.insert("businessMapper.bookingTour", tourbooking);
	}

	@Override
	public int bookingHotel(RoomBooking roombooking) {
		return sqlSession.insert("businessMapper.bookingHotel", roombooking);
	}
	
	@Override
	public int bookingCar(CarBooking carbooking) {
		return sqlSession.insert("businessMapper.bookingCar", carbooking);
	}
	/*
	@Override
	public List<Business> businessSearch() {
		return sqlSession.insert("businessMapper.insertRestaurant2", );
	}
	*/
	
	@Override
	public int insertReview(Review review) {
		return sqlSession.insert("businessMapper.insertReview", review);
	}

	@Override
	public int insertReport(Report r) {		
		return sqlSession.insert("businessMapper.insertReport", r);
	}
	
	@Override
	public int jjim(Jjim jjim) {
		return sqlSession.insert("businessMapper.jjim", jjim);
	}

	@Override
	public List<Business> businessSearch() {
		// TODO Auto-generated method stub
		return null;
	}

	// 지혜
	@Override
	public int countReport() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("businessMapper.countReport");
	}

	
  @Override
	public List<Business> selectMyBusinessCategory(User loginUser) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("businessMapper.selectMyBusinessCategory", loginUser);
	}

	@Override
	public int insertBannerAd(Alliance a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("businessMapper.insertBannerAd", a);
	}
  
  @Override
	public Report findReportStatus(Report r) {		
		return sqlSession.selectOne("businessMapper.findReportStatus", r);
	}
  	
  	// 프리미엄 등록 시 만료일
	@Override
	public int insertIncome(Income i) {
		return sqlSession.insert("businessMapper.insertIncome", i);
	}














	

	

	

	



	




	

}
