package com.kh.samdado.route.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.samdado.business.model.service.businessService;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.mypage.model.service.MypageService;
import com.kh.samdado.route.model.exception.RouteException;
import com.kh.samdado.route.model.service.RouteService;
import com.kh.samdado.route.model.vo.Route;
import com.kh.samdado.route.model.vo.RouteFinal;
import com.kh.samdado.route.model.vo.SpotBus;
import com.kh.samdado.route.model.vo.rSearch;
import com.kh.samdado.user.model.vo.User;

@Controller
@RequestMapping("/route")
@SessionAttributes({"area", "thema", "routeDate", "list", "loginUser"})
public class RouteController {
	@Autowired
	private RouteService rService;
	
	@Autowired
	private MypageService mService;
	
	@Autowired
	private businessService bService;
	
	@GetMapping("/m_route")				// 길 만들기 페이지로 이동
	public String route() {
		return "route/route_main";
	}
	
	@GetMapping("/search")
	public ModelAndView searchRoute(Model model, 
							HttpSession session,
							@ModelAttribute User u,
							@ModelAttribute rSearch search,
							@RequestParam("area") String area, 
							@RequestParam("thema") String thema, 
							@RequestParam("routeDate") Date routeDate,
							ModelAndView mv) {		// 루트 검색
		User lgus = (User)session.getAttribute("loginUser");
		
		u.setUsno(lgus.getUsno());
		
		if(u.getUsno() != null) {
			// 사용자별 찜한 숙소리스트 가져오기
			List<Business> jjimHotel = mService.findHotelJjimList(u);
			//System.out.println("jjimHotel 확인 : " + jjimHotel);
			
			// 검색 모달창에 찜한 사업장 가져오기
			List<Business> jjimB = rService.jjimBusiness(u);
			/* System.out.println("찜한 사업장: " + jjimB); */
			
			model.addAttribute("jjimList", jjimHotel);
			model.addAttribute("jjimB", jjimB);
		}
		
		model.addAttribute("area", area);
		model.addAttribute("thema", thema);
		model.addAttribute("routeDate", routeDate);
		
		List<Route> list = rService.routeSearch(search);
		model.addAttribute("list", list);
		
		/* 한빈 */
		List<Business> hotelList = bService.selectHotelListP();
//		System.out.println(hotelList);
		if(hotelList != null) {
			mv.addObject("hotelList", hotelList);
//			System.out.println("hotelList2" + hotelList);
			mv.setViewName("route/route_result");
		}
		
		return mv;
	}
	
	@PostMapping("/changeRoute")
	public ModelAndView changeRoutePage(HttpSession session, Model model, String[] rrlist, @ModelAttribute User u, ModelAndView mv) {	// 여행지 순서 바꾸기 페이지로 이동
		String area = (String)session.getAttribute("area");
		String thema = (String)session.getAttribute("thema");
		Date routeDate = (Date)session.getAttribute("routeDate");
		
		/* System.out.println("변경하기 루트 어레이: " + Arrays.toString(rrlist)); */
		
		List<SpotBus> rlist = rService.changeRoute(rrlist);
		
		//System.out.println("rlist: " + rlist);
		model.addAttribute("list", rlist);
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			u.setUsno(loginUser.getUsno());
			
			// 사용자별 찜한 숙소리스트 가져오기
			List<Business> jjimHotel = mService.findHotelJjimList(u);
			//System.out.println("jjimHotel 확인 : " + jjimHotel);
			
			// 검색 모달창에 찜한 사업장 가져오기
			List<Business> jjimB = rService.jjimBusiness(u);
			/* System.out.println("찜한 사업장: " + jjimB); */
			
			model.addAttribute("jjimList", jjimHotel);
			model.addAttribute("jjimB", jjimB);
		}
		
		
		/* 한빈 */
		List<Business> hotelList = bService.selectHotelListP();
//		System.out.println(hotelList);
		if(hotelList != null) {
			mv.addObject("hotelList", hotelList);
//			System.out.println("hotelList2" + hotelList);
			mv.setViewName("route/route_edit");
		}
		
