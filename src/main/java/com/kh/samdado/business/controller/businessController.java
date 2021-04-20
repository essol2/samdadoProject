package com.kh.samdado.business.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.samdado.business.model.exception.businessException;
import com.kh.samdado.business.model.service.businessService;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.business.model.vo.business.BusinessAtt;

import com.kh.samdado.business.model.vo.hotel.Room;
import com.kh.samdado.business.model.vo.hotel.RoomAtt;
import com.kh.samdado.business.model.vo.hotel.RoomAttList;
import com.kh.samdado.business.model.vo.hotel.RoomBooking;
import com.kh.samdado.business.model.vo.hotel.RoomList;
import com.kh.samdado.business.model.vo.rentcar.Car;
import com.kh.samdado.business.model.vo.rentcar.CarAtt;
import com.kh.samdado.business.model.vo.rentcar.CarList;
import com.kh.samdado.business.model.vo.tour.TourProduct;
import com.kh.samdado.common.model.vo.Alliance;

import com.kh.samdado.common.model.vo.Income;
import com.kh.samdado.common.model.vo.Report;
import com.kh.samdado.mypage.model.vo.Booking;
import com.kh.samdado.mypage.model.vo.Point;

import com.kh.samdado.common.model.vo.Report;
import com.kh.samdado.user.model.vo.User;


@Controller
@RequestMapping("/business")
@SessionAttributes({ "loginUser", "msg" })
public class businessController {


	@Autowired
	businessService bService;

	// 호텔디테일
	@GetMapping("/hotel_detail")
	public String hotelDetail(@RequestParam int bus_code,
				Model model) {

		System.out.println("나와라" + bus_code);
	
		Business b = bService.selectHotel(bus_code);
		List<BusinessAtt> attList = bService.selectAtt(bus_code);
	
		if(b != null) {
			System.out.println("디테일 : " + b);
			model.addAttribute("hotel", b);
			model.addAttribute("att" + attList);
		return "business/hotel/hotel_detail";
		} else {
			model.addAttribute("msg", "공지사항 게시글 보기에 실패했습니다.");
		return "business/hotel/hotel_list";
		}
	}

	// 호텔등록폼
	@GetMapping("/hotel_write")
	public String hotelInsert() {
		return "business/hotel/hotel_write";
	}

	// 호텔등록
	@PostMapping("/hotel_insert")
	public String hotelInsert(Business b, Room r, RoomList rl, Income i, BusinessAtt bat, @RequestParam int primonth,
							  @RequestParam(value = "uploadFile") List<MultipartFile> rfile,
							  @RequestParam(value = "room") List<MultipartFile> roomFile, 
							  @RequestParam(value = "mainFile") MultipartFile mainFile,
							  HttpServletRequest request, Map map) {
								
		// System.out.println("roomFile : " + roomFile);
		// System.out.println("roomFile : " + roomFile);
		
		// 유저넘버 인컴에 담아주기
		i.setUsno(b.getUs_no());
		
		// 첨부파일 리스트 객체 생성
		List <BusinessAtt> list = new ArrayList<>(); 
		List <RoomAtt> raList = new ArrayList<>();
		
		List<Room> rooms = new ArrayList<>();
		rooms = rl.getRoomList();
		
		
		// 가져온 bfiles 돌리기
		for(MultipartFile mf : rfile) {
			MultipartFile file = mf;
			
			// 업로드 파일 서버에 저장
			// 파일이 첨부 되었다면
			if (!file.getOriginalFilename().equals("")) {
				// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
				Map<String, String> files = busSaveFile(file, request);
				// DB에 저장하기 위한 파일명 세팅
				if (files != null) {
					BusinessAtt ba = new BusinessAtt();
					ba.setFile_name(file.getOriginalFilename());
	
					// 맵에 담겨져있는 값의 키 불러오기
					ba.setFile_rename((String) files.get("rename"));
					ba.setFile_root((String) files.get("path"));
					
					list.add(ba);
				}
			}
		}
		
	
		for(MultipartFile mf : roomFile) {
			MultipartFile file = mf;
			
			if (!file.getOriginalFilename().equals("")) {
				// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
				Map<String, String> files = busSaveFile(file, request);
				// DB에 저장하기 위한 파일명 세팅
				if (files != null) {
					
					RoomAtt ra = new RoomAtt();
					ra.setFile_name(file.getOriginalFilename());
	
					// 맵에 담겨져있는 값의 키 불러오기
					ra.setFile_rename((String) files.get("rename"));
					ra.setFile_root((String) files.get("path"));
					
					raList.add(ra);
				}
			}
		}
		
		// 업로드 파일 서버에 저장
		// 파일이 첨부 되었다면
		if(!mainFile.getOriginalFilename().equals("")) {
			// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			Map<String, String> file = busSaveFile(mainFile, request);
			
			// DB에 저장하기 위한 파일명 세팅
			if(file != null) {
				
				bat.setFile_name(mainFile.getOriginalFilename());
				
				// 맵에 담겨져있는 값의 키 불러오기
				bat.setFile_rename((String)file.get("rename"));
				bat.setFile_root((String)file.get("path"));
			}
		}
		
		if(primonth != 0) {
			// 넘어온 개월수에 따라 amount값 주기
			if(primonth == 30) {
				i.setAmount(70);		
			} else if(primonth == 90) {
				i.setAmount(90);
			} else {
				i.setAmount(180);
			}
			int result3 = bService.insertIncome1(i);
		}
		
		int result = bService.insertBusiness(b, list);
		int result3 = bService.insertRoom(rooms, raList);
		int result4 = bService.insertMain(bat);
		
		if (result > 0 && result3 > 0) {
			return "redirect:/main";
		} else {
			throw new businessException("사업 등록에 실패하였습니다.");
		}
	}

