package com.kh.samdado.route.controller;

import java.sql.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.samdado.route.model.service.RouteService;
import com.kh.samdado.route.model.vo.Search;

@Controller
@RequestMapping("/route")
public class RouteController {
	@Autowired
	private RouteService rService;
	
	@GetMapping("/m_route")				// 길 만들기 페이지로 이동
	public String route() {
		return "route/route_main";
	}
	
	@GetMapping("/search")
	public String searchRoute(Model model, 
							@RequestParam("area") String area, 
							@RequestParam("thema") String thema, 
							@RequestParam("routeDate") Date routeDate ) {		// 루트 검색

		model.addAttribute("area", area);
		model.addAttribute("thema", thema);
		model.addAttribute("routeDate", routeDate);
		
		return "route/route_result";
	}

	
	public String deleteSpot() {		// 여행지 삭제
		
		return "";
	}
	
	public String searchSpot() {		// 여행지 검색
		return "";
	}
	
	public String addSpot() {			// 여행지 추가
		return "";
	}
	
	public String changeRoutePage() {	// 여행지 순서 바꾸기 페이지로 이동
		return "";
	}
	
	public String changeRoute() {		// 여행지 순서 바꾸기 완료
		return "";
	}
	
	public String addRoute() {			// 루트 저장하기
		return "";
	}
	
	public String goRoom() {			// 숙박 페이지로 이동
		return "";
	}
	
	
}
