package com.kh.samdado.business.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.samdado.business.model.vo.BusinessSearch;
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
import com.kh.samdado.mypage.model.vo.Booking;
import com.kh.samdado.mypage.model.vo.Point;
import com.kh.samdado.user.model.vo.User;

public interface businessDao {

	int insertAlliance(Alliance a);
	
	// 사업장 등록
	int insertBusAtt(List<BusinessAtt> list);
	int insertBusiness(Business b);
	// 사업장 사진
	List<BusinessAtt> selectAtt(int bus_code);

	// 사업장 리스트 카운트
	int selectResListCount();
	
	// 음식점 디테일
	Business selectRestaurant(int bus_code);
	// 사업장 리스트 가져오기
	List<Business> selectResList();
	// 렌트카등록
	int insertCar(List<Car> cars);
	// 렌트카 디테일
	Business selectCar(int bus_code);
	// 렌트카 리스트
	List<Business> selectCarList();
	
	// 호텔등록
	int insertRoom(List<Room> rooms);
	// 호텔리스트
	List<Business> selectHotelList();
	
	List<Business> selectHotelListP();
	// 호텔디테일
	Business selectHotel(int bus_code);
	
	// 관광지등록
	int insertTour(TourProduct tp);
	// 관광지페이지
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
	
	int insertReport2(Report r);
	
	int updateReport(Report r);

		  
	// 찜하기
	public int jjim(Jjim jjim);
	
	Map<String, Object> selectJjim(Map<String, Object> idxMap);
	
	Object insertJjim(Map<String, Object> commandMap);

	public int updateJjim(Map<String, Object> commandMap);
	
	// 리스트에서 사업장 검색
	List<Business> searchTourList(BusinessSearch search);
	
	List<Business> searchHotelList(BusinessSearch search);

	List<Business> searchResList(BusinessSearch search);

	List<Business> searchCarList(BusinessSearch search);

	// ************************** 지혜
	// 신고 카운트
	int countReport();
	
	// Report의 rstatus 확인 메소드
	public Report findReportStatus(Report r);
	
	List<Report> findReportRexdate();
	
	int updateRexdate(Report r);
	
	// Income의 exdate 확인 메소드
	List<Income> findIncomeExdate();
	
	int updateExdate(Income i);
	
	int updateBusClassify(int bus_code);

	// 일반결제 메소드
	int insertIncome(Income i);

	int insertBookingHotel(Booking b);
	
	int insertBookingTour(Booking b);
	
	TourProduct selectTourProduct(int bus_code);
	
	int insertBookingCar(Booking b);

	int insertPoint(Point p);
	
	public Point findPoint(Point p);

	// 비즈니스 등록 폼, 본인이 등록한 사업장 셀렉
	List<Business> selectMyBusinessCategory(User loginUser);

	//배너 광고 인서트
	int insertBannerAd(Alliance a);


	// 프리미엄 등록 시 
	int insertIncome1(Income i);

	List<Alliance> selectBannerAdImgList();

	Business selectBannerAdDetail(Business selectBusCodeUser);

	Business selectBusCodeUser(int bus_code);

	int insertPointDeduction(Business selectBusCodeUser);

	int updateReadCount(Business selectBusCodeUser);

	Business getBusDetail(int bus_code);


	int insertPointColumn(Business selectBusCodeUser);

	int insertMain(BusinessAtt bat);

	List<Room> selectRoom(int bus_code);
	List<RoomAtt> selectRoomAtt(int bus_code);

	List<Business> cateList(String kind);

	List<Car> selectCars(int bus_code);

	List<CarAtt> selectCarAtt(int bus_code);

	List<Review> selectReview(int bus_code);

	int insertMenu(List<BusinessAtt> menus);

	List<Business> calList(String kind);

	List<Business> priceList(Business kinds);

	List<Alliance> selectAlli();

	List<Review> selectReviewList();

	List<Business> starList();

	List<Business> reviewList();

	List<Business> facList(String kind);

	List<Business> rescateList(String kind);

	

	

	

	

	

	

	

	

	



	










	

	

	
	

	
	

	



}
