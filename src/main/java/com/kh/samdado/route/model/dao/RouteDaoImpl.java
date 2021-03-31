package com.kh.samdado.route.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository 
public class RouteDaoImpl implements RouteDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


}
