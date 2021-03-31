package com.kh.samdado.route.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/route")
public class RouteController {
	
	@GetMapping("/m_route")				// 길 만들기 페이지로 이동
	public String route() {
		return "route/route_main";
	}
	
	public String searchRoute() {		// 루트 검색
		return "";
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
	
	public String changeRoute() {		// 여행지 순서 바꾸기
		return "";
	}
	
	public String addRoute() {			// 루트 저장하기
		return "";
	}
	
	public String goRoom() {			// 숙박 페이지로 이동
		return "";
	}
	
	
}
