package com.vector.service.impl;

import com.vector.dao.UserDao;
import com.vector.service.UserService;
import com.vector.utils.MD5Utils;
import com.vector.vo.User;

public class UserServiceImpl implements UserService {
	private UserDao userDao;
	//注入
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	/**
	 * 注册
	 */
	@Override
	public void register(User user) {
		String password= user.getPassword();
		password=MD5Utils.md5(password);
		user.setPassword(password);
		userDao.save(user);
	}
	/**
	 * 登录
	 */
	@Override
	public User login(User user) {
		String md5=MD5Utils.md5(user.getPassword());
		user.setPassword(md5);
		return userDao.login(user);
	}
	/**
	 * 查询数据库中是否存在要查询的客户
	 */
	@Override
	public User findByLogonName(String email) {
		return userDao.findByLogonName(email);
	}

	@Override
	public User getByid(int id) {
		return userDao.getById(id);
	}

}
