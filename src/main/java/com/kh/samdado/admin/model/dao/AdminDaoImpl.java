package com.kh.samdado.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.admin.model.vo.PageInfo;
import com.kh.samdado.admin.model.vo.aSearch;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.common.model.vo.Alliance;
import com.kh.samdado.common.model.vo.Income;
import com.kh.samdado.common.model.vo.Report;
import com.kh.samdado.mypage.model.vo.Point;
import com.kh.samdado.mypage.model.vo.QnA;
import com.kh.samdado.user.model.vo.User;

@Repository 
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QnA> adminMainQnaSelect() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.selectAdminMainQnaSelect");
	}

	@Override
	public List<QnA> adminQnaSelect(PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("adminMapper.adminQnaSelect", null, rowBounds);
	}

	@Override
	public int insertQnaReply(QnA q) { // update
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.insertQnaReply", q);
	}

	@Override
	public int countQnA() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.countQnA");
	}

	@Override
	public List<QnA> searchQnaList(aSearch search) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.searchQnaList", search);
	}

	@Override
	public List<Report> adminReportSelect(PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("adminMapper.adminReportSelect", null, rowBounds);
	}

	@Override
	public int updateRstatusToY(Report report) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateRstatusToY", report);
	}

	@Override
	public int updateRstatusToYAndRexdate(Report report) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateRstatusToYAndRexdate", report);
	}

	@Override
	public int updateRstatusToR(Report report) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateRstatusToR", report);
	}

	@Override
	public List<Business> adminMainBusinessSelect() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.adminMainBusinessSelect");
	}

	@Override
	public int countAd1() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.countAd1");
	}

	@Override
	public List<Alliance> adminbannerAdSelect(PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("adminMapper.adminbannerAdSelect", null, rowBounds);
	}

	@Override
	public int updateAdmitBannerAdStatus(Alliance alliance) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateAdmitBannerAdStatus", alliance);
	}

	@Override
	public int updateRejectBannerAdStatusRI(Alliance alliance) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateRejectBannerAdStatusRI", alliance);
	}

	@Override
	public int updateRejectBannerAdStatusRP(Alliance alliance) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateRejectBannerAdStatusRP", alliance);
	}

	@Override
	public List<Report> searchReportList(aSearch search) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.searchReportList", search);
	}

	@Override
	public List<Alliance> searchAllianceList(aSearch search) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.searchAllianceList", search);
	}

	@Override
	public List<Alliance> admitbannerAdListSelect() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.admitbannerAdListSelect");
	}

	@Override
	public int countAd2() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.countAd2");
	}

	@Override
	public List<Income> adminPremiumAdSelect(PageInfo pi) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.adminPremiumAdSelect", pi);
	}

	@Override
	public List<Income> searchPreAdList(aSearch search) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.searchPreAdList", search);
	}

	@Override
	public List<Point> getPointList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.getPointList");
	}

	@Override
	public List<Integer> selectGetProfit() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.selectGetProfit");
	}



}
