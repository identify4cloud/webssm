package com.pg.dao;

import java.sql.Date;
import java.util.List;

import com.pg.beans.User;


public interface UserDao {
	public void add(User user);
	public void remove(int id);
	public List<User> getAll(Date datemin, Date datemax, String sex, String name);
	public void update(User user);
	public User getUserByNameAndPassword(String name, String password);
	public User get(int id);
	public boolean nameExists(String name);
}
