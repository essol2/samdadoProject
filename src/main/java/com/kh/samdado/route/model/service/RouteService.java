package com.kh.samdado.route.model.service;

import java.util.List;

import com.kh.samdado.route.model.vo.Route;
import com.kh.samdado.route.model.vo.TourSpot;

public interface RouteService {
	
	public List<Route> routeSearch();	// 루트 검색

	public int spotDelete(); 			// 여행지 삭제
	
	public List<TourSpot> spotSearch();	// 여행지 검색
	
	public int spotAdd();				// 여행지 추가
	
	public int routeChange();			// 루트 수정
	
	public int routeAdd();				// 루트 저장
	
	
	
	
   
	

}