package com.kh.samdado.business.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.admin.model.vo.Report;
import com.kh.samdado.business.model.vo.Alliance;
import com.kh.samdado.business.model.vo.Jjim;
import com.kh.samdado.business.model.vo.Review;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.business.model.vo.business.BusinessAtt;
import com.kh.samdado.business.model.vo.hotel.RoomBooking;
import com.kh.samdado.business.model.vo.rentcar.CarBooking;
import com.kh.samdado.business.model.vo.tour.TourBooking;

@Repository 
public class businessDaoImpl implements businessDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertAlliance(Alliance a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("businessMapper.insertAlliance", a);
	}

	@Override
	public int insertRestaurant(Business b) {
		return sqlSession.insert("businessMapper.insertRestaurant", b);
	}

	@Override
	public int insertRestaurant2(BusinessAtt ba) {
		return sqlSession.insert("businessMapper.insertRestaurant2", ba);
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
	

}