	// 호텔 리스트
	@GetMapping("/hotel_list")
	public ModelAndView hotelList(ModelAndView mv) {
		
		List<Business> hotelList = bService.selectHotelList();
			
		if(hotelList != null) {
			System.out.println("hotelList : " + hotelList);
			mv.addObject("hotelList", hotelList);
			mv.setViewName("business/hotel/hotel_list");
		}
		return mv; 
	}

	// 관광지디테일
	@GetMapping("/tour_detail")
	public String tourDetail(@RequestParam int bus_code,
			   				Model model) {

		//System.out.println("나와라 : " + bus_code);
	
		Business b = bService.selectTour(bus_code);
		List<BusinessAtt> attList = bService.selectAtt(bus_code);
		if(b != null) {
			model.addAttribute("tour", b);
			model.addAttribute("att", attList);
			// System.out.println(model);
			return "business/tour/tour_detail";
		} else {
			model.addAttribute("msg", "관광지 보기에 실패했습니다.");
		return "business/tour/tour_list";
		}
	}

	// 관광지 등록폼
	@GetMapping("/tour_write")
	public String tourWrite() {
		return "business/tour/tour_write";
	}

	// 관광지 등록
	@PostMapping("/tour_insert")
	public String tourInsert(Business b, TourProduct tp, Income i, BusinessAtt bat, @RequestParam int primonth,
							 @RequestParam(value = "uploadFile") List<MultipartFile> tfiles,
							 @RequestParam(value = "mainFile") MultipartFile mainFile,
							 HttpServletRequest request, Map map) {

		// 유저넘버 인컴에 담아주기
		i.setUsno(b.getUs_no());
		
		// 첨부파일 리스트 객체 생성
		List <BusinessAtt> list = new ArrayList<>();
		
		// 가져온 bfiles 돌리기
		for(MultipartFile mf : tfiles) {
			MultipartFile file = mf;
			
			// 업로드 파일 서버에 저장
			// 파일이 첨부 되었다면
			if(!file.getOriginalFilename().equals("")) {
				// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
				Map<String, String> files = busSaveFile(file, request);
				
				// DB에 저장하기 위한 파일명 세팅
				if(files != null) {
					BusinessAtt ba = new BusinessAtt();
					ba.setFile_name(file.getOriginalFilename());
					
					// 맵에 담겨져있는 값의 키 불러오기
					ba.setFile_rename((String)files.get("rename"));
					ba.setFile_root((String)files.get("path"));
					
					list.add(ba);
				}
			}
		}
		
		// 업로드 파일 서버에 저장
		// 파일이 첨부 되었다면
		if(!mainFile.getOriginalFilename().equals("")) {
			// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			Map<String, String> file = busSaveFile(mainFile, request);
			
			// DB에 저장하기 위한 파일명 세팅
			if(file != null) {
				
				bat.setFile_name(mainFile.getOriginalFilename());
				
				// 맵에 담겨져있는 값의 키 불러오기
				bat.setFile_rename((String)file.get("rename"));
				bat.setFile_root((String)file.get("path"));
			}
		}
		
		if(primonth != 0) {
			// 넘어온 개월수에 따라 amount값 주기
			if(primonth == 30) {
				i.setAmount(70);		
			} else if(primonth == 90) {
				i.setAmount(90);
			} else {
				i.setAmount(180);
			}
			int result3 = bService.insertIncome1(i);
		}
		
		int result = bService.insertBusiness(b, list);
		int result3 = bService.insertTour(tp);
		int result4 = bService.insertMain(bat);
		
		if (result > 0 && result3 > 0) {
			return "redirect:/main";
		} else {
			throw new businessException("사업 등록에 실패하였습니다.");
		}
	}

