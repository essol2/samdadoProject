package com.kh.samdado.bussiness.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.bussiness.model.vo.Alliance;

@Repository 
public class bussinessDaoImpl implements bussinessDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertAlliance(Alliance a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("listMapper.insertAlliance", a);
	}

}
