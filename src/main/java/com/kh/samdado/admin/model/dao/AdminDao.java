package com.kh.samdado.admin.model.dao;

import java.util.List;

import com.kh.samdado.admin.model.vo.PageInfo;
import com.kh.samdado.admin.model.vo.aSearch;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.common.model.vo.Alliance;
import com.kh.samdado.common.model.vo.Report;
import com.kh.samdado.mypage.model.vo.QnA;

public interface AdminDao {

	List<QnA> adminMainQnaSelect();

	List<QnA> adminQnaSelect(PageInfo pi);

	int insertQnaReply(QnA q);

	int countQnA();

	List<QnA> searchQnaList(aSearch search);	

	List<Report> adminReportSelect(PageInfo pi);

	int updateRstatusToY(Report report);

	int updateRstatusToYAndRexdate(Report report);

	int updateRstatusToR(Report report);

	List<Business> adminMainBusinessSelect();

	int countAd1();

	List<Alliance> adminbannerAdSelect(PageInfo pi);


}