	// 관광지 리스트
	@GetMapping("/tour_list")
	public ModelAndView tourList(ModelAndView mv) {
		
		List<Business> tourList = bService.selectTourList();
		
		if(tourList != null) {
			
			mv.addObject("tourList", tourList);
			mv.setViewName("business/tour/tour_list");
		}
		return mv;
	}

	// 음식점 디테일
	@GetMapping("/restaurant_detail")
	public String restaurantDetail(@RequestParam int bus_code,
			   					   Model model) {
		
		
		Business b = bService.selectRestaurant(bus_code);
		
		if(b != null) {
			// System.out.println("디테일 : " + b);
			model.addAttribute("res", b);
			return "business/restaurant/restaurant_detail";
		} else {
			model.addAttribute("msg", "공지사항 게시글 보기에 실패했습니다.");
			return "business/restaurant/restaurant_list";
		}
	}

	// 음식점 등록폼
	@GetMapping("/restaurant_write")
	public String restaurantWrite() {
		return "business/restaurant/restaurant_write";
	}

	// 음식점 등록 - 파일첨부(리네임)
	@PostMapping("/restaurant_insert")
	public String restaurantInsert(Business b, @RequestParam int primonth, Income i, BusinessAtt bat,
							  @RequestParam(value="uploadFile") List<MultipartFile> bfiles,
							  @RequestParam(value = "mainFile") MultipartFile mainFile,
							  HttpServletRequest request, Map map) {
		// 유저넘버 인컴에 담아주기
		i.setUsno(b.getUs_no());
		
		// 첨부파일 리스트 객체 생성
		List <BusinessAtt> list = new ArrayList<>(); 
		
		// 가져온 bfiles 돌리기
		for(MultipartFile mf : bfiles) {
			MultipartFile file = mf;
			
			// System.out.println("for문 파일 file : " + file.getOriginalFilename() );
			
			// 업로드 파일 서버에 저장
			// 파일이 첨부 되었다면
			if(!file.getOriginalFilename().equals("")) {
				// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
				Map<String, String> files = busSaveFile(file, request);
				
				// DB에 저장하기 위한 파일명 세팅
				if(files != null) {
					BusinessAtt ba = new BusinessAtt();
					ba.setFile_name(file.getOriginalFilename());
					
					// 맵에 담겨져있는 값의 키 불러오기
					ba.setFile_rename((String)files.get("rename"));
					ba.setFile_root((String)files.get("path"));
					
					list.add(ba);
				}
			}
		}
		
		// 업로드 파일 서버에 저장
		// 파일이 첨부 되었다면
		if(!mainFile.getOriginalFilename().equals("")) {
			// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			Map<String, String> file = busSaveFile(mainFile, request);
			
			// DB에 저장하기 위한 파일명 세팅
			if(file != null) {
				
				bat.setFile_name(mainFile.getOriginalFilename());
				
				// 맵에 담겨져있는 값의 키 불러오기
				bat.setFile_rename((String)file.get("rename"));
				bat.setFile_root((String)file.get("path"));
			}
		}
		
		if(primonth != 0) {
			// 넘어온 개월수에 따라 amount값 주기
			if(primonth == 30) {
				i.setAmount(70);		
			} else if(primonth == 90) {
				i.setAmount(90);
			} else {
				i.setAmount(180);
			}
			int result3 = bService.insertIncome1(i);
		}
		
		System.out.println("b : " + b);
		System.out.println("list :"  + list);
		System.out.println("list :"  + bat);
		
		int result = bService.insertBusiness(b, list);
		int result2 = bService.insertMain(bat);
		
		if(result > 0) {
			
			return "mypage/mp_StoreList";
		} else {
			throw new businessException("사업 등록에 실패하였습니다.");
		}
	}
	
	
	@GetMapping("/pay_insert")
	public String payInsert() {
		return "business/rentcar/car_list";
	}
	
