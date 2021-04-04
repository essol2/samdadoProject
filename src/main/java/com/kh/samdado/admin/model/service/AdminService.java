package com.kh.samdado.admin.model.service;

import java.util.List;

import com.kh.samdado.admin.model.vo.PageInfo;
import com.kh.samdado.admin.model.vo.Search;
import com.kh.samdado.common.model.vo.Report;
import com.kh.samdado.mypage.model.vo.QnA;

public interface AdminService {

	List<QnA> adminMainQnaSelect();

	List<QnA> adminQnaSelect(PageInfo pi);

	int insertQnaReply(QnA q);

	// 신규 QnA 갯수 select
	int countQnA();

	// QnA 검색 
	List<QnA> searchQnaList(Search search);

	List<Report> adminReportSelect(PageInfo pi);

	
   


}