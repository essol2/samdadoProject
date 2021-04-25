package com.kh.samdado.route.model.dao;

import java.sql.Date;
import java.util.List;

import com.kh.samdado.route.model.vo.Route;
import com.kh.samdado.route.model.vo.RouteFinal;
import com.kh.samdado.route.model.vo.TourSpot;
import com.kh.samdado.route.model.vo.rSearch;
import com.kh.samdado.user.model.vo.User;

public interface RouteDao {

	List<Route> routeSearch(rSearch search);

	List<TourSpot> spotSearch(String sTitle);
	
	List<TourSpot> clearChange(String[] chlist);
	
	
	int spotDelete();
	int spotAdd();
	
	int addRoute(String[] slist);

	int finalRoute(RouteFinal rf);

	List<Route> changeRoute(String[] rrlist);
}
