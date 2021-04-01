package com.kh.samdado.business.model.dao;

import java.util.List;

import com.kh.samdado.admin.model.vo.Report;
import com.kh.samdado.business.model.vo.Alliance;
import com.kh.samdado.business.model.vo.Jjim;
import com.kh.samdado.business.model.vo.Review;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.business.model.vo.business.BusinessAtt;
import com.kh.samdado.business.model.vo.hotel.RoomBooking;
import com.kh.samdado.business.model.vo.rentcar.CarBooking;
import com.kh.samdado.business.model.vo.tour.TourBooking;

public interface businessDao {

	int insertAlliance(Alliance a);

	// 레스토랑 등록
	int insertRestaurant(Business b);
	int insertRestaurant2(BusinessAtt ba);

	// 호텔등록
	int inserthotel();
	
	// 관광지등록
	int inserttour();
	
	// 렌트카등록
	int insertrentcar();
  
	// 관광지 예약
	public int bookingTour(TourBooking tourbooking);

	// 호텔 예약
	public int bookingHotel(RoomBooking roombooking);

	// 렌트카 예약
	public int bookingCar(CarBooking carbooking);

	// 업체검색기능
	public List<Business> businessSearch();
		  
	// 후기등록	 
	public int insertReview(Review review);
		  
	// 신고하기
	public int report(Report report);
		  
	// 찜하기
	public int jjim(Jjim jjim);

}