	// 음식점 리스트
	@GetMapping("/restaurant_list")
	public ModelAndView resList(ModelAndView mv) {
		
		List<Business> resList = bService.selectResList();
		
		if(resList != null) {
			mv.addObject("resList", resList);
			mv.setViewName("business/restaurant/restaurant_list");
		}
		return mv;
	}
		
	
	// 렌트카 디테일
	@GetMapping("/car_detail")
	public String carDetail(@RequestParam int bus_code,
			   			    Model model) {


		Business b = bService.selectCar(bus_code);
		
		if(b != null) {
			// System.out.println("디테일 : " + b);
			model.addAttribute("car", b);
			return "business/rentcar/car_detail";
		} else {
			model.addAttribute("msg", "공지사항 게시글 보기에 실패했습니다.");
		return "business/rentcar/car_list";
		}
	}

	// 렌트카 등록폼
	@GetMapping("/rentcar_write")
	public String rentcarWrite() {
		return "business/rentcar/rentcar_write";

	}

	// 렌트카 등록
	@PostMapping("/rentcar_insert")
	public String rentcarInsert(Business b, CarList c, Car car, Income i, BusinessAtt bat, @RequestParam int primonth,
								@RequestParam(value = "uploadFile") List<MultipartFile> bfiles,
								@RequestParam(value = "mainFile") MultipartFile mainFile,
								@RequestParam(value = "car") List<MultipartFile> carFiles, 
								HttpServletRequest request, Map map) {
		
		// System.out.println("car : " + c.getList());
		// 유저넘버 인컴에 담아주기
		i.setUsno(b.getUs_no());
		// 첨부파일 리스트 객체 생성
		List <BusinessAtt> list = new ArrayList<>(); 
		List <CarAtt> carList = new ArrayList<>();
		
		List<Car> cars = new ArrayList<>(); 
		cars = c.getCarList();
		System.out.println("car객체 배열 : " + cars);

		// 가져온 bfiles 돌리기
		for(MultipartFile mf : bfiles) {
			MultipartFile file = mf;
			
			// System.out.println("for문 파일 file : " + file.getOriginalFilename() );
			
			// 업로드 파일 서버에 저장
			// 파일이 첨부 되었다면
			if(!file.getOriginalFilename().equals("")) {
				// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
				Map<String, String> files = busSaveFile(file, request);
				
				// DB에 저장하기 위한 파일명 세팅
				if(files != null) {
					BusinessAtt ba = new BusinessAtt();
					ba.setFile_name(file.getOriginalFilename());
					
					// 맵에 담겨져있는 값의 키 불러오기
					ba.setFile_rename((String)files.get("rename"));
					ba.setFile_root((String)files.get("path"));
					
					list.add(ba);
				}
			}
		}
		
		for(MultipartFile mf : carFiles) {
			MultipartFile file = mf;
			
			if (!file.getOriginalFilename().equals("")) {
				Map<String, String> files = busSaveFile(file, request);
	
				if (files != null) {
					CarAtt ca = new CarAtt();
					
					ca.setFile_name(file.getOriginalFilename());
					ca.setFile_rename((String) files.get("rename"));
					ca.setFile_root((String) files.get("path"));
					
					carList.add(ca);
				}
			}
		}
		
		// 업로드 파일 서버에 저장
		// 파일이 첨부 되었다면
		if(!mainFile.getOriginalFilename().equals("")) {
			// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			Map<String, String> file = busSaveFile(mainFile, request);
			
			// DB에 저장하기 위한 파일명 세팅
			if(file != null) {
				
				bat.setFile_name(mainFile.getOriginalFilename());
				
				// 맵에 담겨져있는 값의 키 불러오기
				bat.setFile_rename((String)file.get("rename"));
				bat.setFile_root((String)file.get("path"));
			}
		}
		
		if(primonth != 0) {
			// 넘어온 개월수에 따라 amount값 주기
			if(primonth == 30) {
				i.setAmount(70);		
			} else if(primonth == 90) {
				i.setAmount(90);
			} else {
				i.setAmount(180);
			}
			int result3 = bService.insertIncome1(i);
		}
		
		int result = bService.insertBusiness(b, list);
		int result2 = bService.insertCar(cars, carList);
		int result4 = bService.insertMain(bat);
		
		if (result > 0  && result2 > 0) {
			return "redirect:/main";
		} else {
			throw new businessException("사업 등록에 실패하였습니다.");
		}
	}

