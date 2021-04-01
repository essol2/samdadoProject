package com.kh.samdado.business.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.samdado.business.model.exception.businessException;
import com.kh.samdado.business.model.service.businessService;
import com.kh.samdado.business.model.vo.Alliance;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.business.model.vo.business.BusinessAtt;

@Controller
@RequestMapping("/business")
public class businessController {
	
	@Autowired businessService bService;
	
	// 호텔
	@GetMapping("/hotel_list")
	public String hotelList() {
		return "business/hotel/hotel_list";
		
	}
	
	@GetMapping("/hotel_detail")
	public String hotelDetail() {
		return "business/hotel/hotel_detail";
		
	}
	
	@GetMapping("/hotel_write")
	public String hotelInsert() {
		return "business/hotel/hotel_write";
	}
	
	// 관광
	@GetMapping("/tour_list")
	public String business() {
		return "business/tour/tour_list";
		
	}
	
	@GetMapping("/tour_detail")
	public String tourDetail() {
		return "business/tour/tour_detail";
		
	}
	
	@GetMapping("/tour_write")
	public String tourInsert() {
		return "business/tour/tour_write";
	}
	
	// 음식점
	@GetMapping("/restaurant_list")
	public String restaurantList() {
		return "business/restaurant/restaurant_list";
		
	}
	
	@GetMapping("/restaurant_detail")
	public String restaurantDetail() {
		return "business/restaurant/restaurant_detail";
		
	}
	
	@GetMapping("/restaurant_write")
	public String restaurantInsert() {
		return "business/restaurant/restaurant_write";
	}
	
	// 음식점 등록 - 파일첨부(리네임)
	@PostMapping("/restaurant_insert")
	public String insertRestaurant(Business b, BusinessAtt ba,
							  @RequestParam(value="uploadFile") MultipartFile file,
							  HttpServletRequest request) {
		
		System.out.println("비즈니스" + b);
		System.out.println("비즈니스 첨부파일" + ba);
		// 업로드 파일 서버에 저장
		// 파일이 첨부 되었다면
		if(!file.getOriginalFilename().equals("")) {
			// 파일 저장 메소드 별도로 작성 - 리네임명 리턴
			String renameFileName = busSaveFile(file, request);
			// DB에 저장하기 위한 파일명 세팅
			if(renameFileName != null) {
				ba.setFile_name(file.getOriginalFilename());
				ba.setFile_rename(renameFileName);
			}
		}
		
		int result = bService.insertRestaurant(b);
		int result2 = bService.insertRestaurant2(ba);
		
		
		if(result > 0 && result2 > 0) {
			return "redirect:/common/main";
		} else {
			throw new businessException("사업 등록에 실패하였습니다.");
		}
	}
	
	public String busSaveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\busUploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) folder.mkdirs(); // -> 해당 경로가 존재하지 않는다면 디렉토리 생성
		
		// 파일명 리네임 규칙 "년월일시분초_랜덤값.확장자"
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "_"
							+ (int)(Math.random() * 100000) 
							+ originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName; // 저장하고자하는 경로 + 파일명
		
		try {
			file.transferTo(new File(renamePath));
			// => 업로드 된 파일 (MultipartFile) 이 rename명으로 서버에 저장
		} catch (IllegalStateException | IOException e) {
			System.out.println("파일 업로드 에러 : " + e.getMessage());
		} 
		
		return renameFileName;
	}
	
	// 렌트카
	@GetMapping("/car_list")
	public String carList() {
		return "business/rentcar/car_list";
		
	}
	
	@GetMapping("/car_detail")
	public String carDetail() {
		return "business/rentcar/car_detail";
		
	}
	
	@GetMapping("/rentcar_write")
	public String rentcarInsert() {
		return "business/rentcar/rentcar_write";
		
	}
	
	// ************* 지혜 *************
	// 배너 등록 페이지로 이동
	@GetMapping("/bannerAd")
	public String submitBannerAdView() {
		return "business/businessFormSubmit";
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
		int result = bService.insertAlliance(a);
		
		if(result > 0) {
			return "redirect:/mypage"; // 마이페이지 컨트롤러로 리다이렉트
		} else {
			throw new businessException("배너광고 신청에 실패하였습니다.");
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
