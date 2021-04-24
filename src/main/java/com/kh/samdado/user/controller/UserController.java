package com.kh.samdado.user.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonParser;
import com.kh.samdado.mypage.model.service.MypageService;
import com.kh.samdado.user.model.exception.UserException;
import com.kh.samdado.user.model.service.UserService;
import com.kh.samdado.user.model.vo.Email;
import com.kh.samdado.user.model.vo.EmailSender;
import com.kh.samdado.user.model.vo.User;

@Controller
@RequestMapping("/user")
@SessionAttributes({"loginUser", "msg"})
public class UserController {
	
   private static final Logger logger = LoggerFactory.getLogger(UserController.class);
   
   @Autowired
   UserService uService;
   
   @Autowired
   MypageService mService;
   
   @Autowired
   private BCryptPasswordEncoder bcryptPasswordEncoder;
   
   @Autowired
   private EmailSender emailSender;
   @Autowired
   private Email email;
 
   // 1. 회원 가입 (DB insert)
   @PostMapping("/join")
   public String userJoin(@ModelAttribute User u,			
		   					Model model,
		   					RedirectAttributes rd) {
	   
	   // System.out.println("넘어온 값 : " + u);
	   
	   if (u.getBusno().equals("")) { // 값이 없으면 일반회원
		   u.setUspart("일반"); 
	   } else { // 값이 있으면 제휴회원
		   u.setUspart("제휴"); 
	   }
	   
	   String encPwd = bcryptPasswordEncoder.encode(u.getUspwd());
	   u.setUspwd(encPwd);
	   
	   int result = uService.insertUser(u);	
	   
	   if (result > 0) {
		   User loginUser = uService.loginUser(u); // 회원가입 성공 후
		   
		   rd.addFlashAttribute("joinedUser", loginUser); // 키값으로 매칭하고 로그인 컨트롤러로 넘김(휘발성)

		   return "redirect:/user/login"; // user/login 메소드 리다이렉트
	   } else {
		   model.addAttribute("msg", "회원가입에 실패하였습니다.");
		   return "redirect:/main";
	   }
	   
   }
   
   // 3_1. 회원가입시 바로 로그인되는 컨트롤러 (DB select)
   @GetMapping(value="/login")// 일반 로그인 post 방식, 회원가입 후  바로 로그인 get 방식 -> 리다이렉트로 여기서 받음
   public String userLogin(
		   				   Model model,
		   				   @ModelAttribute("joinedUser") User joinedUser) { // 회원가입하고 난 후 바로 로그인용 여기서 받음
	   
	   // 회원 가입 후 바로 로그인이니까 암호화 필요x
	   if (joinedUser.getUsid() != null) { // 널이 아니면
		   
		   // --은솔 : 새로운 알림 있는지 확인하기
		   User u = joinedUser;
		   int newNews = mService.findNewNews(u);
		   
		   model.addAttribute("newNews", newNews);
		   model.addAttribute("loginUser", joinedUser); 
		   // attribute로 묶어서 (loginUser 키값이 위에 선언한 @SessionAttributes({"loginUser", "msg"}) 키 값과 동일하기 때문에 세션에 있는 loginUser 키값 사용 가능)
		   // 실제로 rd로 묶어준 값은 휘발성이기 때문에 여기서 joinedUser 값이 휘발되어 날라가고, loginUser는 세션에 값이 저장되기 때문에 다른 페이지에서도 사용 가능
		   
		   return "redirect:/main"; // 메인으로 리다이렉트
	   } else {
		   throw new UserException("회원가입 후 로그인에 실패하였습니다.");
	   }
	   
	  
   }
   

