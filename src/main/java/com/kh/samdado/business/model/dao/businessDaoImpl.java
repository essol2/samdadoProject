package com.kh.samdado.business.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.business.model.vo.Jjim;
import com.kh.samdado.business.model.vo.Review;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.business.model.vo.business.BusinessAtt;
import com.kh.samdado.business.model.vo.hotel.RoomBooking;
import com.kh.samdado.business.model.vo.rentcar.Car;
import com.kh.samdado.business.model.vo.rentcar.CarAtt;
import com.kh.samdado.business.model.vo.rentcar.CarBooking;
import com.kh.samdado.business.model.vo.tour.TourBooking;
import com.kh.samdado.common.model.vo.Alliance;
import com.kh.samdado.common.model.vo.Report;

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
	public int insertBusAtt(BusinessAtt ba) {
		return sqlSession.insert("businessMapper.insertBusAtt", ba);
	}
	@Override
	public int insertBusiness(Business b) {
		return sqlSession.insert("businessMapper.insertBusiness", b);
	}
	
	// 렌트카 등록
	@Override
	public int insertCar(Car c) {
		return sqlSession.insert("businessMapper.insertCar", c);
	}
	@Override
	public int insertCarAtt(CarAtt ca) {
		return sqlSession.insert("businessMapper.insertCarAtt", ca);
	}

	// 호텔등록
  	public int inserthotel() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int inserttour() {
		// TODO Auto-generated method stub
		return 0;
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
	public int report(Report report) {
		return sqlSession.insert("businessMapper.report", report);
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


	




	

}
