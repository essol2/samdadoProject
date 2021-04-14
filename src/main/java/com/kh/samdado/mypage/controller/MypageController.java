package com.kh.samdado.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.business.model.vo.business.BusinessAtt;
import com.kh.samdado.common.model.vo.Income;
import com.kh.samdado.mypage.model.service.MypageService;
import com.kh.samdado.mypage.model.vo.AccountBook;
import com.kh.samdado.mypage.model.vo.Point;
import com.kh.samdado.mypage.model.vo.QnA;
import com.kh.samdado.mypage.model.vo.SearchPoint;
import com.kh.samdado.user.model.service.UserService;
import com.kh.samdado.user.model.vo.User;

@Controller
@RequestMapping("/mypage")
@SessionAttributes({"loginUser", "msg"})
public class MypageController {

	@Autowired
	private MypageService mService;
	
	@Autowired
	private UserService uService;
	   
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	 
	// 제휴회원 마이페이지로 이동
	 @GetMapping("/buserinfo")
	 public String mypageBuserFirstView() {
			return "mypage/mp_bUserInfo";
	}

	// 제휴회원 -  비밀번호 수정 메소드
	@PostMapping("/updateBupwd")
	public String updateBuPwd(@ModelAttribute User u,
					          Model model,
					          HttpSession session,
					          @RequestParam(name="currentPwd") String cPwd,
					          @RequestParam(name="newPwd") String newPwd,
					          @RequestParam(name="newPwd2") String newPwd2) {
				 
				 
				 
		//System.out.println(u);
		User loginUser = uService.loginUser(u);
				 
				 
		if(bcryptPasswordEncoder.matches(cPwd, loginUser.getUspwd())) {
		// 비밀번호 변경 값 받아서 암호화
		String encPwd = bcryptPasswordEncoder.encode(newPwd); // 암호화
		u.setUspwd(encPwd); // 암호화 후 다시 세팅
						   
		// db에 update 후
		int result = uService.updatePwdUser(u);	// 암호화 한 비번 db에 update
						   
		// 마이페이지로 돌아가기
		if (result > 0) {
			model.addAttribute("msg", "비밀번호가 수정되었습니다.");
			return "/mypage/mp_bUserInfo";
		} else {
			model.addAttribute("msg", "비밀번호 변경에 실패하였습니다. 다시 시도해주세요.");
			return "/mypage/mp_bUserInfo";
		}
					 
		} else {
			model.addAttribute("msg", "현재 비밀번호가 틀립니다.");
			return "/mypage/mp_bUserInfo";
		}

	}
		 
	// 제휴회원 - 이메일, 전화번호 수정 메소드
	@PostMapping("/updatebuInfo")
	public String updateBuInfo(@ModelAttribute("loginUser") User u,
					           Model model,
					           HttpSession session,
					           RedirectAttributes rd,
					           @RequestParam(name="email", defaultValue="null") String email,
					           @RequestParam(name="phone", defaultValue="null") String phone,
					           @RequestParam(name="usid") String usid) {
			 
			 
		User loginUser = uService.loginUser(u);
			 
			 
		if(email==null) {
			u.setUsemail(loginUser.getUsemail());
		} else {
			u.setUsemail(email);
		}
			 
		if(phone==null) {
			u.setUsphone(loginUser.getUsphone());
		} else {
			u.setUsphone(phone);
		}
			 
		// DB에 UPDATE_이메일, 전화번호 변경 메소드
		int result = mService.updateUserInfo(u);	// 암호화 한 비번 db에 update
			
		//변경 값 다시 loginUser에 넣어주기
		loginUser = uService.loginUser(u);
			 
		if (result > 0) {
			//System.out.println("loginUser가 변경 되었는지 확인해보쟈 : " + loginUser);
				
			model.addAttribute("msg", "수정이 완료되었습니다!");
			return "redirect:/mypage/buserinfo";
		} else {
			model.addAttribute("msg", "수정에 실패했습니다. 다시 시도해주세요.");
			return "/mypage/mp_bUserInfo";
		}
			 
	}
	 
	 // 제휴회원 QnA 페이지로 이동
	 @GetMapping("/gotoqna")
	 public String goToQnA() {
		 return "mypage/mp_QnA";
	 }
	 
