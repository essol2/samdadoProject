package com.kh.samdado.route.model.service;

import java.sql.Date;
import java.util.List;

import com.kh.samdado.route.model.vo.Route;
import com.kh.samdado.route.model.vo.RouteFinal;
import com.kh.samdado.route.model.vo.TourSpot;
import com.kh.samdado.route.model.vo.rSearch;
import com.kh.samdado.user.model.vo.User;

public interface RouteService {
	
	List<Route> routeSearch(rSearch search);	// 루트 검색

	public int spotDelete(); 			// 여행지 삭제
	
	public List<TourSpot> spotSearch(String sTitle);	// 여행지 검색
	
	public int routeAdd();				// 루트 저장

	List<TourSpot> clearChange(String[] chlist);	// 순서 변경 완료

	int addRoute(String[] slist);

	int finalRoute(RouteFinal rf);



	
	
	
	
   
	

}