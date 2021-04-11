package com.kh.samdado.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.samdado.admin.model.vo.PageInfo;
import com.kh.samdado.admin.model.vo.aSearch;
import com.kh.samdado.user.model.dao.UserDao;
import com.kh.samdado.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService {
   @Autowired
   private UserDao uDao;
   
   @Override
   public User loginUser(User u) {
      return uDao.selectUser(u);
   }

	@Override
	public int insertUser(User u) {
		return uDao.insertUser(u);
	}

	@Override
	public int updateUser(User u) {
		return uDao.updateUser(u);
	}

	@Override
	public User findUserId(User u) {
		return uDao.findUserId(u);
	}

	@Override
	public User findUserPwd(User u) {
		return uDao.findUserPwd(u);
	}

	@Override
	public User selectIdCheckUser(User u) {
		// TODO Auto-generated method stub
		return uDao.selectIdCheckUser(u);
	}

	@Override
	public User selectEmailCheckUser(User u) {
		// TODO Auto-generated method stub
		return uDao.selectEmailCheckUser(u);
	}

	@Override
	public User selectPhoneCheckUser(User u) {
		// TODO Auto-generated method stub
		return uDao.selectPhoneCheckUser(u);
	}

	@Override
	public User selectChangePwdUser(User u) {
		// TODO Auto-generated method stub
		return uDao.selectChangePwdUser(u);
	}

	@Override
	public int updatePwdUser(User u) {
		// TODO Auto-generated method stub
		return uDao.updatePwdUser(u);
	}
	
	@Override
	public int updateAdminUser(User u) {
		// TODO Auto-generated method stub
		return uDao.updateAdminUser(u);
	}

	@Override
	public int countUser() {
		// TODO Auto-generated method stub
		return uDao.countUser();
	}

	@Override
	public List<User> selectAllUserList(PageInfo pi) {
		// TODO Auto-generated method stub
		return uDao.selectAllUserList(pi);
	}

	@Override
	public List<User> searchUserList(aSearch search) {
		// TODO Auto-generated method stub
		return uDao.searchUserList(search);
	}


	

   
}