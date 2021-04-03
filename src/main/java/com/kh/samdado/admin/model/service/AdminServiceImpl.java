package com.kh.samdado.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samdado.admin.model.dao.AdminDao;
import com.kh.samdado.admin.model.vo.PageInfo;
import com.kh.samdado.admin.model.vo.Search;
import com.kh.samdado.mypage.model.vo.QnA;

@Service
public class AdminServiceImpl implements AdminService {
	
   @Autowired
   private AdminDao aDao;

	@Override
	public List<QnA> adminMainQnaSelect() {
		// TODO Auto-generated method stub
		return aDao.adminMainQnaSelect();
	}

	@Override
	public List<QnA> adminQnaSelect(PageInfo pi) {
		// TODO Auto-generated method stub
		return aDao.adminQnaSelect(pi);
	}

	@Override
	public int insertQnaReply(QnA q) {
		// TODO Auto-generated method stub
		return aDao.insertQnaReply(q);
	}

	@Override
	public int countQnA() {
		// TODO Auto-generated method stub
		return aDao.countQnA();
	}

	@Override
	public List<QnA> searchQnaList(Search search) {
		// TODO Auto-generated method stub
		return aDao.searchQnaList(search);
	}


   
}