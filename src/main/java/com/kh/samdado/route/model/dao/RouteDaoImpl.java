package com.kh.samdado.route.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.route.model.vo.Route;
import com.kh.samdado.route.model.vo.TourSpot;

@Repository 
public class RouteDaoImpl implements RouteDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Route> routeSearch() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int spotDelete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TourSpot> spotSearch() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int spotAdd() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int routeChange() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int routeAdd() {
		// TODO Auto-generated method stub
		return 0;
	}


}
