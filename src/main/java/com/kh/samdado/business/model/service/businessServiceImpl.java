package com.kh.samdado.business.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samdado.business.model.dao.businessDao;
import com.kh.samdado.business.model.vo.Alliance;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.business.model.vo.business.BusinessAtt;

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
	public int inserthotel() {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int inserttour() {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int insertrentcar() {
		// TODO Auto-generated method stub
		return 0;
	}
   
}