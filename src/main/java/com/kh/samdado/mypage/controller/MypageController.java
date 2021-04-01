package com.kh.samdado.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.samdado.common.model.Income;
import com.kh.samdado.mypage.model.service.MypageService;
import com.kh.samdado.mypage.model.vo.AccountBook;
import com.kh.samdado.mypage.model.vo.QnA;
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
				 
				 
				 
		System.out.println(u);
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
	 public String goToPoint(@ModelAttribute User u,
			 				 @ModelAttribute AccountBook ab) {
		 
		 //System.out.println("usno가 잘 들어오는지 확인 : " + u.getUsno());
		 
		 //DB가서 이 회원의 잔여 포인트,사용 내역 불러오기
		 
		 
		 return "mypage/mp_Point";
		 
	 }
	 
	 // 제휴회원 - 포인트 충전하기
	 // 결제 API로 이동
	 @GetMapping("/payment")
	 public String goToPayment(@ModelAttribute Income ic) {
		
		 System.out.println("income 확인 : " + ic);
		 
		 return "mypage/mp_Point";
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

		 System.out.println("qna객체에 어떻게 들어왔는지 확인 : " + qna);
		 
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
		 
		 
		 
		 System.out.println(u);
		 
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
	 
	
	 
	 
	 					  
}
