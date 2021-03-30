package com.kh.samdado.listpage.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.samdado.listpage.model.exception.ListpageException;
import com.kh.samdado.listpage.model.service.ListpageService;
import com.kh.samdado.listpage.model.vo.Alliance;

@Controller
@RequestMapping("/listpage")
public class ListpageController {
	
	@Autowired ListpageService lService;
	
	@GetMapping("/hotel_list")
	public String hotelList() {
		return "listpage/hotel_list";
		
	}
	
	@GetMapping("/hotel_detail")
	public String hotelDetail() {
		return "listpage/hotel_detail";
		
	}
	
	@GetMapping("/tour_list")
	public String tourList() {
		return "listpage/tour_list";
		
	}
	
	@GetMapping("/tour_detail")
	public String tourDetail() {
		return "listpage/tour_detail";
		
	}
	
	@GetMapping("/restaurant_list")
	public String restaurantList() {
		return "listpage/restaurant_list";
		
	}
	
	@GetMapping("/restaurant_detail")
	public String restaurantDetail() {
		return "listpage/restaurant_detail";
		
	}
	
	@GetMapping("/car_list")
	public String carList() {
		return "listpage/car_list";
		
	}
	
	@GetMapping("/car_detail")
	public String carDetail() {
		return "listpage/car_detail";
		
	}
	
	// ************* 지혜 *************
	// 배너 등록 페이지로 이동
	@GetMapping("/bannerAd")
	public String submitBannerAdView() {
		return "bussiness/bussinessFormSubmit";
	}
	
	// 배너 등록 신청 제출 컨트롤러
	@PostMapping("/insert/bannerAd")
	public String insertBannerAd(@ModelAttribute Alliance a,
			   					 @RequestParam(name="uploadFile") MultipartFile file,
			   					 HttpServletRequest request) {
		
		System.out.println("배너광고 신청폼 작성 내용 : " + a);
		System.out.println("업로드 된 파일명 : " + file.getOriginalFilename());

		if (!file.getOriginalFilename().equals("")) {	// 파일이 업로드 되었다면
			String saveFile = saveFile(file, request);
		
			if (saveFile != null) {
			// 파일 저장 후 Notice 객체에 (저장 경로 + 파일명) 저장
				a.setImgpath("/luploadFiles/" + file.getOriginalFilename());
			}
		}
		
		// * 2) DB에 insert
		int result = lService.insertAlliance(a);
		
		if(result > 0) {
			return "redirect:/mypage"; // 마이페이지 컨트롤러로 리다이렉트
		} else {
			throw new ListpageException("배너광고 신청에 실패하였습니다.");
		}
		
	}
		
		
	// 파일 저장 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
	
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\luploadFiles";
		
		System.out.println("savePath : " + savePath);
		
		// savePath 경로를 메모리상에서 생성해서
		File folder = new File(savePath);
		
		// 해당 폴더가 존재하지 않는다면
		if (!folder.exists()) {
			folder.mkdirs();
		}
			
	
		String filePath = folder + "\\" + file.getOriginalFilename();
		// 실제 저장 될 파일 경로 + 넘어온 파일명
		
		try {
			file.transferTo(new File(filePath)); // 이 때 파일이 저장 됨
			
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 저장 에러 : " + e.getMessage());
		}
			return filePath;
	
	
	}
	
	
	
	
	
	
}
