package com.pg.beans;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

public class User {
	private int id;
	private String name;
	private int age;
	private String password;
	private Date birthday;
	private String sex;
	private Date udate;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String name, int age, String password, Date birthday, String sex) {
		super();
		this.name = name;
		this.age = age;
		this.password = password;
		this.birthday = birthday;
		this.sex = sex;
	}


	public User(int id, String name, int age, String password, Date birthday, String sex, Date udate) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.password = password;
		this.birthday = birthday;
		this.sex = sex;
		this.udate = udate;
	}
	

	public User(int id, String name, int age, Date birthday, String sex, Date udate) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.birthday = birthday;
		this.sex = sex;
		this.udate = udate;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getUdate() {
		return udate;
	}
	public void setUdate(Date udate) {
		this.udate = udate;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", age=" + age + ", password=" + password + ", birthday="
				+ birthday + ", sex=" + sex + ", udate=" + udate + "]";
	}
	
	
}
