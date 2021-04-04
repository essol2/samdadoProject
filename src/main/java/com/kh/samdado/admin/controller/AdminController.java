package com.kh.samdado.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.samdado.admin.model.exception.AdminException;
import com.kh.samdado.admin.model.service.AdminService;
import com.kh.samdado.admin.model.vo.PageInfo;
import com.kh.samdado.admin.model.vo.Pagination;
import com.kh.samdado.admin.model.vo.Search;
import com.kh.samdado.business.model.service.businessService;
import com.kh.samdado.common.model.vo.Report;
import com.kh.samdado.mypage.model.vo.QnA;
import com.kh.samdado.user.model.service.UserService;
import com.kh.samdado.user.model.vo.User;
import org.json.simple.parser.ParseException;
import org.json.simple.parser.JSONParser;


@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginUser", "msg"})
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
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
		
		// 1_2. 관리자 메인 페이지에서 신고? or 신규 사업장 limit절 select
		
		// ---------------------------------------------------
		
		// 1_3. 관리자 메인 페이지에서 총 회원수 카운트 select
		int countUserResult = uService.countUser() - 1; // 관리자 1명 제외
		//System.out.println("회원 수 countUserResult : " + countUserResult);
		
		// 1_4. 관리자 메인 페이지에서 신규 광고 신청 카운트 select
		// int countAdResult = bService.countAd();
		
		// 1_5. 관리자 메인 페이지에서 신규 신고 신청 카운트 select
		int countReportResult = bService.countReport();
		
		// 1_6. 관리자 메인 페이지에서 신규 QnA 신청 카운트 select
		int countQnAResult = aService.countQnA();
		// System.out.println("QnA result : " + countQnAResult);
		
		// -----------------------------------------------------
		
		// 1_7. 관리자 메인 페이지에서 총 매출 차트 select
		
		// 1_8. 관리자 메인 페이지에서 각 광고별 매출 차트 select
		
		// -----------------------------------------------------
		
		// 1_9. 상단바 오른쪽 달력 파트

		model.addAttribute("qnaList", qnaList);
		model.addAttribute("countQnAResult", countQnAResult);
		model.addAttribute("countUserResult", countUserResult);
		model.addAttribute("countReportResult", countReportResult);
		
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
	public String adminReport(Model model,
            					@RequestParam(value="page", required = false, defaultValue = "1") int currentPage) {
		
		// 페이징 처리 로직
		// 1. 게시글 갯수 구하기
		int listCount = bService.countReport();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<Report> reportList = aService.adminReportSelect(pi);
		
		if (reportList != null) {
			model.addAttribute("reportList", reportList);
			model.addAttribute("pi", pi);
		} else {
			model.addAttribute("msg", "신고 리스트 조회에 실패하였습니다.");
		}
				
		
		return "admin/adminReportManage";
	}
	
	// 4. 관리자 홈 Q&A관리 페이지로
	@GetMapping("/qna")
	public String adminQna(Model model,
			                  @RequestParam(value="page", required = false, defaultValue = "1") int currentPage) {
		
		// 페이징 처리 로직
		// 1. 게시글 갯수 구하기
		int listCount = aService.countQnA();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<QnA> qnaList = aService.adminQnaSelect(pi);
		
		if (qnaList != null) {
			model.addAttribute("qnaList", qnaList);
			model.addAttribute("pi", pi);
		} else {
			model.addAttribute("msg", "QnA 리스트 조회에 실패하였습니다.");
		}
		
		return "admin/adminQna";
	}
	
	// 5. 관리자 홈 마이페이지로 (readonly)
	@GetMapping("/mypage")	
	public String adminMypageView(HttpSession session, Model model) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		User admin = uService.loginUser(loginUser);
		
		model.addAttribute("loginUser", admin);
		
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
	
		int result = aService.insertQnaReply(q); // update
		
		if (result > 0) {
			model.addAttribute("msg", "답변 완료!");
			return "redirect:/admin/qna";
		} else {
			throw new AdminException("Q&A 답변 처리에 실패하였습니다.");
		}
		
	}
	

//	@GetMapping("/searchQna")
//	public String searchQna(@ModelAttribute Search search,
//							Model model) {
//		
//		List<QnA> searchQnaList = aService.searchQnaList(search);
//		
//		model.addAttribute("searchQnaList", searchQnaList);
//		
//		return "admin/adminQna";
//	}
	
	@GetMapping("/searchQna")
	public void test2(HttpServletResponse response, Search search, Model model) {
		response.setContentType("application/json; charset=utf-8");

		JSONArray jarr = new JSONArray();
		
		List<QnA> searchQnaList = aService.searchQnaList(search);
		
		for (QnA q : searchQnaList) {
		
			JSONObject jqna = new JSONObject();
			jqna.put("qnano", q.getQnano());
			jqna.put("qcont", q.getQcont());
			jqna.put("qdate", q.getQdate());
			jqna.put("qreply", q.getQreply());
			jqna.put("qstatus", q.getQstatus());
			jqna.put("usno", q.getUsno());
			jqna.put("usname", q.getUsname());
			
			jarr.add(jqna);
		}
	}
	
	@GetMapping("/userList")
	public String userList(Model model,
			               @RequestParam(value="page", required = false, defaultValue = "1") int currentPage) {
		
		int listCount = uService.countUser();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<User> allUserList = uService.selectAllUserList(pi);
		
		// List<User> allUserList = uService.selectAllUserList();
		
		model.addAttribute("allUserList", allUserList);
		
		return "admin/adminuserList";
	}
	
	
	

}
