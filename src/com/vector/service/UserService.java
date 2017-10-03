package com.vector.service;

import com.vector.vo.User;

public interface UserService {
	public void register(User user);
	public User login(User user);
	public User findByLogonName(String email);
}