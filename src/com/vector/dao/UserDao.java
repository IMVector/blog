package com.vector.dao;

import com.vector.vo.User;

public interface UserDao {
	
	public void save(User user);

	public User findByLogonName(String nickName);

	public User login(User user);

	public User findByEmail(String email);

    public User getById(int id);

    public void updateUser(User user);
}