	// 렌트카 리스트
	@GetMapping("/rentcar_list")
	public ModelAndView carList(ModelAndView mv) {
		
		List<Business> carList = bService.selectCarList();
		
		if(carList != null) {
			mv.addObject("carList", carList);
			mv.setViewName("business/rentcar/car_list");
		}
		return mv;
	}
	
	// 예약결제 성공 시 insert
	
	@GetMapping("/pay")
	public String payBtn(@ModelAttribute Income i, @ModelAttribute Booking b, @ModelAttribute Point p, int bus_code) {
		// 포인트에 amount 넣어주기
		p.setPamount(i.getAmount());
		// income에  들어갈 원가 10퍼센트 셋팅
		i.setAmount(i.getAmount() * 1/10);
		
		int income = bService.insertIncome(i);
		
		Point findPoint = bService.findPoint(p);
		
		 if(findPoint != null) {
			 // 이미 포인트가 있으면 기존 포인트 + 결제금액의 90% 적립
			 p.setPbalance(findPoint.getPbalance()+i.getAmount() * 9);
		 } else {
			 // 첫 결제면 그대로 결제금액 90% 셋팅
			 p.setPbalance(i.getAmount() * 9);
		 }
		 // p에 예약하는 사업장주인 usno 넣기
		 Business selectUser = bService.selectBusCodeUser(bus_code);
		 p.setUsno(selectUser.getUs_no());
		 // 포인트 넣기
		int point = bService.insertPoint(p);		
		// 예약정보 insert
		if(b.getBookingLv() == 1) {			
			b.setT_bus_name(selectUser.getBus_name());
			b.setT_booking_address(selectUser.getBus_address());
			b.setT_booking_phone(selectUser.getBus_phone());
			System.out.println("b:" + b);
			int bookingHotel = bService.insertBookingHotel(b);
		} else if(b.getBookingLv() == 2) {
			int bookingTour = bService.insertBookingTour(b);
		} else if(b.getBookingLv() == 3) {
			int bookingCar = bService.insertBookingCar(b);
		}
		
		return "redirect:/main";
		
	}

	// ************* 지혜 *************

