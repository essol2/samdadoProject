package com.kh.samdado.route.model.service;

import java.util.List;

import com.kh.samdado.route.model.vo.Route;
import com.kh.samdado.route.model.vo.TourSpot;
import com.kh.samdado.route.model.vo.rSearch;

public interface RouteService {
	
	List<Route> routeSearch(rSearch search);	// 루트 검색

	public int spotDelete(); 			// 여행지 삭제
	
	public List<TourSpot> spotSearch(String sTitle);	// 여행지 검색
	
	public int spotAdd();				// 여행지 추가

	public int routeAdd();				// 루트 저장

	List<TourSpot> clearChange(String[] chlist);	// 순서 변경 완료



	
	
	
	
   
	

}