	 // 제휴회원 포인트 페이지로 이동
	 @GetMapping("/point")
	 public ModelAndView goToPoint(ModelAndView mv,
				 				   @ModelAttribute User u,
				 				   @ModelAttribute Point po,
				 				   @RequestParam(name="usno") String usno ) {
		 
		 //System.out.println("user 객체 확인 : " +usno);
		 List<Point> pList = null;
		 
		 if(usno.isEmpty()) {
			// u객체 이용해서 income 테이블에서 usno 회원의 point 사용내역, 남은 포인트 불러오기
			 pList = mService.selectPointList(u.getUsno());
			 //System.out.println("pList 객체 확인 : " + pList);
		 } else {
			// u객체 이용해서 income 테이블에서 usno 회원의 point 사용내역, 남은 포인트 불러오기
			 pList = mService.selectPointList(usno);
			 //System.out.println("pList 객체 확인 : " + pList);
		 }
		 	 
		 if(pList.size() > 0) {
			 mv.addObject("pList", pList);
			 mv.setViewName("mypage/mp_Point");
		 }else {
			 mv.setViewName("mypage/mp_Point");
		 }
		 return mv;
	 }
	 
	 // 제휴회원 - 포인트 충전 후 Income DB에 insert.
	 @GetMapping("/payment")
	 public String goToPayment(@ModelAttribute Income ic,
			 				   @ModelAttribute Point po,
			 				   Model model) {
		
		  System.out.println("income 확인 : " + ic);
		 
		 // Income DB에 결제 내역 insert하기
		 int result = mService.insertNewPayment(ic);
		 
		 // point 객체에 충전량 넣어주기
		 po.setPamount(ic.getAmount());
		 // point 잔액은 기존 잔액+충전액 넣어주기
		 // 1. 기존에 있었던 balance 찾아오기
		 System.out.println("po확인 : " + po);
		 Point prePoint = mService.prePoint(po);
//		 System.out.println("prePoint 확인 : " + prePoint);
//		 System.out.println("기존 pbalance 확인 : " + prePoint.getPbalance());
		 
		 if(prePoint != null) {
			 // 2. 기존 balance에 이번에 결제한 금액 넣어주기
			 po.setPbalance(prePoint.getPbalance()+ic.getAmount());
		 } else {
			 // 2. prePoint가 null이라면 그냥 Amount를 넣어주기
			 po.setPbalance(ic.getAmount());
		 }
		 
		 System.out.println("Point객체 확인 : " + po);
		 
		 // Point DB에 포인트 넣어주기
		 int result2 = mService.insertNewPoint(po);
		 
		 if(result>0 || result2>0) {
			 model.addAttribute("usno", po.getUsno());
			return "redirect:point";
		 } else if(result>0 || result2<=0){
			 model.addAttribute("msg", "포인트 적립 오류입니다. 관리자에게 문의주세요.");
			 return "mypage/mp_Point";
		 } else if(result<=0 || result2>0) {
			 model.addAttribute("msg", "수익저장 오류입니다. 관리자에게 문의주세요.");
			 return "mypage/mp_Point";
		 }else {
			model.addAttribute("msg", "알 수 없는 오류가 발생했습니다. 관리자에게 문의주세요.");
			return "mypage/mp_Point";
		 }
	 }
	 
	 // 제휴회원 - 포인트 사용 내역 기간 조회
	 @RequestMapping("/searchPeriod")
	 @ResponseBody
	 public List<SearchPoint> searchPointPeriod(@RequestBody SearchPoint sp) {
		 
		 //System.out.println("view에서 받아오는 so객체 : " + sp);

		 // List<SearchPoint> 검색
		 List<SearchPoint> searchPPList = mService.selectSearchList(sp);
		 //System.out.println("searchPPList 확인 : " + searchPPList);
		 
		 if(searchPPList != null) {
			 return searchPPList;
		 }else {
			 System.out.println("List 못가져옴");
			 return null;
		 }
		  
		 //return null;
	 }

	 
	 // 제휴회원 사업장 페이지로 이동
	 @GetMapping("/mybus")
	 public String myBusiness() {
		 return "";
	 }
	 
