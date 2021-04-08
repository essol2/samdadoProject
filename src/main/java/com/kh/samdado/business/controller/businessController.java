package com.kh.samdado.business.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;


import com.kh.samdado.business.model.exception.businessException;
import com.kh.samdado.business.model.service.businessService;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.business.model.vo.business.BusinessAtt;
import com.kh.samdado.business.model.vo.hotel.Room;
import com.kh.samdado.business.model.vo.hotel.RoomAtt;
import com.kh.samdado.business.model.vo.rentcar.Car;
import com.kh.samdado.business.model.vo.rentcar.CarAtt;
import com.kh.samdado.business.model.vo.tour.TourProduct;
import com.kh.samdado.common.model.vo.Alliance;

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
	
		if(b != null) {
			System.out.println("디테일 : " + b);
			model.addAttribute("hotel", b);
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
	public String hotelInsert(Business b, BusinessAtt ba, Room r, RoomAtt ra,
			@RequestParam(value = "uploadFile") MultipartFile file,
			@RequestParam(value = "room_file") MultipartFile roomFile, HttpServletRequest request, Map map) {

		// System.out.println("b : " + b);

		// System.out.println("b : " + r);

		// System.out.println("file : " + file.getOriginalFilename());

		// 업로드 파일 서버에 저장
		// 파일이 첨부 되었다면
		if (!file.getOriginalFilename().equals("")) {
			// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			Map<String, String> files = busSaveFile(file, request);
			// DB에 저장하기 위한 파일명 세팅
			if (files != null) {
				ba.setFile_name(file.getOriginalFilename());

				// 맵에 담겨져있는 값의 키 불러오기
				ba.setFile_rename((String) files.get("rename"));
				ba.setFile_root((String) files.get("path"));
			}
		}

		if (!roomFile.getOriginalFilename().equals("")) {
			// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			Map<String, String> files = busSaveFile(file, request);
			// DB에 저장하기 위한 파일명 세팅
			if (files != null) {
				ra.setFile_name(file.getOriginalFilename());

				// 맵에 담겨져있는 값의 키 불러오기
				ra.setFile_rename((String) files.get("rename"));
				ra.setFile_root((String) files.get("path"));
			}
		}

		int result = bService.insertBusiness(b);
		int result2 = bService.insertBusAtt(ba);
		int result3 = bService.insertRoom(r);
		int result4 = bService.insertRoomAtt(ra);

		if (result > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
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

		System.out.println("나와라" + bus_code);
	
		Business b = bService.selectTour(bus_code);
		
		if(b != null) {
			System.out.println("디테일 : " + b);
			model.addAttribute("tour", b);
			return "business/tour/tour_detail";
		} else {
			model.addAttribute("msg", "공지사항 게시글 보기에 실패했습니다.");
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
	public String tourInsert(Business b, BusinessAtt ba, TourProduct tp,
			@RequestParam(value = "uploadFile") MultipartFile file, HttpServletRequest request, Map map) {

		// System.out.println("b : " + b);

		// System.out.println("b : " + tp);

		// System.out.println("file : " + file.getOriginalFilename());

		// 업로드 파일 서버에 저장
		// 파일이 첨부 되었다면
		if (!file.getOriginalFilename().equals("")) {
			// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			Map<String, String> files = busSaveFile(file, request);
			// DB에 저장하기 위한 파일명 세팅

			if (files != null) {
				ba.setFile_name(file.getOriginalFilename());

				// 맵에 담겨져있는 값의 키 불러오기
				ba.setFile_rename((String) files.get("rename"));
				ba.setFile_root((String) files.get("path"));
			}
		}

		int result = bService.insertBusiness(b);
		int result2 = bService.insertBusAtt(ba);
		int result3 = bService.insertTour(tp);

		if (result > 0 && result2 > 0 && result3 > 0) {
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
	public String restaurantInsert(Business b, BusinessAtt ba,
							  @RequestParam(value="uploadFile") MultipartFile file,
							  HttpServletRequest request, Map map) {
		
		// System.out.println("b : " + b);
		// System.out.println("file : " + file.getOriginalFilename());
		
		// 업로드 파일 서버에 저장
		// 파일이 첨부 되었다면F
		if(!file.getOriginalFilename().equals("")) {
			// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			Map<String, String> files = busSaveFile(file, request);
			
			// DB에 저장하기 위한 파일명 세팅
			if(files != null) {
				ba.setFile_name(file.getOriginalFilename());
				
				// 맵에 담겨져있는 값의 키 불러오기
				ba.setFile_rename((String)files.get("rename"));
				ba.setFile_root((String)files.get("path"));
			}
		}
		
		int result = bService.insertBusiness(b);
		int result2 = bService.insertBusAtt(ba);
		
		if(result > 0 && result2 > 0) {
			return "redirect:/main";
		} else {
			throw new businessException("사업 등록에 실패하였습니다.");
		}
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
	public String rentcarInsert(Business b, CarAtt ca, BusinessAtt ba, Car c,
			@RequestParam(value = "uploadFile") MultipartFile busFile,
			@RequestParam(value = "car") MultipartFile carFile, HttpServletRequest request, Map map) {

		// 업로드 파일 서버에 저장
		// 파일이 첨부 되었다면
		if (!busFile.getOriginalFilename().equals("")) {
			// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			Map<String, String> files = busSaveFile(busFile, request);
			// DB에 저장하기 위한 파일명 세팅
			if (files != null) {
				ba.setFile_name(busFile.getOriginalFilename());

				// 맵에 담겨져있는 값의 키 불러오기
				ba.setFile_rename((String) files.get("rename"));
				ba.setFile_root((String) files.get("path"));
			}
		}

		if (!carFile.getOriginalFilename().equals("")) {
			Map<String, String> files = busSaveFile(busFile, request);

			if (files != null) {
				ca.setFile_name(carFile.getOriginalFilename());
				ca.setFile_rename((String) files.get("rename"));
				ca.setFile_root((String) files.get("path"));
			}
		}

		int result = bService.insertBusiness(b);
		int result2 = bService.insertBusAtt(ba);
		int result3 = bService.insertCar(c);
		int result4 = bService.insertCarAtt(ca);

		if (result > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
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
		
		if(result > 0) {
			model.addAttribute("msg", "배너 광고 신청이 완료되었습니다. 마이페이지에서 확인하세요!");
			return "redirect:/mypage/mp_Advertisement";
		} else {
			throw new businessException("배너 광고 신청에 실패하였습니다.");
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\busUploadFiles\\alliance";
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdirs(); // -> 해당 경로가 존재하지 않는다면 디렉토리 생성
		
		// 파일명 리네임 규칙 "년월일시분초_랜덤값.확장자"
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "_"
							+ (int)(Math.random() * 100000) 
							+ originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
			// => 업로드 된 파일 (MultipartFile) 이 rename명으로 서버에 저장
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
  
  	// 신고하기	
	@PostMapping("/report")
	public String reportInsert(Report r,
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
		
		Report findReportStatus = bService.findReportStatus(r);
		// System.out.println("r : " + r);
		// System.out.println("frs : " + findReportStatus);
		
		// 해당 업체가 신고기록이 없을 때 insert
		if(findReportStatus == null) {					
			int result = bService.insertReport(r);					
								
			if(result > 0) {						
				return "redirect:/main";
			} else {
				throw new businessException("신고에 실패하였습니다.");
			}
			
		// 신고기록이 있을 때	
		} else {
			// Rstatus가 n일 경우
			if(findReportStatus.getRstatus().equals("N")) {
				return "redirect:/main";
				
			// Rstatus가 n이 아닐 경우	
			} else {
				int result = bService.insertReport(r);						
									
				if(result > 0) {							
					return "redirect:/business/restaurant/restaurant_detail";
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
