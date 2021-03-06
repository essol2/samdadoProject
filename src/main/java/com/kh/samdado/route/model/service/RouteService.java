package com.kh.samdado.route.model.service;

import java.sql.Date;
import java.util.List;

import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.route.model.vo.Route;
import com.kh.samdado.route.model.vo.RouteFinal;
import com.kh.samdado.route.model.vo.SpotBus;
import com.kh.samdado.route.model.vo.TourSpot;
import com.kh.samdado.route.model.vo.rSearch;
import com.kh.samdado.user.model.vo.User;

public interface RouteService {
	
	List<Route> routeSearch(rSearch search);	// 루트 검색
	
	public List<SpotBus> spotSearch(String sTitle);	// 여행지 검색

	List<TourSpot> clearChange(String[] chlist);	// 순서 변경 완료

	int addRoute(String[] slist);

	int finalRoute(RouteFinal rf);

	List<SpotBus> changeRoute(String[] rrlist);

	List<SpotBus> spotSearch1(String sTitle);



	
	
	
	
   
	

}