   // 3_2. 일반 로그인 컨트롤러 (DB select)
   @PostMapping("/login")// 일반 로그인 post 방식
   public String userLogin(@ModelAttribute User u, 
		   				   Model model) { 

	   User loginUser = uService.loginUser(u);   
	   
	   // 일반 로그인이까 암호화 필요 o
	   if (loginUser != null && bcryptPasswordEncoder.matches(u.getUspwd(), loginUser.getUspwd())) {	   

		   // --은솔 : 새로운 알림 있는지 확인하기
		   int newNews = mService.findNewNews(u);
		   System.out.println(newNews);
		   newNews =2;
		   
		   model.addAttribute("newNews", newNews);
		   model.addAttribute("loginUser", loginUser);
		   return "redirect:/main";
	   } else {
		   model.addAttribute("msg", "로그인에 실패하였습니다.");
		   return "redirect:/main";
	   }
   }
   
   
   // 3_3. 비번 수정 이후 바로 로그인되는 컨트롤러 (DB select)
   @GetMapping(value="/changePwdlogin")
   public String userchangePwdlogin(
		   				   Model model,
		   				   @ModelAttribute("successChangePwdUser") User successChangePwdUser) {
	    System.out.println("111 successChangePwdUser : " + successChangePwdUser.toString());
	   
	   // 비번 수정 후 바로 로그인이니까 암호화 필요x
	   if (successChangePwdUser.getUsid() != null) { // 널이 아니면
		   model.addAttribute("loginUser", successChangePwdUser); 
		    System.out.println("140 successChangePwdUser : " + successChangePwdUser.toString());
		   
		   return "redirect:/main"; // 메인으로 리다이렉트
	   } else {
		   throw new UserException("비번 수정 후 로그인에 실패하였습니다.");
	   }

   }
   
   
   // 2. 로그아웃 컨트롤러 (세션 만료)
   @GetMapping("/logout")
   public String logout(SessionStatus status) {
	   
	   status.setComplete();
	   return "redirect:/main";
   }
   
   // 메인 페이지로 가는 컨트롤러
   @GetMapping("/main")
   public String goMain() {
	   return "common/main";
   }
   
   // 아이디/비밀번호 찾기 페이지로
   @GetMapping("/find")
   public String goFindIdPwdView() {
	   return "user/findUserInfo";
   }
   
   // 아이디 찾는 컨트롤러 | 이름, 이메일, 전화번호
   @PostMapping("/findId")
   public String findId(@ModelAttribute User u,
				        Model model) {
	   
	   User findUser = uService.findUserId(u);
	   
	   if (findUser != null) {
		   model.addAttribute("findUser", findUser);
		   return "user/findUserInfo";	   
	   } else {
		   model.addAttribute("msg", "일치하는 정보가 없습니다.");
		   return "user/findUserInfo";	 
	   }

   }
   
   // 비밀번호 찾는 컨트롤러 | 이름, 아이디, 이메일, 전화번호
   @PostMapping("/findPwd")
   public String findPwd(@ModelAttribute User u, 
		                 Model model) throws Exception {
	   
	   User findUser = uService.findUserPwd(u);

	   // 비밀번호를 찾는 유저가 db에 있다면
	   if (findUser != null) {
		   
		   // 임의 인증키 생성
	       String authKey = getAuthCode();
	       
	       //System.out.println("175 리턴 된 authKey : " + authKey);
	       
	       findUser.setAuthKey(authKey);
	       
	       // 1) db에 인증키 update
	       int result = uService.updateUser(findUser);	       
	       System.out.println("result :" + result);
	       
	       if (result > 0) {
	    	   // 2) 링크 발송 (이메일 + 인증키 파라미터로 보냄)
		       email.setSubject(findUser.getUsname() + "님 비밀번호 찾기 메일입니다."); // 메일 제목 
	         
	           email.setContent(new StringBuffer()
	        		     .append(authKey)
	                     .append(findUser.getUsemail())
	                     .toString());
		       
	           email.setReceiver(findUser.getUsemail());
	           
	           emailSender.SendEmail(email);
			   
			   model.addAttribute("msg", "이메일을 발송했습니다. 확인해주세요.");
			   return "user/findUserInfo";    	   
	       } else {
	    	   model.addAttribute("msg", "이메일 발송에 실패했습니다."); // db에 인증키 update 실패하는 경우
			   return "user/findUserInfo";  
	       }
    
	   } else {
		   model.addAttribute("msg", "일치하는 회원이 없습니다.");
		   return "user/findUserInfo";
	   }

   }
   
   // 회원가입 아이디 중복확인
   @PostMapping(value="/idCheck")
   public @ResponseBody String idCheck(User u) {

	   User idCheckUser = uService.selectIdCheckUser(u);

	   if (idCheckUser != null) {
		   return "fail"; // 중복된 유저가 있으면 실패
	   } 
	   
	   return "success";   
   }
   
