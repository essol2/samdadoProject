package com.kh.samdado.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.user.model.vo.User;

@Repository 
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	

}
