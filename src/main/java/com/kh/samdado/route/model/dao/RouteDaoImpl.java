package com.kh.samdado.route.model.dao;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.route.model.vo.Route;
import com.kh.samdado.route.model.vo.RouteFinal;
import com.kh.samdado.route.model.vo.SpotBus;
import com.kh.samdado.route.model.vo.TourSpot;
import com.kh.samdado.route.model.vo.rSearch;
import com.kh.samdado.user.model.vo.User;

@Repository 
public class RouteDaoImpl implements RouteDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Route> routeSearch(rSearch search) {
		return sqlSession.selectList("routeMapper.routeSearch", search);
	}
	
	@Override
	public List<SpotBus> spotSearch(String sTitle) {
		return sqlSession.selectList("routeMapper.spotSearch", sTitle);
	}
	
	@Override
	public List<SpotBus> clearChange(String[] chlist) {
		
		System.out.println("chlist dao: " + Arrays.toString(chlist));
		
		return sqlSession.selectList("routeMapper.clearChange", chlist);
	}

	@Override
	public int addRoute(String[] slist) {
		
		/* System.out.println("dao: " + Arrays.toString(slist)); */
		
		return sqlSession.insert("routeMapper.addRoute", slist);
	}

	@Override
	public int finalRoute(RouteFinal rf) {
		
		/* System.out.println("dao: " + rf); */
		
		return sqlSession.insert("routeMapper.finalRoute", rf);
	}

	@Override
	public List<SpotBus> changeRoute(String[] rrlist) {
		
		/* System.out.println("dao 루트: " + Arrays.toString(rrlist)); */
		
		return sqlSession.selectList("routeMapper.changeRoute", rrlist);
	}

	@Override
	public List<SpotBus> spotSearch1(String sTitle) {
		return sqlSession.selectList("routeMapper.spotSearch1", sTitle);
	}

	@Override
	public List<Business> jjimBusiness(User u) {
		return sqlSession.selectList("routeMapper.jjimBusiness", u);
	}

	

	


}