	 // 제휴회원 광고관리 페이지로 이동
	 @GetMapping("/advert")
	 public String myAdvert() {
		 return "";
	 }
	 
	 
	// 제휴회원 - 문의하기
	 @PostMapping("/sendQnA")
	 public String sendQnA(Model model,
				 		   @ModelAttribute QnA qna) {

		 //System.out.println("qna객체에 어떻게 들어왔는지 확인 : " + qna);
		 
		 // DB에 insert
		 int result = mService.insertNewQnA(qna);
		 
		 
		 if (result > 0) {
				model.addAttribute("msg", "문의가 접수되었습니다!");
				return "redirect:/mypage/gotoqna";
			} else {
			    model.addAttribute("msg", "문의 전송에 실패했습니다. 다시 시도해주세요.");
				return "/mypage/gotoqna";
			}
	 }
	 
	 // 제휴회원 - 내 사업장 조회 메소드
	 @GetMapping("/buss")
	 public ModelAndView selectBussList(@RequestParam(name="usno") String usno,
			 							ModelAndView mv) {
		 
		 // 해당 사용자가 등록한 사업장 리스트 알아오기
		 List<Business> bussList = mService.selectBussList(usno);
		 
		 System.out.println("bussList확인 : " + bussList);
		 
		 mv.addObject("bussList", bussList);
		 mv.setViewName("mypage/mp_StoreList");
		 return mv;
	 }
	 
/*=====================================================================================================*/
	 
	// 일반회원 마이페이지로 이동
	 @GetMapping("/userinfo")
	 public String mypageUserFirstView() { 
			return "mypage/mp_UserInfo";
	}
	 
	 // 일반회원 -  비밀번호 수정 메소드
	 @PostMapping("/updatepwd")
	 public String updatePwd(@ModelAttribute User u,
			                 Model model,
			                 HttpSession session,
			                 @RequestParam(name="currentPwd") String cPwd,
			                 @RequestParam(name="newPwd") String newPwd,
			                 @RequestParam(name="newPwd2") String newPwd2) {
		 
		 
		 
		// System.out.println(u);
		 
		 User loginUser = uService.loginUser(u);
		 
		 
		 if(bcryptPasswordEncoder.matches(cPwd, loginUser.getUspwd())) {
			// 4) 비밀번호 변경 값 받아서 암호화
			String encPwd = bcryptPasswordEncoder.encode(newPwd); // 암호화
			u.setUspwd(encPwd); // 암호화 후 다시 세팅
				   
		    // 5) db에 update 후
			int result = uService.updatePwdUser(u);	// 암호화 한 비번 db에 update
				   
		    // 6) 마이페이지로 돌아가기
			if (result > 0) {
				model.addAttribute("msg", "비밀번호가 수정되었습니다.");
				return "/mypage/mp_UserInfo";
			} else {
			    model.addAttribute("msg", "비밀번호 변경에 실패하였습니다. 다시 시도해주세요.");
				return "/mypage/mp_UserInfo";
			}
			 
		 } else {
			 model.addAttribute("msg", "현재 비밀번호가 틀립니다.");
			 return "/mypage/mp_UserInfo";
		 }

	 }	 
	 
	 // 일반회원 - 이메일, 전화번호 수정 메소드
	 @PostMapping("/updateInfo")
	 public String updateInfo(@ModelAttribute("loginUser") User u,
				              Model model,
				              HttpSession session,
				              RedirectAttributes rd,
				              @RequestParam(name="email", defaultValue="null") String email,
				              @RequestParam(name="phone", defaultValue="null") String phone,
				              @RequestParam(name="usid") String usid) {
		 
		 
		 User loginUser = uService.loginUser(u);
		 
		 
		 if(email==null) {
			 u.setUsemail(loginUser.getUsemail());
		 } else {
			 u.setUsemail(email);
		 }
		 
		 if(phone==null) {
			 u.setUsphone(loginUser.getUsphone());
		 } else {
			 u.setUsphone(phone);
		 }
		 
		// DB에 UPDATE_이메일, 전화번호 변경 메소드
		int result = mService.updateUserInfo(u);	// 암호화 한 비번 db에 update
		
		//변경 값 다시 loginUser에 넣어주기
		loginUser = uService.loginUser(u);
		 
		if (result > 0) {
			//System.out.println("loginUser가 변경 되었는지 확인해보쟈 : " + loginUser);
			
			model.addAttribute("msg", "수정이 완료되었습니다!");
			return "redirect:/mypage/userinfo";
		} else {
		    model.addAttribute("msg", "수정에 실패했습니다. 다시 시도해주세요.");
			return "/mypage/mp_UserInfo";
		}
		 

	 }
	 
