package com.kh.samdado.user.model.dao;

import java.util.List;

import com.kh.samdado.admin.model.vo.PageInfo;
import com.kh.samdado.admin.model.vo.aSearch;
import com.kh.samdado.user.model.vo.User;

public interface UserDao {
	
	public User selectUser(User u);

	public int insertUser(User u);

	public int updateUser(User u);

	public User findUserId(User u);

	public User findUserPwd(User u);

	public User selectIdCheckUser(User u);

	public User selectPhoneCheckUser(User u);

	public User selectEmailCheckUser(User u);

	public User selectChangePwdUser(User u);

	public int updatePwdUser(User u);
	
	public int updateAdminUser(User u);

	public int countUser();

	public List<User> selectAllUserList(PageInfo pi);

	public List<User> searchUserList(aSearch search);



}
