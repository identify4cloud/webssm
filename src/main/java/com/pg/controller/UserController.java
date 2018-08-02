package com.pg.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.pg.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pg.beans.User;
import com.pg.service.UserService;

@Controller
public class UserController {
	private UserService userSerivce;
	
	public UserService getUserSerivce() {
		return userSerivce;
	}
	@Autowired
	public void setUserSerivce(UserService userSerivce) {
		this.userSerivce = userSerivce;
	}
	@RequestMapping(value="/login")
	public ModelAndView login(String name,String password,HttpServletRequest request){
		System.out.println("login...");
		System.out.println(name+","+password);
		User u = userSerivce.login(name, password);
		if(u == null) {
			System.out.println("用户名或密码错误");
			return new ModelAndView("login", "login_error", "用户名或密码错误");
		}
		System.out.println("登录成功");
		request.getSession().setAttribute("online_user", u);
		return new ModelAndView("redirect:list");
	}
	@RequestMapping(value="/list")
	public ModelAndView list(String datemin,String datemax,String sex,String name,HttpServletRequest request) {
		java.sql.Date datemin1 = DateUtil.change(DateUtil.toDate(datemin));
		java.sql.Date datemax1=DateUtil.change(DateUtil.toDate(datemax));
		List<User> users = userSerivce.list(datemin1,datemax1,sex,name);
		request.getSession().setAttribute("datemin",datemin);
		request.getSession().setAttribute("datemax",datemax);
		request.getSession().setAttribute("name",name);
		return new ModelAndView("list", "user_list", users);
	}
	@RequestMapping(value="/regist")
	public String regist(User u){
		System.out.println("regist...");
		u.setBirthday(new Date());
		System.out.println(u);
		userSerivce.save(u);
		return "login";
	}
	@RequestMapping(value="/delete")
	public String delete(int id){
		userSerivce.delete(id);
		return "forward:list";
	}
    @RequestMapping(value="/getById")
    public String getById(int id,HttpServletRequest request){

        User user = userSerivce.get(id);
        request.getSession().setAttribute("update_user",user);
        return "update";

    }
    @RequestMapping(value="/update")
    public String update(User user){
        user.setUdate(new Date());
         userSerivce.update(user);
        return "forward:list";
    }
}

