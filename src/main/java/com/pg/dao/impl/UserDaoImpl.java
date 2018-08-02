package com.pg.dao.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.pg.beans.User;
import com.pg.dao.UserDao;


/**
 * @author Administrator
 *
 */
@Component
public class UserDaoImpl extends BaseDao implements UserDao{
	
	@Override
	public void add(User user) {
		template.insert("com.pg.mapper.UserMapper.add", user);
	}
	@Override
	public void remove(int id) {
		template.insert("com.pg.mapper.UserMapper.delete", id);
	}
	@Override
	public List<User> getAll(Date datemin, Date datemax, String sex, String name) {
		Map<String,Object> userMap = new HashMap<>();
		userMap.put("datemin",datemin);
		userMap.put("datemax",datemax);
		if(name==null || name.equals("")) {
			userMap.put("name",name);
		}else {
			userMap.put("name","%"+name+"%");
		}
		userMap.put("sex",sex);
		List<User> list = template.selectList("com.pg.mapper.UserMapper.selectAll",userMap);
		System.out.println(datemin+","+datemax+","+sex+","+name);
		return list;
		
	}
	@Override
	public void update(User user) {
		template.update("com.pg.mapper.UserMapper.update",user);
		
	}
	@Override
	public User getUserByNameAndPassword(String name, String password) {
		Map<String,Object> map = new HashMap<>();
		map.put("name", name);
		map.put("password", password);
		User u = template.selectOne("com.pg.mapper.UserMapper.getUserByNameAndPassword",map);
		
		return u;
		
	}
	@Override
	public User get(int id) {
		User u = template.selectOne("com.pg.mapper.UserMapper.getById",id);
		return u;
		
	}

	@Override
	public boolean nameExists(String name) {
		return false;
		
	}
}