	@PostMapping("/insert/bannerAd")
	public String boardInsert(Alliance a, Model model,
							  @RequestParam(value="uploadFile") MultipartFile file,
							  HttpServletRequest request) {
		
		// System.out.println("a : " + a);
		// System.out.println("file : " + file);
		
		// 업로드 파일 서버에 저장
		// 파일이 첨부 되었다면
		if(!file.getOriginalFilename().equals("")) {
			// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			String renameFileName = saveFile(file, request);
			// DB에 저장하기 위한 파일명 세팅
			if(renameFileName != null) {
				a.setAimgname(file.getOriginalFilename());
				a.setAimgcname(renameFileName);
				a.setAimgpath("/busUploadFiles/alliance/" + renameFileName);
			}
		}
		
		int result = bService.insertBannerAd(a);
		
		String usno = a.getUsno();
		
		if(result > 0) {
			model.addAttribute("usno", usno);
			model.addAttribute("msg", "배너 광고 신청이 완료되었습니다. 마이페이지에서 확인하세요!");
			return "redirect:/mypage/buss";
		} else {
			throw new businessException("배너 광고 신청에 실패하였습니다.");
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\busUploadFiles\\alliance";
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdirs();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "_"
							+ (int)(Math.random() * 100000) 
							+ originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		} 
		
		return renameFileName;
	}

	@GetMapping("/bannerAd")
	public String bannerAd(HttpSession session, Model model) {

		User loginUser = (User) session.getAttribute("loginUser");

		List<Business> selectMyBusinessCategory = bService.selectMyBusinessCategory(loginUser);

		model.addAttribute("selectMyBusinessCategory", selectMyBusinessCategory);

		return "business/businessFormSubmit";
	}
	
