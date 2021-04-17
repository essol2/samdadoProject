package com.kh.samdado.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.samdado.business.model.dao.businessDao;
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
	public int insertCar(List<Car> cars, List<CarAtt> carList) {
		bDao.insertCar(cars);
		return bDao.insertCarAtt(carList);
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
	public int insertRoom(List<Room> rooms, List<RoomAtt> raList) {
		bDao.insertRoom(rooms);
		return bDao.insertRoomAtt(raList);
	}
	// 호텔리스트
	@Override
	public List<Business> selectHotelList() {
		return bDao.selectHotelList();
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
	public List<Business> selectTour(int bus_code) {
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
	public int jjim(Jjim jjim) {
  // TODO Auto-generated method stub
		return 0;
  }
	
	// 일반결제 메소드
	@Override
	public int insertIncome(Income i) {
		// TODO Auto-generated method stub
		return bDao.insertIncome(i);
	}

	@Override
	public int insertBooking(Booking b) {
		// TODO Auto-generated method stub
		return bDao.insertBooking(b);
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

  	// 프리미엄 등록 시 만료일
	@Override
	public int insertIncome1(Income i) {
		return bDao.insertIncome(i);
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



	
   
}