		return mv;
	}
	
	
	
	@PostMapping(value="/searchSpot", produces="application/json; charset=utf-8")
	public @ResponseBody List<SpotBus> searchSpot(String sTitle, Model model, HttpSession session) {		// 여행지 검색
		
//		System.out.println(sTitle);
		
		List<SpotBus> tlist = rService.spotSearch(sTitle);
		List<SpotBus> blist = rService.spotSearch1(sTitle);
		
//		System.out.println(tlist);
//		System.out.println("blist: " + blist);
		
		List<SpotBus> returnList = new ArrayList<>();
		
		returnList.addAll(tlist);
		returnList.addAll(blist);
		
//		System.out.println("returnList: " + returnList);
		 
		 
		return returnList;
	}
	
	
	@PostMapping("/clearChange")
	public ModelAndView clearChange(HttpSession session, Model model, String[] chlist,  @ModelAttribute User u, ModelAndView mv ) {		// 여행지 순서 바꾸기 완료
		String area = (String)session.getAttribute("area");
		String thema = (String)session.getAttribute("thema");
		Date routeDate = (Date)session.getAttribute("routeDate");
		User loginUser = (User)session.getAttribute("loginUser");
		
		
		/* System.out.println("chlist: " + Arrays.toString(chlist)); */
		
		List<SpotBus> clist = rService.clearChange(chlist);
		
		System.out.println("clist: " + clist);
		
		model.addAttribute("list", clist);
		
		if(loginUser != null) {
			u.setUsno(loginUser.getUsno());
			// 사용자별 찜한 숙소리스트 가져오기
			List<Business> jjimHotel = mService.findHotelJjimList(u);
			System.out.println("jjimHotel 확인 : " + jjimHotel);
			
			// 검색 모달창에 찜한 사업장 가져오기
			List<Business> jjimB = rService.jjimBusiness(u);
			/* System.out.println("찜한 사업장: " + jjimB); */
			
			model.addAttribute("jjimList", jjimHotel);
			model.addAttribute("jjimB", jjimB);
		}
		
		
		/* 한빈 */
		List<Business> hotelList = bService.selectHotelListP();
//		System.out.println(hotelList);
		if(hotelList != null) {
			mv.addObject("hotelList", hotelList);
//			System.out.println("hotelList2" + hotelList);
			mv.setViewName("route/route_result");
		}
		
		/* return "redirect:/route/search"; */
		return mv;
	}
	
	@PostMapping("/addRoute")
	public String addRoute(HttpSession session, Model model, String[] slist, String tprice) {			// 루트 저장하기
		
//		System.out.println("slist: " + Arrays.toString(slist));
		
		session.setAttribute("price", tprice);
		
		int result = rService.addRoute(slist);
		
		if(result > 0) {
			/* model.addAttribute("msg", "저장되었습니다. 내 정보에서 확인하세요!"); */
			return "redirect:/route/finalRoute";
		} else {
			throw new RouteException("저장에 실패하였습니다.");
		}
		
	}
	
	@GetMapping("/finalRoute")
	public String finalRoute(HttpSession session, Model model, RouteFinal rf) {
		Date routeDate = (Date)session.getAttribute("routeDate");
		User loginUser = (User)session.getAttribute("loginUser");
		String price = (String)session.getAttribute("price");
		
		System.out.println(routeDate);
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy/MM/dd");
		String time1 = format1.format(routeDate);
		
		rf.setRoute_date(time1);
		rf.setUs_no(loginUser.getUsno());
		rf.setRoute_price(price);
		
		/* System.out.println(rf); */
		
		int result = rService.finalRoute(rf);
		
		if(result > 0) {
			model.addAttribute("msg", "저장되었습니다. 내 정보에서 확인하세요!");
			//session.setAttribute("usno", rf.getUs_no());
			//return null;
			return "redirect:/mypage/myroute";
		} else {
			throw new RouteException("저장에 실패하였습니다.");
		}
		
	}
	
}
