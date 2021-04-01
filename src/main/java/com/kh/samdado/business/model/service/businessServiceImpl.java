package com.kh.samdado.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samdado.admin.model.vo.Report;
import com.kh.samdado.business.model.dao.businessDao;
import com.kh.samdado.business.model.vo.Alliance;
import com.kh.samdado.business.model.vo.Jjim;
import com.kh.samdado.business.model.vo.Review;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.business.model.vo.business.BusinessAtt;
import com.kh.samdado.business.model.vo.hotel.RoomBooking;
import com.kh.samdado.business.model.vo.rentcar.CarBooking;
import com.kh.samdado.business.model.vo.tour.TourBooking;

@Service
public class businessServiceImpl implements businessService {
	
    @Autowired
    private businessDao bDao;
   
	@Override
	public int insertAlliance(Alliance a) {
		// TODO Auto-generated method stub
		return bDao.insertAlliance(a);
	}


	@Override
	public int insertRestaurant(Business b) {
		return bDao.insertRestaurant(b);
	}

	@Override
	public int insertRestaurant2(BusinessAtt ba) {
		return bDao.insertRestaurant2(ba);
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
   
}