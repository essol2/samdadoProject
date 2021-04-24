package com.kh.samdado.route.model.dao;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.route.model.vo.Route;
import com.kh.samdado.route.model.vo.RouteFinal;
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
	public List<TourSpot> spotSearch(String sTitle) {
		return sqlSession.selectList("routeMapper.spotSearch", sTitle);
	}
	
	@Override
	public List<TourSpot> clearChange(String[] chlist) {
		return sqlSession.selectList("routeMapper.clearChange", chlist);
	}
	
	@Override
	public int spotAdd() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int spotDelete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addRoute(String[] slist) {
		
		System.out.println("dao: " + Arrays.toString(slist));
		
		return sqlSession.insert("routeMapper.addRoute", slist);
	}

	@Override
	public int finalRoute(RouteFinal rf) {
		
		System.out.println("dao: " + rf);
		
		return sqlSession.insert("routeMapper.finalRoute", rf);
	}

	

	


}
