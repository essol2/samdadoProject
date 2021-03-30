package com.kh.samdado.listpage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samdado.listpage.model.dao.ListpageDao;
import com.kh.samdado.listpage.model.vo.Alliance;
import com.kh.samdado.user.model.dao.UserDao;
import com.kh.samdado.user.model.vo.User;

@Service
public class ListpageServiceImpl implements ListpageService {
	
    @Autowired
    private ListpageDao lDao;
   
	@Override
	public int insertAlliance(Alliance a) {
		// TODO Auto-generated method stub
		return lDao.insertAlliance(a);
	}
   
}