package com.kh.samdado.business.model.service;

import java.util.List;

import com.kh.samdado.common.model.vo.Report;
import com.kh.samdado.user.model.vo.User;
import com.kh.samdado.common.model.vo.Alliance;
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

public interface businessService {
	
	// Alliance DB insert
	int insertAlliance(Alliance a);
	
	// 사업장 등록
	int insertBusAtt(BusinessAtt ba); 
	int insertBusiness(Business b);
	
	// 렌트카등록
	int insertCar(Car c);
	int insertCarAtt(CarAtt ca); 
	
	// 호텔등록
	int insertRoomAtt(RoomAtt ra);
	int insertRoom(Room r);

	// 관광지등록
	int insertTour(TourProduct tp);
  
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

	// 신고 카운트
	int countReport();

	// 배너 광고 등록 폼, 본인 사업장 가져오기
	List<Business> selectMyBusinessCategory(User loginUser);



	

	


  
}