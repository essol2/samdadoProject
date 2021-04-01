package com.kh.samdado.business.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.business.model.vo.Alliance;
import com.kh.samdado.business.model.vo.business.Business;
import com.kh.samdado.business.model.vo.business.BusinessAtt;

@Repository 
public class businessDaoImpl implements businessDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertAlliance(Alliance a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("businessMapper.insertAlliance", a);
	}

	@Override
	public int insertRestaurant(Business b) {
		return sqlSession.insert("businessMapper.insertRestaurant", b);
	}

	@Override
	public int insertRestaurant2(BusinessAtt ba) {
		return sqlSession.insert("businessMapper.insertRestaurant2", ba);
	}

	

}
