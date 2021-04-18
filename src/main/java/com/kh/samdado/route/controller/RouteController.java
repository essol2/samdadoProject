package com.kh.samdado.route.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.samdado.route.model.service.RouteService;
import com.kh.samdado.route.model.vo.Route;
import com.kh.samdado.route.model.vo.TourSpot;
import com.kh.samdado.route.model.vo.rSearch;

@Controller
@RequestMapping("/route")
@SessionAttributes({"area", "thema", "routeDate", "list"})
public class RouteController {
	@Autowired
	private RouteService rService;
	
	@GetMapping("/m_route")				// 길 만들기 페이지로 이동
	public String route() {
		return "route/route_main";
	}
	
	@GetMapping("/search")
	public String searchRoute(Model model, 
							@ModelAttribute rSearch search,
							@RequestParam("area") String area, 
							@RequestParam("thema") String thema, 
							@RequestParam("routeDate") Date routeDate ) {		// 루트 검색

		model.addAttribute("area", area);
		model.addAttribute("thema", thema);
		model.addAttribute("routeDate", routeDate);
		
		List<Route> list = rService.routeSearch(search);
		model.addAttribute("list", list);
		
		return "route/route_result";
	}
	
	@GetMapping("/changeRoute")
	public String changeRoutePage(HttpSession session, Model model, @ModelAttribute rSearch search) {	// 여행지 순서 바꾸기 페이지로 이동
		String area = (String)session.getAttribute("area");
		String thema = (String)session.getAttribute("thema");
		Date routeDate = (Date)session.getAttribute("routeDate");
		
		List<Route> list = rService.routeSearch(search);
		
		session.setAttribute("list", list);
		
		return "route/route_edit";
	}
	
	public String deleteSpot() {		// 여행지 삭제
		
		return "";
	}
	
	@PostMapping(value="/searchSpot", produces="application/json; charset=utf-8")
	public @ResponseBody List<TourSpot> searchSpot(String sTitle, HttpSession session) {		// 여행지 검색
		
		System.out.println(sTitle);
		
		List<TourSpot> tlist = rService.spotSearch(sTitle);
		
		System.out.println(tlist);
		
		return tlist;
	}
	
	public String addSpot() {			// 여행지 추가
		return "";
	}
	
	
	
	public String changeRoute() {		// 여행지 순서 바꾸기 완료
		return "";
	}
	
	public String addRoute() {			// 루트 저장하기
		return "";
	}
	
}
