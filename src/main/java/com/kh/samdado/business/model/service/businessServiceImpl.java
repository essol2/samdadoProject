package com.kh.samdado.business.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.samdado.business.model.dao.businessDao;
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

@Service
public class businessServiceImpl implements businessService {
	
    @Autowired businessDao bDao;
   
	@Override
	public int insertAlliance(Alliance a) {
		// TODO Auto-generated method stub
		return bDao.insertAlliance(a);
	}

	// 사업장 등록
	@Override
	public int insertBusiness(Business b, List<BusinessAtt> list) {
		bDao.insertBusiness(b);
		return bDao.insertBusAtt(list);
	}
	// 사업장 리스트 카운드
	@Override
	public int selectResListCount() {
		return bDao.selectResListCount();
	}
	// 사업장 사진
	@Override
	public List<BusinessAtt> selectAtt(int bus_code) {
		return bDao.selectAtt(bus_code);
	}

	
	// 음식점 디테일
	@Override
	public Business selectRestaurant(int bus_code) {
		return bDao.selectRestaurant(bus_code);
	}
	// 음식점 리스트 가져오기
	@Override
	public List<Business> selectResList() {
		return bDao.selectResList();
	}

	
	// 렌트카 등록
	@Override
	public int insertCar(List<Car> cars) {
		return bDao.insertCar(cars);
	}

	// 렌트카 디테일
	@Override
	public Business selectCar(int bus_code) {
		return bDao.selectCar(bus_code);
	}
	// 렌트카리스트
	@Override
	public List<Business> selectCarList() {
		return bDao.selectCarList();
	}

	// 호텔 등록
	@Override
	public int insertRoom(List<Room> rooms) {
		return bDao.insertRoom(rooms);
	}
	// 호텔리스트
	@Override
	public List<Business> selectHotelList() {
		return bDao.selectHotelList();
	}
	// 호텔프리미엄리스트
	@Override
	public List<Business> selectHotelListP() {
		return bDao.selectHotelListP();
	}
	// 호텔디테일
	@Override
	public Business selectHotel(int bus_code) {
		return bDao.selectHotel(bus_code);
	}
	
	// 관광지 등록
	@Override
	public int insertTour(TourProduct tp) {
		return bDao.insertTour(tp);
	}
	// 관광지리스트
	@Override
	public List<Business> selectTourList() {
		return bDao.selectTourList();
	}
	// 관광지 디테일
	@Override
	public Business selectTour(int bus_code) {
		return bDao.selectTour(bus_code);
	}

	@Override
	public int bookingTour(TourBooking tourbooking) {
		// TODO Auto-generated method stub
		return 0;
  }
	
	@Override
	public int bookingHotel(RoomBooking roombooking) {
    // TODO Auto-generated method stub
		return 0;
  }
  
	@Override

	public int bookingCar(CarBooking carbooking) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Business> businessSearch() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int insertReview(Review review) {
		// TODO Auto-generated method stub
		return 0;
	}


	// 신고하기
	@Override
	public int insertReport(Report r) {			
		return bDao.insertReport(r);
	}
	
	@Override
	public int insertReport2(Report r) {		
		return bDao.insertReport2(r);
	}
	
	@Override
	public int updateReport(Report r) {		
		return bDao.updateReport(r);
	}


	@Override
	public int jjim(Jjim jjim) {
  // TODO Auto-generated method stub
		return 0;
  }
	
	@Override
	public Map<String, Object> jjimcheck(Map<String, Object> idxMap) {			
		return bDao.selectJjim(idxMap);
	}
	
	@Override
	public Object insertJjim(Map<String, Object> commandMap) {			
		return bDao.insertJjim(commandMap);
		
	}
	
	@Override
	public int updateJjim(Map<String, Object> commandMap) {
		return bDao.updateJjim(commandMap);
		
	}
	
	// 리스트에서 사업장검색
	@Override
	public List<Business> searchTourList(BusinessSearch search) {		
		return bDao.searchTourList(search);
	}
	
	@Override
	public List<Business> searchHotelList(BusinessSearch search) {		
		return bDao.searchHotelList(search);
	}

	@Override
	public List<Business> searchResList(BusinessSearch search) {
		return bDao.searchResList(search);
	}

	@Override
	public List<Business> searchCarList(BusinessSearch search) {
		return bDao.searchCarList(search);
	}
	
	// 일반결제 메소드
	@Override
	public int insertIncome(Income i) {		
		return bDao.insertIncome(i);
	}

	@Override
	public int insertBookingHotel(Booking b) {		
		return bDao.insertBookingHotel(b);
	}
	
	@Override
	public int insertBookingTour(Booking b) {		
		return bDao.insertBookingTour(b);
	}
	
	@Override
	public TourProduct selectTourProduct(int bus_code) {		
		return bDao.selectTourProduct(bus_code);
	}
	
	@Override
	public int insertBookingCar(Booking b) {		
		return bDao.insertBookingCar(b);
	}