	 // 일반회원 - 내예약목록 페이지 이동
	 @GetMapping("/booking")
	 public String goToBooking() {
		 return "/mypage/mp_MyReservation";
	 }

	 // 일반회원 - 가계부 페이지로 이동
	 @GetMapping("/wallet")
	 public ModelAndView walletFirstView(@ModelAttribute AccountBook ab,
			 							 @RequestParam(name="usno") String un,
				 					     ModelAndView mv) { 
		 
		 // 1. 사용자별 가계부 최근 날짜 리스트 가져오기
		 List<AccountBook> recentDateList = mService.selectRecentDate(un);
		 //System.out.println("recentDateList check : " + recentDateList);
		 //System.out.println("recentDateList.get(0) check : " + recentDateList.get(0).getAccTripDate());
	 
		if(recentDateList.isEmpty()){
			 //List<AccountBook> abList= mService.selectAccountList(ab);
			 // System.out.println("여기는 recentDateList.isEmpty() 구역");
			 mv.addObject("msg", "아직 아무런 값이 없어요! +를 눌러 추가해주세요!");
			 mv.setViewName("mypage/mp_Wallet");
		 } else {
			 ab.setSearchDate(recentDateList.get(0).getAccTripDate());

			 //System.out.println("searchDate check : " + ab.getSearchDate());
			 List<AccountBook> abList= mService.selectAccountList(ab);
			 
			 List<AccountBook> chartList = mService.selectChartList(ab);
			 //System.out.println("charList 확인 : " + chartList);
			 
			 //System.out.println("abList check : " + abList);
			 if(abList != null) {
				 mv.addObject("abList", abList);
				 mv.addObject("rdList", recentDateList);
				 mv.addObject("chaList", chartList);
				 mv.addObject("ots" , recentDateList.get(0).getOneTotalSum());
				 mv.addObject("ts", recentDateList.get(0).getTotalSum());
				 mv.setViewName("mypage/mp_Wallet");
			 }else {
				 mv.addObject("msg", "가계부 조회 오류입니다.");
				 mv.setViewName("mypage/mp_Wallet");
			 }
		 }

		 return mv;
	}
	 
	 // 일반회원 - 새로운 가계부 내역 넣기
	 @PostMapping("/inputNewAB")
	 public String inputNewAccBook(@ModelAttribute AccountBook ab,
			 					   @RequestParam(value="classifyUser") String classifyUser,
			 					   @RequestParam(value="countDateUser", defaultValue="0") int countDateUser,
			 					   Model model) {
		 
		 //System.out.println("넘어오는 ab객체 확인 : " +ab);
		 //System.out.println("classifyUser : " + classifyUser);
		 //System.out.println("countDateUser : " + countDateUser);
		 
		 // 더치페이 off 셋해주기
		 if(ab.getAccDutch() == null) {
			 ab.setAccDutch("off");
		 }
		 
		 // 구분 조합해 set해주기
		 if(ab.getAccClassify().equals("직접입력")) {
			 String accClassify = ab.getAccClassify() + " - " + classifyUser;
			 //System.out.println(accClassify);
			 ab.setAccClassify(accClassify);
		 }
		 
//		 // 동행인 수로 oneWon 구해서 set하기
//		 if(ab.getAccAccompany() > 1) {
//			int oneWon = Math.round(ab.getAccWon() / ab.getAccAccompany());
//			//System.out.println(oneWon);			
//			ab.setAccOneWon(oneWon);
//		 } else {
//			 ab.setAccOneWon(ab.getAccWon());
//			 //System.out.println(ab.getAccOneWon());
//		 }
//		 
		 // 동행인 수로 oneWon 구해서 set하기
		 int oneWon = Math.round(ab.getAccWon() / ab.getAccAccompany());
		 //System.out.println(oneWon);			
		 ab.setAccOneWon(oneWon);
		 
		 //System.out.println("ab ckeck : " + ab);
		 //DB에 insert
		 int result = mService.insertNewAcc(ab);
		 
		 if(result>0) {
			model.addAttribute("msg", "등록성공!");
			model.addAttribute("usno", ab.getUsno());
			return "redirect:/mypage/wallet";
		 } else {
			 model.addAttribute("msg", "등록에 실패했습니다. 다시 시도해주세요.");
		     return "/mypage/mp_Wallet";
		 }
	 }
	// 일반회원 - 다른날 가계부 테이블 조회
	 @GetMapping("/chpage")
	 public ModelAndView changeOtherPage(@RequestParam(name="atd", defaultValue="null") int atd,
			 					   		 @RequestParam(name="usno") String un,
			 					   		 @ModelAttribute AccountBook ab,
			 					   		 ModelAndView mv) {
		 // 1. group by한 날짜 orderby desc로 가져오기
		 List<AccountBook> recentDateList = mService.selectRecentDate(un);
		 
		 // 해당 인덱스 atd에 해당되는 컬럼의 날짜 가져와서 바로 searchDate에 set
		 ab.setSearchDate(recentDateList.get(atd).getAccTripDate());
		 
		 // SearchDate 값에 해당하는 모든 리트스 뽑아오기
		 List<AccountBook> abList= mService.selectAccountList(ab);
		 
		 // 해달 날짜에 해당하는 차트 리스트 불러오기
		 List<AccountBook> chartList = mService.selectChartList(ab);
		 
		 //System.out.println("abList check : " + abList);
		 if(abList != null) {
			 mv.addObject("abList", abList);
			 mv.addObject("rdList", recentDateList);
			 mv.addObject("ots" , recentDateList.get(atd).getOneTotalSum());
			 mv.addObject("ts", recentDateList.get(atd).getTotalSum());
			 mv.addObject("chaList", chartList);
			 mv.setViewName("mypage/mp_Wallet");
		 }else {
			 mv.addObject("msg", "가계부 조회 오류입니다.");
			 mv.setViewName("mypage/mp_Wallet");
		 }
		 return mv;
	 }
	 
