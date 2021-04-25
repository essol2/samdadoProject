package com.kh.samdado.business.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	// 사업장 사진
	@Override
	public List<BusinessAtt> selectAtt(int bus_code) {
		return sqlSession.selectList("businessMapper.selectAtt", bus_code);
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
	public int insertCar(List<Car> cars) {
		int result = 0;
		
		for(Car car : cars) {
			 sqlSession.insert("businessMapper.insertCar", car);
			 result ++;
		}
		return result;
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
	public int insertRoom(List<Room> rooms) {
		int result = 0;
		 for(Room room : rooms) { 
			 result += sqlSession.insert("businessMapper.insertRoom", room);
		 }
		 
		return result;
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

	// 신고하기
	@Override
	public int insertReport(Report r) {		
		return sqlSession.insert("businessMapper.insertReport", r);
	}
	
	@Override
	public int insertReport2(Report r) {
		return sqlSession.insert("businessMapper.insertReport2", r);
	}
	
	@Override
	public int updateReport(Report r) {		
		return sqlSession.update("businessMapper.updateReport", r);
	}
	
	// 찜하기
	@Override
	public int jjim(Jjim jjim) {
		return sqlSession.insert("businessMapper.jjim", jjim);
	}
	
	@Override
	public Map<String, Object> selectJjim(Map<String, Object> idxMap) {		
		return sqlSession.selectOne("businessMapper.selectJjim", idxMap);
	}
	
	@Override
	public Object insertJjim(Map<String, Object> commandMap) {			
		return sqlSession.insert("businessMapper.insertJjim", commandMap);
	}

	@Override
	public int updateJjim(Map<String, Object> commandMap) {
		return sqlSession.update("businessMapper.udpateJjim", commandMap);
	}
	
	// 리스트에서 사업장검색
	@Override
	public List<Business> searchTourList(BusinessSearch search) {
		return sqlSession.selectList("businessMapper.searchTourList", search);
	}
	
	@Override
	public List<Business> searchHotelList(BusinessSearch search) {
		return sqlSession.selectList("businessMapper.searchHotelList", search);
	}

	@Override
	public List<Business> searchResList(BusinessSearch search) {
		return sqlSession.selectList("businessMapper.searchResList", search);
	}

	@Override
	public List<Business> searchCarList(BusinessSearch search) {
		return sqlSession.selectList("businessMapper.searchCarList", search);
	}
	
	// 일반결제 메소드
	  @Override
		public int insertIncome(Income i) {
		  return sqlSession.insert("businessMapper.insertIncome", i);
		}

		@Override
		public int insertBookingHotel(Booking b) {
			return sqlSession.insert("businessMapper.insertBookingHotel", b);
		}
		
		@Override
		public int insertBookingTour(Booking b) {
			return sqlSession.insert("businessMapper.insertBookingTour", b);
		}
		
		@Override
		public TourProduct selectTourProduct(int bus_code) {			
			return sqlSession.selectOne("businessMapper.selectTourProduct", bus_code);
		}
		
		@Override
		public int insertBookingCar(Booking b) {
			return sqlSession.insert("businessMapper.insertBookingCar", b);
		}

		@Override
		public int insertPoint(Point p) {
			return sqlSession.insert("businessMapper.insertPoint", p);
		}
		
		@Override
		public Point findPoint(Point p) {			
			return sqlSession.selectOne("businessMapper.findPoint", p);
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

	// 지혜
    @Override
	public List<Business> selectMyBusinessCategory(User loginUser) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("businessMapper.selectMyBusinessCategory", loginUser);
	}

    // 지혜
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
	public int insertIncome1(Income i) {
		return sqlSession.insert("businessMapper.insertIncome1", i);
	}

    // 지혜
	@Override
	public List<Alliance> selectBannerAdImgList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("businessMapper.selectBannerAdImgList");
	}

	@Override
	public Business selectBannerAdDetail(Business selectBusCodeUser) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("businessMapper.selectBannerAdDetail", selectBusCodeUser);
	}

	
	@Override
	public Business selectBusCodeUser(int bus_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("businessMapper.selectBusCodeUser", bus_code);
	}

	@Override
	public int insertPointDeduction(Business selectBusCodeUser) {
		// TODO Auto-generated method stub
		return sqlSession.insert("businessMapper.insertPointDeduction", selectBusCodeUser);
	}

	@Override
	public int updateReadCount(Business selectBusCodeUser) {
		// TODO Auto-generated method stub
		return sqlSession.update("businessMapper.updateReadCount", selectBusCodeUser);
	}

	@Override
	public Business getBusDetail(int bus_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("businessMapper.getBusDetail", bus_code);

	}

	@Override
	public int insertPointColumn(Business selectBusCodeUser) {
		// TODO Auto-generated method stub
		return sqlSession.update("businessMapper.insertPointColumn", selectBusCodeUser);
	}

  @Override
	public int insertMain(BusinessAtt bat) {
		return sqlSession.insert("businessMapper.insertMain", bat);
	}

	@Override
	public List<Room> selectRoom(int bus_code) {
		return sqlSession.selectList("businessMapper.selectRoom", bus_code);
	}
	
	@Override
	public List<RoomAtt> selectRoomAtt(int bus_code) {
		return sqlSession.selectList("businessMapper.selectRoomAtt", bus_code);
	}

	@Override
	public List<Business> cateList(String kind) {
		return sqlSession.selectList("businessMapper.cateList", kind);
	}

	@Override
	public List<Car> selectCars(int bus_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("businessMapper.selectCars", bus_code);
	}

	@Override
	public List<CarAtt> selectCarAtt(int bus_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("businessMapper.selectCarAtt", bus_code);
	}

	@Override
	public List<Review> selectReview(int bus_code) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("businessMapper.selectReview", bus_code);
	}


	

	@Override
	public int insertMenu(List<BusinessAtt> menus) {
		return sqlSession.insert("businessMapper.insertMenu", menus);
	}


	@Override
	public List<Business> calList(String kind) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("businessMapper.calList", kind);
	}

	@Override
	public List<Business> priceList(Business kinds) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("businessMapper.calList");
	}
	
}
