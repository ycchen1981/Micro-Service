package com.localhost.service;

import java.util.List;

import com.localhost.model.UserInfo;

public interface IUserService {
	
	public List<UserInfo> findAllUsers() throws Exception;
	
	public UserInfo findUserByLoginId(String loginId);
	
	public UserInfo findUserByEmail(String email);
	
	public UserInfo findMaxLoginId();

	public Boolean saveUser(UserInfo userInfo);
	
	public Boolean delUser(UserInfo userInfo);
}