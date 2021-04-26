package com.kh.samdado.admin.model.dao;

import java.util.List;

import com.kh.samdado.admin.model.vo.A_board;
import com.kh.samdado.admin.model.vo.PageInfo;
import com.kh.samdado.admin.model.vo.aSearch;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.common.model.vo.Alliance;
import com.kh.samdado.common.model.vo.Income;
import com.kh.samdado.common.model.vo.Report;
import com.kh.samdado.mypage.model.vo.Point;
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

	int updateAdmitBannerAdStatus(Alliance alliance);

	int updateRejectBannerAdStatusRI(Alliance alliance);

	int updateRejectBannerAdStatusRP(Alliance alliance);

	List<Report> searchReportList(aSearch search);

	List<Alliance> searchAllianceList(aSearch search);

	List<Alliance> admitbannerAdListSelect();

	int countAd2();

	List<Income> adminPremiumAdSelect(PageInfo pi);

	List<Income> searchPreAdList(aSearch search);

	List<Point> getPointList();

	List<Integer> selectGetProfit();

	Report selectReport(Report report);

	int updateRstatusToYAndNoRcount(Report report);

	Report selectReportRexdate(Report report);

	int insertAboard(A_board aboard);

	List<A_board> adminMainselectAboardList();

	int updateRstatusToEnd(Income adminPremiumAd);

	List<Income> selectGetAllProfit(Income profitRequestDto);







}
