package com.pg.service;

import java.sql.Date;
import java.util.List;

import com.pg.beans.User;

	
public interface UserService {
	public void save(User user);
	public void delete(int id);
	public List<User> list(Date tedatemin, Date datemax1, String sex, String name);
	public void update(User user);
	public User login(String userName, String password);
	public User get(int id);
	public boolean validateName(String name);
}