	@RequestMapping(value="/selectBannerAdImgList", produces="application/json; charset=utf-8")
	public @ResponseBody String selectBannerAdImgList() {
		
		List<Alliance> bannerImglist = bService.selectBannerAdImgList();

		Gson gson = new GsonBuilder()
				        .setDateFormat("yyyy-MM-dd")
				        .create();
		
		return gson.toJson(bannerImglist);
	}
	
	
	// 게시글 상세 페이지
	@GetMapping("/detail")
	public String bannerAdBusinessDetail(int bus_code,
							  HttpServletRequest request,
							  HttpServletResponse response,
							  Model model) {
		
		boolean flagbannerlist = false;	// bus_code 라는 이름의 쿠키가 있는지 확인
		boolean flagbuscode = false;	// 해당 bus_code가 포함 되어 있는지 확인
		
		Cookie[] cookies = request.getCookies();
		try {
			if (cookies != null) {
				for (Cookie c : cookies) {
					if (c.getName().equals("bannerlist")) {
						flagbannerlist = true;
						String bannerlist = URLDecoder.decode(c.getValue(), "UTF-8");

						String[] list = bannerlist.split(",");
						for (String st : list) {
							if (st.equals(String.valueOf(bus_code))) flagbuscode = true;
						}
						if (!flagbuscode) {
							c.setValue(URLEncoder.encode(bannerlist + "," + bus_code, "UTF-8"));
							response.addCookie(c);
						}
					}
				}
				if (!flagbannerlist) {
					Cookie c1 = new Cookie("bannerlist", URLEncoder.encode(String.valueOf(bus_code), "UTF-8"));
					response.addCookie(c1);
				}
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Business selectBusCodeUser = bService.selectBusCodeUser(bus_code);
		//System.out.println("selectBusCodeUser : " + selectBusCodeUser);
		
		Business sbd = bService.selectBannerAdDetail(selectBusCodeUser, !flagbuscode);
		//System.out.println("sbd : " + sbd);
		
		
		if (sbd != null) {
			if (sbd.getBus_category().equals("R")) { // 음식점
				return "redirect:/business/restaurant_detail?bus_code=" + sbd.getBus_code();
			} else if (sbd.getBus_category().equals("T")) { // 관광지
				return "redirect:/business/tour_detail?bus_code=" + sbd.getBus_code();
			} else if (sbd.getBus_category().equals("H")) { // 숙박
				return "redirect:/business/hotel_detail?bus_code=" + sbd.getBus_code();
			} else { // 렌트카
				return "redirect:/business/car_detail?bus_code=" + sbd.getBus_code();
			}
		} else {
			model.addAttribute("msg", "사업장 상세보기에 실패했습니다.");
			return "redirect:/main";
		}
	}
	
	@GetMapping("/adminToDetail")
	public String adminToDetail(int bus_code, Model model) {
		
		Business selectBusCodeUser = bService.selectBusCodeUser(bus_code);
		//System.out.println("프리미엄 광고 디테일 보러가기 selectBusCodeUser : " + selectBusCodeUser);
		
		if (selectBusCodeUser != null) {
			if (selectBusCodeUser.getBus_category().equals("R")) { // 음식점
				return "redirect:/business/restaurant_detail?bus_code=" + selectBusCodeUser.getBus_code();
			} else if (selectBusCodeUser.getBus_category().equals("T")) { // 관광지
				return "redirect:/business/tour_detail?bus_code=" + selectBusCodeUser.getBus_code();
			} else if (selectBusCodeUser.getBus_category().equals("H")) { // 숙박
				return "redirect:/business/hotel_detail?bus_code=" + selectBusCodeUser.getBus_code();
			} else { // 렌트카
				return "redirect:/business/car_detail?bus_code=" + selectBusCodeUser.getBus_code();
			}
		} else {
			model.addAttribute("msg", "사업장 상세보기에 실패했습니다.");
			return "redirect:/admin/adminAd2Manage";
		}
		
	}
	
	// ************************************************************************************************
  
  	// 신고하기	
	@PostMapping("/report")
	public String reportInsert(Report r, int bus_code,
							  @RequestParam(value="uploadFile") MultipartFile file,
							  HttpServletRequest request, Map map) {
		
		// 업로드 파일 서버에 저장
		// 파일이 첨부 되었다면
		if(!file.getOriginalFilename().equals("")) {
			// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			Map<String, String> files = busSaveFile(file, request);
			// DB에 저장하기 위한 파일명 세팅
			if(files != null) {
				r.setR_img_name(file.getOriginalFilename());						
				 
				// 맵에 담겨져있는 값의 키 불러오기
				r.setR_img_cname((String)files.get("rename"));
				r.setR_img_path((String)files.get("path"));
			}
		}
		
		Business selectUser = bService.selectBusCodeUser(bus_code);
		r.setUsno(selectUser.getUs_no());
		Report findReportStatus = bService.findReportStatus(r);
		 System.out.println("r : " + r);
		 System.out.println("frs : " + findReportStatus);
		
		// 해당 업체가 신고기록이 없을 때 insert
		if(findReportStatus == null) {					
			int result = bService.insertReport(r);
								
			if(result > 0) {						
				return "redirect:/business/restaurant_detail?bus_code=" + r.getBus_code();
			} else {
				throw new businessException("신고에 실패하였습니다.");
			}
			
		// 신고기록이 있을 때	
		} else {
			// Rstatus가 n일 경우
			if(findReportStatus.getRstatus().equals("N")) {
				return "redirect:/business/restaurant_detail?bus_code=" + r.getBus_code();
				
			// Rstatus가 n이 아닐 경우	
			} else {

				// 기존 rcount를 가져와서 insert하기
				System.out.println("r2 : " + r);
				int result = bService.insertReport2(r);
									

				if(result > 0) {							
					return "redirect:/business/restaurant_detail?bus_code=" + r.getBus_code();
				} else {
					throw new businessException("신고에 실패하였습니다.");
				}
			}
		}
	
	}
	
	// 첨부파일 리네임 메소드 (공용)
	public Map<String, String> busSaveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\busUploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdirs(); // -> 해당 경로가 존재하지 않는다면 디렉토리 생성
		
		// System.out.println("Root " + root);
		// 파일명 리네임 규칙 "년월일시분초_랜덤값.확장자"
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "_"
							+ (int)(Math.random() * 100000) 
							+ originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName; // 저장하고자하는 경로 + 파일명
	
		Map<String, String> map = new HashMap<>();
		map.put("rename", renameFileName);
		map.put("path", renamePath);
		
		// System.out.println("map : " + map);
		
		try {
			file.transferTo(new File(renamePath));
			// => 업로드 된 파일 (MultipartFile) 이 rename명으로 서버에 저장
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		} 
		
		return map;

	}

}
