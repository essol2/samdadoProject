package com.kh.samdado.route.model.dao;

import java.sql.Date;
import java.util.List;

import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.route.model.vo.Route;
import com.kh.samdado.route.model.vo.RouteFinal;
import com.kh.samdado.route.model.vo.SpotBus;
import com.kh.samdado.route.model.vo.TourSpot;
import com.kh.samdado.route.model.vo.rSearch;
import com.kh.samdado.user.model.vo.User;

public interface RouteDao {

	List<Route> routeSearch(rSearch search);

	List<SpotBus> spotSearch(String sTitle);
	
	List<SpotBus> clearChange(String[] chlist);
	
	int addRoute(String[] slist);

	int finalRoute(RouteFinal rf);

	List<SpotBus> changeRoute(String[] rrlist);

	List<SpotBus> spotSearch1(String sTitle);
}
