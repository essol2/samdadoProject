package com.kh.samdado.route.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samdado.route.model.dao.RouteDao;
import com.kh.samdado.route.model.vo.Route;
import com.kh.samdado.route.model.vo.Search;
import com.kh.samdado.route.model.vo.TourSpot;


@Service
public class RouteServiceImpl implements RouteService {
	
   @Autowired
   private RouteDao rDao;
	
	@Override
	public List<Route> routeSearch(Search search) {
		return rDao.routeSearch(search);
	}
	
	@Override
	public int spotDelete() {
		// TODO Auto-generated method stub
		return rDao.spotDelete();
	}
	
	@Override
	public List<TourSpot> spotSearch() {
		// TODO Auto-generated method stub
		return rDao.spotSearch();
	}
	
	@Override
	public int spotAdd() {
		// TODO Auto-generated method stub
		return rDao.spotAdd();
	}
	
	@Override
	public int routeChange() {
		// TODO Auto-generated method stub
		return rDao.routeChange();
	}
	
	@Override
	public int routeAdd() {
		// TODO Auto-generated method stub
		return rDao.routeAdd();
	}
 
   
}