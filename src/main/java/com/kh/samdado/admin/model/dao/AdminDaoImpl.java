package com.kh.samdado.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.admin.model.vo.PageInfo;
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
	public List<QnA> adminQnaSelect(PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("adminMapper.adminQnaSelect", null, rowBounds);
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
