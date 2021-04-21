package com.kh.samdado.route.model.dao;

import java.util.List;

import com.kh.samdado.route.model.vo.Route;
import com.kh.samdado.route.model.vo.TourSpot;
import com.kh.samdado.route.model.vo.rSearch;

public interface RouteDao {

	List<Route> routeSearch(rSearch search);

	List<TourSpot> spotSearch(String sTitle);
	
	List<TourSpot> clearChange(String[] chlist);
	
	
	int spotDelete();
	int spotAdd();
	int routeAdd();
}
