package com.kh.samdado.business.model.service;

import java.util.List;

import com.kh.samdado.common.model.vo.Report;
import com.kh.samdado.mypage.model.vo.Booking;
import com.kh.samdado.mypage.model.vo.Point;
import com.kh.samdado.user.model.vo.User;
import com.kh.samdado.common.model.vo.Alliance;
import com.kh.samdado.common.model.vo.Income;
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
import com.kh.samdado.business.model.vo.rentcar.CarList;
import com.kh.samdado.business.model.vo.tour.TourBooking;
import com.kh.samdado.business.model.vo.tour.TourProduct;

public interface businessService {
	
	// Alliance DB insert
	int insertAlliance(Alliance a);
	
	// 사업장 등록
	
	int insertBusiness(Business b, List<BusinessAtt> list);
	
	// 사업장 리스트 카운트
	int selectResListCount();
	// 사업장 사진
	List<BusinessAtt> selectAtt(int bus_code);
	
	// 음식점 디테일
	Business selectRestaurant(int bus_code);
	// 음식점  리스트
	List<Business> selectResList();
		
	// 렌트카등록
	int insertCar(List<Car> cars, List<CarAtt> carList);
	// 렌트카 디테일
	Business selectCar(int bus_code);
	// 렌트카리스트
	List<Business> selectCarList();
	
	// 호텔등록
	int insertRoom(List<Room> rooms, List<RoomAtt> raList);
	// 호텔리스트
	List<Business> selectHotelList();
	// 호텔디테일
	Business selectHotel(int bus_code);

	// 관광지등록
	int insertTour(TourProduct tp);
	// 관광지리스트
	List<Business> selectTourList();
	// 관광지디테일
	Business selectTour(int bus_code);
	
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
	int insertReport(Report r);
	
	// 찜하기
	public int jjim(Jjim jjim);

	// 신고 카운트
	int countReport();  

	// Report의 rstatus 확인 메소드
	public Report findReportStatus(Report r);
	
	// 일반결제 메소드
	public int insertIncome(Income i);

	int insertBooking(Booking b);

	int insertPoint(Point p);
	
	public Point findPoint(Point p);

	// 배너 광고 등록 폼, 본인 사업장 가져오기
	List<Business> selectMyBusinessCategory(User loginUser);

	// 배너 광고 인서트
	int insertBannerAd(Alliance a);
	
	// 프리미엄 등록 시 만료일
	int insertIncome1(Income i);

	List<Alliance> selectBannerAdImgList();

	Business selectBusCodeUser(int bus_code);

	Business selectBannerAdDetail(Business selectBusCodeUser, boolean flag);

	Business getBusDetail(int bus_code);

	int insertMain(BusinessAtt bat);

	

	

	

	

	



	

	

	

	


	

	

	



	

	


  
}