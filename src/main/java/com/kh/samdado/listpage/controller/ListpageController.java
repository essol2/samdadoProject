package com.kh.samdado.listpage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/listpage")
public class ListpageController {
	@GetMapping("/hotel_list")
	public String hotelList() {
		return "listpage/hotel_list";
		
	}
	
	@GetMapping("/hotel_detail")
	public String hotelDetail() {
		return "listpage/hotel_detail";
		
	}
	
	@GetMapping("/tour_list")
	public String tourList() {
		return "listpage/tour_list";
		
	}
	
	@GetMapping("/tour_detail")
	public String tourDetail() {
		return "listpage/tour_detail";
		
	}
	
	@GetMapping("/restaurant_list")
	public String restaurantList() {
		return "listpage/restaurant_list";
		
	}
	
	@GetMapping("/restaurant_detail")
	public String restaurantDetail() {
		return "listpage/restaurant_detail";
		
	}
	
	@GetMapping("/car_list")
	public String carList() {
		return "listpage/car_list";
		
	}
	
	@GetMapping("/car_detail")
	public String carDetail() {
		return "listpage/car_detail";
		
	}
	
	// 배너 등록 페이지로 이동
	@GetMapping("/bannerAd")
	public String submitBannerAdView() {
		return "bussiness/bussinessFormSubmit";
	}
	
	// 배너 등록 신청 제출 컨트롤러
	@PostMapping("/submit/bannerAd")
	public String submitBannerAd() {
		
		return "";
	}
}
