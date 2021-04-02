package com.kh.samdado.user.model.service;

import com.kh.samdado.user.model.vo.User;

public interface UserService {
   
	  // 로그인
      public User loginUser(User u);

      // 회원가입
	  public int insertUser(User u);

	  // 회원 정보수정
	  public int updateUser(User u);

	  // 회원 정보찾기
	  public User findUserId(User u);

	  // 회원 정보찾기
	  public User findUserPwd(User u);

	  // 회원가입 아이디 중복확인
	  public User selectIdCheckUser(User u);

	  // 회원가입 이메일 중복확인
	  public User selectEmailCheckUser(User u);

	  // 회원가입 전화번호 중복확인
	  public User selectPhoneCheckUser(User u);

	  // 링크 타고 비번 변경하러 넘어 온 회원 인증키와 이메일 db와 일치하는지 확인
	  public User selectChangePwdUser(User u);

	  // 비번 수정
	  public int updatePwdUser(User u);

	  // 관리자 정보 수정
	  public int updateAdminUser(User u);

	  // 총 회원수 구하기
	  public int countUser();

	





}