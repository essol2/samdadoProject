package com.kh.samdado.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.mypage.model.vo.QnA;

@Repository 
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<QnA> adminMainQnaSelect() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.selectAdminMainQnaSelect");
	}

	@Override
	public List<QnA> adminQnaSelect() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.adminQnaSelect");
	}

	@Override
	public int insertQnaReply(QnA q) { // update
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.insertQnaReply", q);
	}

	@Override
	public int countQnA() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.countQnA");
	}

	

}
