package com.kh.samdado.route.model.dao;

import java.util.List;

import com.kh.samdado.route.model.vo.Route;
import com.kh.samdado.route.model.vo.Search;
import com.kh.samdado.route.model.vo.TourSpot;

public interface RouteDao {

	List<Route> routeSearch(Search search);

	int spotDelete();

	List<TourSpot> spotSearch();

	int spotAdd();

	int routeChange();

	int routeAdd();
	

}
