package com.kh.samdado.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samdado.admin.model.dao.AdminDao;
import com.kh.samdado.admin.model.vo.PageInfo;
import com.kh.samdado.admin.model.vo.aSearch;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.common.model.vo.Report;
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
	public List<QnA> searchQnaList(aSearch search) {
		// TODO Auto-generated method stub
		return aDao.searchQnaList(search);
	}

	@Override
	public List<Report> adminReportSelect(PageInfo pi) {
		// TODO Auto-generated method stub
		return aDao.adminReportSelect(pi);
	}

	@Override
	public int updateRstatusToY(Report report) {
		// TODO Auto-generated method stub
		return aDao.updateRstatusToY(report);
	}

	@Override
	public int updateRstatusToYAndRexdate(Report report) {
		// TODO Auto-generated method stub
		return aDao.updateRstatusToYAndRexdate(report);
	}

	@Override
	public int updateRstatusToR(Report report) {
		// TODO Auto-generated method stub
		return aDao.updateRstatusToR(report);
	}

	@Override
	public List<Business> adminMainBusinessSelect() {
		// TODO Auto-generated method stub
		return aDao.adminMainBusinessSelect();
	}

	@Override
	public int countAd1() {
		// TODO Auto-generated method stub
		return aDao.countAd1();
	}



}