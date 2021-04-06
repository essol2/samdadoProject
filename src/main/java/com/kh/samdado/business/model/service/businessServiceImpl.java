package com.kh.samdado.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.kh.samdado.business.model.vo.tour.TourBooking;
import com.kh.samdado.business.model.vo.tour.TourProduct;
import com.kh.samdado.common.model.vo.Alliance;
import com.kh.samdado.common.model.vo.Report;
import com.kh.samdado.user.model.vo.User;

@Service
public class businessServiceImpl implements businessService {
	
    @Autowired
    private businessDao bDao;
   
	@Override
	public int insertAlliance(Alliance a) {
		// TODO Auto-generated method stub
		return bDao.insertAlliance(a);
	}

	// 사업장 등록
	@Override
	public int insertBusAtt(BusinessAtt ba) {
		return bDao.insertBusAtt(ba);
	}
	@Override
	public int insertBusiness(Business b) {
		return bDao.insertBusiness(b);
	}

	// 렌트카 등록
	@Override
	public int insertCar(Car c) {
		return bDao.insertCar(c);
	}
	@Override
	public int insertCarAtt(CarAtt ca) {
		return bDao.insertCarAtt(ca);
	}
	
	// 호텔 등록
	@Override
	public int insertRoomAtt(RoomAtt ra) {
		return bDao.insertRoomAtt(ra);
	}
	@Override
	public int insertRoom(Room r) {
		return bDao.insertRoom(r);
	}
	
	// 투어 등록
	@Override
	public int insertTour(TourProduct tp) {
		return bDao.insertTour(tp);
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


	@Override
	public int report(Report report) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int jjim(Jjim jjim) {
  // TODO Auto-generated method stub
		return 0;
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

	


	
  


	
   
}