	@Override
	public int insertPoint(Point p) {
		// TODO Auto-generated method stub
		return bDao.insertPoint(p);
	}
	
	@Override
	public Point findPoint(Point p) {
		// TODO Auto-generated method stub
		return bDao.findPoint(p);
	}
	
	@Override
	public int updateUserPblance(User u) {
		return bDao.updateUserPblance(u);
	}

	// 지혜
	@Override
	public int countReport() {
		// TODO Auto-generated method stub
		return bDao.countReport();
	}
	
  @Override
	public List<Business> selectMyBusinessCategory(User loginUser) {
		// TODO Auto-generated method stub
		return bDao.selectMyBusinessCategory(loginUser);
	}

	@Override
	public int insertBannerAd(Alliance a) {
		// TODO Auto-generated method stub
		return bDao.insertBannerAd(a);
	}

  @Override
	public Report findReportStatus(Report r) {		
		return bDao.findReportStatus(r);
	}
  
  @Override
	public List<Report> findReportRexdate() {
	  	return bDao.findReportRexdate();
	}
  
  @Override
	public int updateRexdate(Report r) {
	  	return bDao.updateRexdate(r);
	}
  
  @Override
	public List<Income> findIncomeExdate() {		
	  return bDao.findIncomeExdate();
	}
  
  @Override
	public int updateExdate(Income i) {
	  return bDao.updateExdate(i);
	}
  
  @Override
	public int updateBusClassify(int bus_code) {
	  return bDao.updateBusClassify(bus_code);
	}

  	// 프리미엄 등록 시 만료일
	@Override
	public int insertIncome1(Income i) {
		return bDao.insertIncome1(i);
	}

	@Override
	public List<Alliance> selectBannerAdImgList() {
		// TODO Auto-generated method stub
		return bDao.selectBannerAdImgList();
	}

	@Override
	public Business selectBannerAdDetail(Business selectBusCodeUser, boolean flag) {
			if(flag) {
				bDao.updateReadCount(selectBusCodeUser);		// 배너 조회수 카운트 업데이트
				bDao.insertPointDeduction(selectBusCodeUser);	// 포인트 컬럽 인서트
				bDao.insertPointColumn(selectBusCodeUser);
			}
			
		return bDao.selectBannerAdDetail(selectBusCodeUser);
	}


	@Override
	public Business selectBusCodeUser(int bus_code) {
		// TODO Auto-generated method stub
		return bDao.selectBusCodeUser(bus_code);
	}

	@Override
	public Business getBusDetail(int bus_code) {
		// TODO Auto-generated method stub
		return bDao.getBusDetail(bus_code);
	}

	// 메인사진
	@Override
	public int insertMain(BusinessAtt bat) {
		return bDao.insertMain(bat);
	}

	@Override
	public List<Room> selectRoom(int bus_code) {
		return bDao.selectRoom(bus_code);
	}

	@Override
	public List<RoomAtt> selectRoomAtt(int bus_code) {
		return bDao.selectRoomAtt(bus_code);
	}

	@Override
	public List<Business> cateList(String kind) {
		return bDao.cateList(kind);
	}

	@Override
	public List<Car> selectCars(int bus_code) {
		// TODO Auto-generated method stub
		return bDao.selectCars(bus_code);
	}

	@Override
	public List<CarAtt> selectCarAtt(int bus_code) {
		// TODO Auto-generated method stub
		return bDao.selectCarAtt(bus_code);
	}

	@Override
	public List<Review> selectReview(int bus_code) {
		// TODO Auto-generated method stub
		return bDao.selectReview(bus_code);
	}

	@Override
	public int insertMenu(List<BusinessAtt> menus) {
		// TODO Auto-generated method stub
		return bDao.insertMenu(menus);
	}

	@Override
	public List<Business> calList(String kind) {
		// TODO Auto-generated method stub
		return bDao.calList(kind);
	}

	@Override
	public List<Business> priceList(Business kinds) {
		// TODO Auto-generated method stub
		return bDao.priceList(kinds);
	}

	@Override
	public List<Alliance> selectAlli() {
		// TODO Auto-generated method stub
		return bDao.selectAlli();
	}

	@Override
	public List<Review> selectReviewList() {
		// TODO Auto-generated method stub
		return bDao.selectReviewList();
	}

	@Override
	public List<Business> starList() {
		// TODO Auto-generated method stub
		return bDao.starList();
	}

	@Override
	public List<Business> reviewList() {
		// TODO Auto-generated method stub
		return bDao.reviewList();
	}

	@Override
	public List<Business> facList(String kind) {
		// TODO Auto-generated method stub
		return bDao.facList(kind);
	}

	@Override
	public List<Business> rescateList(String kind) {
		// TODO Auto-generated method stub
		return bDao.rescateList(kind);
	}

	

	

	

	

	

	

	

	

	

	

	


	
   
}