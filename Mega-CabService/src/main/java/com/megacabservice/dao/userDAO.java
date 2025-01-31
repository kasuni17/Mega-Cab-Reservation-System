package com.megacabservice.dao;

import com.megacabservice.entity.user;

public interface userDAO {
	public boolean userRegister(user us);
	
	public user login(String email, String password);
		
	
	
}
