package com.pg.service.impl;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.pg.beans.User;
import com.pg.dao.UserDao;
import com.pg.service.UserService;

@Component("userService")
public class UserServiceImpl implements UserService {
	private UserDao userDao;
	
	
	public UserDao getUserDao() {
		return userDao;
	}
	@Resource
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	@Transactional
	@Override
	public void save(User user) {
		userDao.add(user);
	}
	@Override
	public void delete(int id) {
		userDao.remove(id);
	}
	@Override
	public List<User> list(Date datemin, Date datemax, String sex,String name) {
		return userDao.getAll(datemin,datemax,sex,name);
	}
	@Override
	public void update(User user) {
		userDao.update(user);
	}
	@Override
	public User login(String name, String password) {
		User u = userDao.getUserByNameAndPassword(name,password);
		return u;
	}
	@Override
	public User get(int id) {
		return userDao.get(id);
	}

	@Override
	public boolean validateName(String name) {
		return !userDao.nameExists(name);
	}

}
