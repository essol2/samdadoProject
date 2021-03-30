package com.kh.samdado.bussiness.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samdado.bussiness.model.dao.bussinessDao;
import com.kh.samdado.bussiness.model.vo.Alliance;

@Service
public class bussinessServiceImpl implements bussinessService {
	
    @Autowired
    private bussinessDao bDao;
   
	@Override
	public int insertAlliance(Alliance a) {
		// TODO Auto-generated method stub
		return bDao.insertAlliance(a);
	}
   
}