   // 회원가입 이메일 중복확인
   @PostMapping(value="/emailCheck")
   public @ResponseBody String emailCheck(User u) {
	   
	   //System.out.println("이메일 넘어오는지 확인~ u : " + u.toString());
	   
	   User emailCheckUser = uService.selectEmailCheckUser(u);
	   
	   //System.out.println("emailCheckUser : " + emailCheckUser);
	   
	   if (emailCheckUser != null) {
		   return "fail"; // 중복된 유저가 있으면 실패
	   } 
	   
	   return "success";   
   }
   
   // 회원가입 휴대전화 중복확인
   @PostMapping(value="/phoneCheck")
   public @ResponseBody String phoneCheck(User u) {
	   
	  // System.out.println("휴대전화 넘어오는지 확인~ u : " + u.toString());

	   User phoneCheckUser = uService.selectPhoneCheckUser(u);
	   
	   // System.out.println("phoneCheckUser : " + phoneCheckUser);
	   
	   if (phoneCheckUser != null) {
		   return "fail"; // 중복된 유저가 있으면 실패
	   } 
	   
	   return "success";   
   }

   // 비밀번호 찾기 이메일 전송 링크발송 -> 링크타고 들어온 후 
   @GetMapping("/email/changePwd")
   public String emailLoginView(@RequestParam(value="authKey") String authKey,		// 링크에서 전달
		                    @RequestParam(value="usemail") String usemail,
		                    Model model) {	
	   
	   //System.out.println("링크에서 넘어온거 확인~!!@!@@!!@");
	   
	   //System.out.println("authKey: " + authKey + " usemail: " + usemail);
	   
	   User u = new User();
	   u.setAuthKey(authKey);
	   u.setUsemail(usemail);
	   
	   // 3) 이메일과 인증키가 일치하는지 확인 (DB 셀렉)
	   User selectChangePwdUser = uService.selectChangePwdUser(u);
	   
	   //System.out.println("selectChangePwdUser 결과는..?? : " + selectChangePwdUser);
	   
	   if (selectChangePwdUser != null) { // 일치한다는 뜻
		   return "user/updatepwd";
	   } else {
		   model.addAttribute("msg", "유효하지 않은 정보입니다. 다시 시도해주세요.");
		   return "redirect:/main";
	   }
  
   }
   
   // 비번 변경 폼 전송 후 로직
   @PostMapping("/email/changePwdForm")
   public String emailLogin(User u,
		                    Model model,
		                    RedirectAttributes rd) {
	   
	   //System.out.println("u : 누구냐 " + u.toString());
	   
	   // 4) 비밀번호 변경 값 받아서 암호화
	   String encPwd = bcryptPasswordEncoder.encode(u.getUspwd()); // 암호화
	   u.setUspwd(encPwd); // 암호화 후 다시 세팅
	   
	   // 5) db에 update 후
	   int result = uService.updatePwdUser(u);	// 암호화 한 비번 db에 update
	   
	   // 6) 바로 로그인 처리
	   if (result > 0) {
		   User successChangePwdUser = uService.loginUser(u); // 유저 셀렉
		   
		   //System.out.println("successChangePwdUser : " + successChangePwdUser.toString());
		   
		   rd.addFlashAttribute("successChangePwdUser", successChangePwdUser);
		   
		   model.addAttribute("msg", "비밀번호가 수정되었습니다.");
		   return "redirect:/user/changePwdlogin"; // 로그인 메소드로 리다이렉트
	   } else {
		   model.addAttribute("msg", "비밀번호 변경에 실패하였습니다. 다시 시도해주세요.");
		   return "redirect:/main";
	   }
		   
	  
   }
   
   // 인증키 생성 메소드
   private String getAuthCode() {
	   
       Random random = new Random();
       StringBuffer buffer = new StringBuffer();
       int num = 0;

       while (buffer.length() < 6) {
           num = random.nextInt(10);
           buffer.append(num);
       }
       
       //System.out.println("231번째줄 난수 발생 되는지 확인차 : buffer.toString()" + buffer.toString());

       return buffer.toString(); // 리턴타입 스트링
   }
   
   
  
   
   
  
   
   
   
   

}

	

	
   
   
   
   
   
   
   
   
   
