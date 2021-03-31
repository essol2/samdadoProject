package com.kh.samdado.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.samdado.admin.model.service.AdminService;
//import com.kh.samdado.admin.model.vo.QnA;
import com.kh.samdado.user.model.exception.UserException;
import com.kh.samdado.user.model.service.UserService;
import com.kh.samdado.user.model.vo.User;

@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginUser", "msg"})
public class AdminController {
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private AdminService qnaService;
	
	// 1. 관리자 홈 페이지로
	@GetMapping("/home")
	public String adminHomeView() {
		
//		List<QnA> qnaList = qnaService.adminMainQnaSelect();
		
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
	
	// 5. 관리자 홈 마이페이지로 (readonly)
	@GetMapping("/mypage")	
	public String adminMypageView() {		
		return "admin/adminMypage";
	}
	
	// 5. 관리자 홈 마이페이지에서 업데이트페이지 수정하기 버튼 클릭시 호출되는 페이지 (not readonly)
	@GetMapping("/updateAdminInfoPage")
	public String updateAdminInfoPage() {
		return "admin/updateAdminInfoPage";
	}
	
	@PostMapping("/updateAdminInfo")
	public String updateAdminInfo(User u, Model model) {
		
		System.out.println("u확인 : " + u);
		
		int result = uService.updateAdminUser(u);
		
		// System.out.println("result가 1이면 성공인건뎅 : " + result);
		
		if (result > 0) {
			model.addAttribute("msg", "관리자 정보가 수정되었습니다.");
			return "admin/adminMypage";
		} else {
			throw new UserException("관리자 정보 수정에 실패하였습니다.");
		}

	}
	
	
	
	
	
	

}
