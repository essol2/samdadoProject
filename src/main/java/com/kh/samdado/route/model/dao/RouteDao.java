package com.kh.samdado.route.model.dao;

import java.util.List;

import com.kh.samdado.route.model.vo.Route;
import com.kh.samdado.route.model.vo.TourSpot;
import com.kh.samdado.route.model.vo.rSearch;

public interface RouteDao {

	List<Route> routeSearch(rSearch search);

	int spotDelete();

	List<TourSpot> spotSearch(String sTitle);

	int spotAdd();

	int routeChange();

	int routeAdd();
	

}
