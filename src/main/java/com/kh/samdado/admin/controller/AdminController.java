package com.kh.samdado.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	// 1. 관리자 홈 페이지로
	@GetMapping("/home")
	public String adminHomeView() {
		return "admin/adminHome";
	}
	
	// 2_1. 관리자 홈 배너 광고관리 페이지로
	@GetMapping("/advertise1")
	public String adminAdvertise1View() {
		return "admin/adminAd1Manage";
	}
	
	// 2_2. 관리자 홈 프리미엄 광고관리 페이지로
	@GetMapping("/advertise2")
	public String adminAdvertise2View() {
		return "admin/adminAd2Manage";
	}
	
	// 3. 관리자 홈 신고관리 페이지로
	@GetMapping("/report")
	public String adminReportView() {
		return "admin/adminReportManage";
	}
	
	// 4. 관리자 홈 Q&A관리 페이지로
	@GetMapping("/qna")
	public String adminQnaView() {
		return "admin/adminQna";
	}
	
	// 5. 관리자 홈 마이페이지로
	@GetMapping("/mypage")
	public String adminMypageView() {
		return "admin/adminMypage";
	}
	
	
	
	

}
