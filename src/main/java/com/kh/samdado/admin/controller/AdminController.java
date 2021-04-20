package com.kh.samdado.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.kh.samdado.admin.model.exception.AdminException;
import com.kh.samdado.admin.model.service.AdminService;
import com.kh.samdado.admin.model.vo.PageInfo;
import com.kh.samdado.admin.model.vo.Pagination;
import com.kh.samdado.admin.model.vo.aSearch;
import com.kh.samdado.business.model.service.businessService;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.common.model.vo.Alliance;
import com.kh.samdado.common.model.vo.Income;
import com.kh.samdado.common.model.vo.Report;
import com.kh.samdado.mypage.model.service.MypageService;
import com.kh.samdado.mypage.model.vo.Alert;
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
	
	@Autowired
	private MypageService mService;
	
	// 1. 관리자 홈 페이지로
	@GetMapping("/home")
	public String adminHomeView(Model model) {
		
		// 1_1. 관리자 메인 페이지에서 미답변 qna 5개만 보이는 limit절 select
		List<QnA> qnaList = aService.adminMainQnaSelect();	
		
		// 1_2. 관리자 메인 페이지에서 신규 사업장 limit절 select
		List<Business> businessList = aService.adminMainBusinessSelect();	
		
		// ---------------------------------------------------
		
		// 1_3. 관리자 메인 페이지에서 총 회원수 카운트 select
		int countUserResult = uService.countUser();
		
		// 1_4. 관리자 메인 페이지에서 신규 배너광고 신청 카운트 select
		int countAd1Result = aService.countAd1();
		
		// 1_5. 관리자 메인 페이지에서 신규 신고 신청 카운트 select
		int countReportResult = bService.countReport();
		
		// 1_6. 관리자 메인 페이지에서 신규 QnA 신청 카운트 select
		int countQnAResult = aService.countQnA();

		model.addAttribute("qnaList", qnaList);
		model.addAttribute("countQnAResult", countQnAResult);
		model.addAttribute("countUserResult", countUserResult);
		model.addAttribute("countReportResult", countReportResult);
		model.addAttribute("businessList", businessList);
		model.addAttribute("countAd1Result", countAd1Result);
		
		return "admin/adminHome";
	}
	

	// 2_1. 관리자 홈 배너 광고관리 페이지로
	@GetMapping("/advertise1")
	public String adminAdvertise1View(Model model,
								@RequestParam(value="page", required = false, defaultValue = "1") int currentPage) {
		
		int listCount = aService.countAd1();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<Alliance> bannerAdList = aService.adminbannerAdSelect(pi);
	
		List<Alliance> admitbannerAdList = aService.admitbannerAdListSelect();
		

		model.addAttribute("bannerAdList", bannerAdList);
		model.addAttribute("admitbannerAdList", admitbannerAdList);
		model.addAttribute("pi", pi);
		
		return "admin/adminAd1Manage";
	}
	
	// 2_2. 관리자 홈 프리미엄 광고관리 페이지로
	@GetMapping("/advertise2")
	public String adminAdvertise2View(Model model,
			@RequestParam(value="page", required = false, defaultValue = "1") int currentPage) {
		
		int listCount = aService.countAd2();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<Income> adminPremiumAd = aService.adminPremiumAdSelect(pi);
		
		model.addAttribute("adminPremiumAd", adminPremiumAd);
		model.addAttribute("pi", pi);
		
		return "admin/adminAd2Manage";
	}
	
	// 3. 관리자 홈 신고관리 페이지로
	@GetMapping("/report")
	public String adminReport(Model model,
            					@RequestParam(value="page", required = false, defaultValue = "1") int currentPage) {
	
		int listCount = bService.countReport();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<Report> reportList = aService.adminReportSelect(pi);
		
		model.addAttribute("reportList", reportList);
		model.addAttribute("pi", pi);
	
		return "admin/adminReportManage";
	}
	
	// 4. 관리자 홈 Q&A관리 페이지로
	@GetMapping("/qna")
	public String adminQna(Model model,
			                  @RequestParam(value="page", required = false, defaultValue = "1") int currentPage) {
		
		int listCount = aService.countQnA();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<QnA> qnaList = aService.adminQnaSelect(pi);
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pi", pi);

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
	public String insertReplyQna(QnA q, Model model, Alert a) {

		int result = aService.insertQnaReply(q); // update
		
		String usno = q.getUsno();
		
		a.setUsno(usno);
		a.setNkeyno(q.getQnano());
		
		
		int newNews = mService.insertQnANews(a);
		
		if (result > 0 && newNews  > 0) {
			model.addAttribute("msg", "답변 완료!");
			return "redirect:/admin/qna";
		} else {
			throw new AdminException("Q&A 답변 처리에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("/searchQna")
	@ResponseBody
	public List<QnA> searchQna(HttpServletResponse response, @RequestBody aSearch search) {

		List<QnA> searchQnaList = aService.searchQnaList(search);
		
		for (QnA q : searchQnaList) {
			if (q.getQreply() == (null)) {
				q.setQreply("미답변");
			}
		}
		
		return searchQnaList;
	}
	
	
	@RequestMapping("/searchReport")
	@ResponseBody
	public List<Report> searchReport(HttpServletResponse response, @RequestBody aSearch search) {

		List<Report> searchReportList = aService.searchReportList(search);
		
		for (Report r : searchReportList) {
			if (r.getRstatus().equals("N")) {
				r.setRstatus("신청완료");
			} else if (r.getRstatus().equals("R")) {
				r.setRstatus("거부");
			} else {
				r.setRstatus("승인 완료");				
			}
			
			if (r.getRetodate() == null) {
				r.setRetodate("해당 없음");
			} 
		}
		
		return searchReportList;
	}
	
	@RequestMapping("/searchbannerAd")
	@ResponseBody
	public List<Alliance> searchbannerAd(HttpServletResponse response, @RequestBody aSearch search) {

		List<Alliance> searchAllianceList = aService.searchAllianceList(search);
		
		for (Alliance a : searchAllianceList) {

			if (a.getBus_category().equals("H")) {
				a.setBus_category("숙박");
			} else if(a.getBus_category().equals("R")) {
				a.setBus_category("음식점");
			} else if(a.getBus_category().equals("T")) {
				a.setBus_category("관광지");				
			} else {
				a.setBus_category("렌트");								
			}
			
			if (a.getAlstatus().equals("N")) {
				a.setAlstatus("신청 완료");
			} else if (a.getAlstatus().equals("Y")) {
				a.setAlstatus("승인 완료");
			} else if (a.getAlstatus().equals("RP")) {
				a.setAlstatus("포인트 부족");
			} else {
				a.setAlstatus("이미지 부적합");
			}
		}
		
		return searchAllianceList;
	}
	
	@RequestMapping("/searchUser")
	@ResponseBody
	public List<User> searchUser(HttpServletResponse response, @RequestBody aSearch search) {

		List<User> searchUserList = uService.searchUserList(search);
		
		for (User u : searchUserList) {
			if (u.getBusno() == (null)) {
				u.setBusno("없음");
			}
		}

		return searchUserList;
	}
	
	@RequestMapping("/searchpreAd")
	@ResponseBody
	public List<Income> searchpreAd(HttpServletResponse response, @RequestBody aSearch search) {

		List<Income> searchPreAdList = aService.searchPreAdList(search);
		
		for (Income i : searchPreAdList) {
			if (i.getBus_category().equals("H")) {
				i.setBus_category("숙박");
			} else if(i.getBus_category().equals("R")) {
				i.setBus_category("음식점");
			} else if(i.getBus_category().equals("T")) {
				i.setBus_category("관광지");				
			} else {
				i.setBus_category("렌트");								
			}
		}

		return searchPreAdList;
	}
	
	
	@GetMapping("/userList")
	public String userList(Model model,
			               @RequestParam(value="page", required = false, defaultValue = "1") int currentPage) {
		
		int listCount = uService.countUser();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		List<User> allUserList = uService.selectAllUserList(pi);
		
		model.addAttribute("allUserList", allUserList);
		model.addAttribute("pi", pi);
		
		return "admin/adminuserList";
	}
	
	
	// 신고 승인
	@GetMapping("/admitReport")
	public String admitReport(@ModelAttribute Report report,
							Model model) {
		
		int result = 0;
		
		// 같은 신고 객체 셀렉트
		Report selectReoprt = aService.selectReport(report);
		
		System.out.println("selectReoprt 출력 : " + selectReoprt);
		// 조건 rexdate == null && usno 동일  r_count가 3이면 
		
		// 1. 신고 누적 횟수 비교
		if (selectReoprt.getR_count() < 2) {
			// 2_1. rstatus y로 업데이트, r_count + 1
			result = aService.updateRstatusToY(report);
			System.out.println("신고 362 result : " + result);
		} else if (selectReoprt.getR_count() == 2) {
			// 2_2. rstatus y로 업데이트, r_count + 1, rexdate 추가 -> 신고 3회 먹었을 때 rexdate 추가해줌 -> rcount -> 0
			result = aService.updateRstatusToYAndRexdate(report);
			System.out.println("신고 366 result : " + result);
		} //else {
//				
//			Report selectReportRexdate = aService.selectReportRexdate(report);
//				
//				System.out.println("여기 확인 ");
//				Date today = new Date(); // 오늘날짜
//				Date exday = selectReportRexdate.getRexdate(); // 만기일
//				
//				String day1 = null;
//				String day2 = null;
//			
//				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//				
//					try {
//						day1 = sdf.format(today); // 오늘
//						day2 = sdf.format(exday); // 만기	
//					} catch(Exception e) {
//						e.printStackTrace();
//					}
//					
//				int compare = day1.compareTo(day2);
//				
//				if (compare > 0) { // 만기날짜 넘음
//					result = aService.updateRstatusToY(report);
//					System.out.println("만기일 넘음 result : " + result);
//				} else if (compare <= 0) { // 만기날짜 남음
//					result = aService.updateRstatusToYAndNoRcount(report); // status -> y / count -> x
//					System.out.println("만기일 남음 result : " + result);
//				}
//
//		}

		if (result > 0) model.addAttribute("msg", "신고 승인 처리가 완료되었습니다.");	
		else throw new AdminException("신고 승인 처리에 실패하였습니다.");

		return "redirect:/admin/report";
	}
	
	// 신고 거절
	@GetMapping("/rejectReport")
	public String rejectReport(@ModelAttribute Report report,
							Model model) {
		
		// rstatus r로 업데이트
		int result = aService.updateRstatusToR(report);

		if (result > 0) model.addAttribute("msg", "신고 반려 처리가 완료되었습니다.");	
		else throw new AdminException("신고 반려 처리에 실패하였습니다.");

		return "redirect:/admin/report";
	}
	
	// 배너 광고 승인
	@GetMapping("/admitBannerAd")
	public String admitBannerAd(@ModelAttribute Alliance alliance,
							    Model model, Alert alert) {
		
		int result = aService.updateAdmitBannerAdStatus(alliance); // Y, STARTDATE + 3
		
		// --- 은솔 --- 배너신고 승인시 알림주기
		// 1. bus_code을 소유하고있는 회원의 usno 알아오기
		String usno = mService.findAlliUsno(alliance);
		
		alert.setNkeyno(alliance.getAlno());
		alert.setUsno(usno);
		alert.setAlstatus("Y");
		
		// 2. News테이블에 insert
		int insertNew = mService.insertNewApprove(alert);
		
		
		if (result > 0 && insertNew > 0) model.addAttribute("msg", "배너광고 승인 처리가 완료되었습니다.");	
		else throw new AdminException("배너광고 승인 처리에 실패하였습니다.");

		return "redirect:/admin/advertise1";
	}
	
	// 배너 광고 거절
	@GetMapping("/rejectBannerAd")
	public String rejectBannerAd(@ModelAttribute Alliance alliance,
							Model model, Alert alert) {
		int result = 0;
		String usno = alliance.getUsno();
				
		alert.setNkeyno(alliance.getAlno());
		alert.setUsno(usno);
		int insertNew = 0;
		
		if (alliance.getAmassage().equals("이미지 불일치")) {
			result = aService.updateRejectBannerAdStatusRI(alliance); // RI
			//int insertNews = mService.insertAlliNews(usno);
			alert.setAlstatus("RI");
			insertNew = mService.insertNewApprove(alert);
		} else { // 포인트 미충전
			result = aService.updateRejectBannerAdStatusRP(alliance); // RP
			alert.setAlstatus("RP");
			insertNew = mService.insertNewApprove(alert);
		}
		
		if (result > 0 && insertNew > 0) model.addAttribute("msg", "배너광고 반려 처리가 완료되었습니다.");	
		else throw new AdminException("배너광고 반려 처리에 실패하였습니다.");

		return "redirect:/admin/advertise1";
	}
	
	@PostMapping("/sendSMS")
	public String sendSMS() {
		return "admin/sendSMSForm";
	}
	
	@GetMapping("/selectGetProfit")
	public @ResponseBody String selectGetProfit() {
		
		List<Integer> profits = aService.selectGetProfit();
	
		return new Gson().toJson(profits);
	}

	
	

}
