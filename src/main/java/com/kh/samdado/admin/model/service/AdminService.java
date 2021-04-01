package com.kh.samdado.admin.model.service;

import java.util.List;

import com.kh.samdado.mypage.model.vo.QnA;

public interface AdminService {

	List<QnA> adminMainQnaSelect();

	List<QnA> adminQnaSelect();

	int insertQnaReply(QnA q);
	
   


}