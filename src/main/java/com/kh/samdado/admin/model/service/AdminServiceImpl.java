package com.kh.samdado.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samdado.admin.model.dao.AdminDao;
import com.kh.samdado.mypage.model.vo.QnA;

@Service
public class AdminServiceImpl implements AdminService {
	
   @Autowired
   private AdminDao aDao;

@Override
public List<QnA> adminMainQnaSelect() {
	// TODO Auto-generated method stub
	return null;
}
   
  
   
}