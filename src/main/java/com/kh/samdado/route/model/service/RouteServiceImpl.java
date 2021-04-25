package com.kh.samdado.route.model.service;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samdado.route.model.dao.RouteDao;
import com.kh.samdado.route.model.vo.Route;
import com.kh.samdado.route.model.vo.RouteFinal;
import com.kh.samdado.route.model.vo.TourSpot;
import com.kh.samdado.route.model.vo.rSearch;
import com.kh.samdado.user.model.vo.User;

@Service
public class RouteServiceImpl implements RouteService {
	
   @Autowired
   private RouteDao rDao;
	
	@Override
	public List<Route> routeSearch(rSearch search) {
		
		/* System.out.println("service - search: " + search); */
		
		return rDao.routeSearch(search);
	}
	
	@Override
	public List<TourSpot> spotSearch(String sTitle) {
		return rDao.spotSearch(sTitle);
	}
	
	@Override
	public List<TourSpot> clearChange(String[] chlist) {
		return rDao.clearChange(chlist);
	}
	
	
	@Override
	public int spotDelete() {
		// TODO Auto-generated method stub
		return rDao.spotDelete();
	}

	@Override
	public int addRoute(String[] slist) {
		
		/* System.out.println("서비스: " + Arrays.toString(slist)); */
		
		return rDao.addRoute(slist);
	}

	@Override
	public int routeAdd() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int finalRoute(RouteFinal rf) {
		
		System.out.println("서비스: " + rf);
		
		return rDao.finalRoute(rf);
	}

	@Override
	public List<Route> changeRoute(String[] rrlist) {
		
		System.out.println("변경하기 루트 어레이: " + Arrays.toString(rrlist));
		
		return rDao.changeRoute(rrlist);
	}

	

	
 
   
}