	// 일반회원 - 가계부 on/off 클릭 - off상태로 만들어주기
	 @RequestMapping("onoff")
	 @ResponseBody
	 public AccountBook onOffChange(@RequestBody AccountBook ab) {
		 //System.out.println("accno : " + accno);
		 //System.out.println("accDutch :  " +  accDutch);
		 //System.out.println("accno의 타입 : " + accno.getClass().getName());
		//System.out.println("view에서 받아온 ab객체 : " + ab);
			 
		// 기존 해당 컬럼 값 가져오기
		AccountBook abObject = mService.selectOrigin(ab);
		//System.out.println("가져온 abObject 값 : " + abObject);
			 
		// 기존 컬럼값에 dutch값, oneWon, Total 변경해주기
		if(ab.getAccDutch().equals("on")) {
			abObject.setAccDutch("off");
			abObject.setAccAccompany(1);
			abObject.setAccOneWon(abObject.getAccWon());
			abObject.setWhopay(ab.getWhopay());
				 
		} else {
			abObject.setAccDutch("on");
			abObject.setAccAccompany(ab.getAccAccompany());
			abObject.setAccOneWon( Math.round(abObject.getAccWon() / ab.getAccAccompany()));
			abObject.setWhopay(ab.getWhopay());
		}
		
		//System.out.println("setAccDutch한 후의 ab객체 : " + abObject);

		// off, on 컬럼값 바꾸기
		int result = mService.updateOnOffBtn(abObject);
		//System.out.println("onOffChange안에서 : " + result);
			 
		AccountBook findAbObject = mService.selectOrigin(ab);
		//System.out.println("update한 후의 object 값 : " + findAbObject);

		if(findAbObject != null) {
			return findAbObject;
		}else {
			//System.out.println("List 못가져옴");
			return null;
		}
			  
			 //return 0;
	}

	 // 가계부 - 선택 행 삭제하는 메소드
	 @GetMapping("/deleteacc")
	 public String deleteAcc(@RequestParam(name="accno") int accno,
			 				 @RequestParam(name="usno") String usno,
			 				 Model model) {
		 
		 //DB에서 삭제학고 오기
		 int result = mService.deleteAcc(accno);
		 
		 if(result>0) {
			 model.addAttribute("usno", usno);
			 model.addAttribute("msg", "삭제가 성공적!");
			 return "redirect:/mypage/wallet";
		 }else{
			 model.addAttribute("msg", "삭제 실패!");
			 return "redirect:/mypage/wallet";
		 }

	 }
	 
}
