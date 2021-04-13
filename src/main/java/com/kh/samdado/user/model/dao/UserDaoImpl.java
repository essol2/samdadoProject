package com.kh.samdado.user.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.samdado.admin.model.vo.PageInfo;
import com.kh.samdado.admin.model.vo.aSearch;
import com.kh.samdado.user.model.vo.User;

@Repository 
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public User selectUser(User u) {
		return sqlSession.selectOne("userMapper.selectUser", u);
	}

	@Override
	public int insertUser(User u) {
		return sqlSession.insert("userMapper.insertUser", u);
	}

	@Override
	public int updateUser(User u) {
		return sqlSession.update("userMapper.updateUser", u);
	}

	@Override
	public User findUserId(User u) {
		return sqlSession.selectOne("userMapper.findUserId", u);
	}

	@Override
	public User findUserPwd(User u) {
		return sqlSession.selectOne("userMapper.findUserPwd", u);
	}

	@Override
	public User selectIdCheckUser(User u) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.selectIdCheckUser", u);
	}

	@Override
	public User selectPhoneCheckUser(User u) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.selectPhoneCheckUser", u);
	}

	@Override
	public User selectEmailCheckUser(User u) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.selectEmailCheckUser", u);
	}

	@Override
	public User selectChangePwdUser(User u) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.selectChangePwdUser", u);
	}

	@Override
	public int updatePwdUser(User u) {
		// TODO Auto-generated method stub
		return sqlSession.update("userMapper.updatePwdUser", u);
	}
	
	@Override
	public int updateAdminUser(User u) {
		// TODO Auto-generated method stub
		return sqlSession.update("userMapper.updateAdminUser", u);
	}

	@Override
	public int countUser() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.countUser");
	}

	@Override
	public List<User> selectAllUserList(PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return sqlSession.selectList("userMapper.selectAllUserList", null, rowBounds);
	}

	@Override
	public List<User> searchUserList(aSearch search) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userMapper.searchUserList", search);
	}


}
