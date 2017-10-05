package com.vector.dao;

import com.vector.vo.User;

public interface UserDao {
	
	public void save(User user);

	public User findByLogonName(String email);

	public User login(User user);


    public User getById(int id);
}
