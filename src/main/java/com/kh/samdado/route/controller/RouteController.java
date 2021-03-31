package com.kh.samdado.route.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/route")
public class RouteController {
	@GetMapping("/m_route")
	public String route() {
		return "route/route_main";
		
	}
}
