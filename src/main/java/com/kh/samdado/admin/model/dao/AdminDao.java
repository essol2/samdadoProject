package com.kh.samdado.admin.model.dao;

import java.util.List;

import com.kh.samdado.mypage.model.vo.QnA;

public interface AdminDao {

	List<QnA> adminMainQnaSelect();

	List<QnA> adminQnaSelect();

	int insertQnaReply(QnA q);

}
