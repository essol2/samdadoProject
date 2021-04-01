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

import com.kh.samdado.admin.model.exception.AdminException;
import com.kh.samdado.admin.model.service.AdminService;
import com.kh.samdado.business.model.service.businessService;
import com.kh.samdado.mypage.model.vo.QnA;
import com.kh.samdado.user.model.service.UserService;
import com.kh.samdado.user.model.vo.User;

@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginUser", "msg"})
public class AdminController {
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private AdminService aService;
	
	@Autowired
	private businessService bService;
	
	// 1. 관리자 홈 페이지로
	@GetMapping("/home")
	public String adminHomeView(Model model) {
		
		// 1_1. 관리자 메인 페이지에서 미답변 qna 5개만 보이는 limit절 select
		List<QnA> qnaList = aService.adminMainQnaSelect();	
		//System.out.println("qnaList : " + qnaList);
		
		// 1_2. 관리자 메인 페이지에서 총 회원수 카운트 select
		int countUserResult = uService.countUser();
		//System.out.println("회원 수 countUserResult : " + countUserResult);
		
		// 1_3. 관리자 메인 페이지에서 신규 광고 신청 카운트 select
		// int countAdResult = bService.countAd();
		
		// 1_4. 관리자 메인 페이지에서 신규 신고 신청 카운트 select
		// int countReportResult = bService.countReport();
		
		// 1_5. 관리자 메인 페이지에서 신규 QnA 신청 카운트 select
		int countQnAResult = aService.countQnA();
		System.out.println("회원 수 result : " + countQnAResult);
		
		if (qnaList != null)
			model.addAttribute("qnaList", qnaList);
		
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
	public String adminQnaView(Model model) {
		
		// 미답변인 QnA 리스트 select 해오기
		List<QnA> qnaList = aService.adminQnaSelect();

		model.addAttribute("qnaList", qnaList);
		
		return "admin/adminQna";
	}
	
	// 5. 관리자 홈 마이페이지로 (readonly)
	@GetMapping("/mypage")	
	public String adminMypageView(HttpSession session, Model model) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		User admin = uService.loginUser(loginUser);
		
		// System.out.println("admin" + admin);
		
		model.addAttribute("loginUser", loginUser);
		
		return "admin/adminMypage";
	}
	
	// 5. 관리자 홈 마이페이지에서 업데이트페이지 수정하기 버튼 클릭시 호출되는 페이지 (not readonly)
	@GetMapping("/updateAdminInfoPage")
	public String updateAdminInfoPage() {
		return "admin/updateAdminInfoPage";
	}
	
	@PostMapping("/updateAdminInfo")
	public String updateAdminInfo(User u, Model model) {

		int result = uService.updateAdminUser(u);
		
		User loginUser = uService.loginUser(u);

		if (result > 0) {
			model.addAttribute("loginUser", loginUser);
			model.addAttribute("msg", "관리자 정보가 수정되었습니다.");
			return "redirect:/admin/mypage";
		} else {
			throw new AdminException("관리자 정보 수정에 실패하였습니다.");
		}

	}
	
	@PostMapping("/insertReplyQna")
	public String insertReplyQna(QnA q, Model model) {
		
		// System.out.println("답변 넘어오나 확인! q : " + q);
		
		int result = aService.insertQnaReply(q); // update
		
		if (result > 0) {
			model.addAttribute("msg", "답변 완료!");
			return "redirect:/admin/qna";
		} else {
			throw new AdminException("답변에 실패하였습니다.");
		}
		
	}
	
	
	
	
	
	

}
