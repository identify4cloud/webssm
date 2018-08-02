package com.pg.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.*;


import com.pg.beans.User;

public interface UserMapper {
	@Insert({"insert into t_user(name,password,age,sex,birthday) values (#{name},#{password},#{age},#{sex},#{birthday})"})
	public void add(User user);
    @Select("select * from t_user where name=#{name} and password = #{password}")
    public User getUserByNameAndPassword(String name, String password);
    @Select("select * from t_user where id = #{id}")
    public User getById(int id);
	@Update({"update t_user set name=#{name},age=#{age},sex=#{sex},udate=#{udate},birthday=#{birthday} where id=#{id}"})
	public void update(User user);
	@Delete("delete from t_user where id=#{id}")
	public void delete(int id);
   @SelectProvider(type = UserSelect.class,method = "findUsers")
   // @Select("select * from t_user")
    public List<User> selectAll(@Param("datemin") Date datemin, @Param("datemax") Date datemax, @Param("sex") String sex, @Param("name") String name);


    public class UserSelect{
        public String findUsers(@Param("datemin") Date datemin, @Param("datemax") Date datemax, @Param("sex") String sex, @Param("name") String name){
            System.out.println("UserSelect....");
            String sql = "select * from t_user where 1=1 ";
            if(datemin!=null) {
                sql +="and birthday >= #{datemin} ";
            }
            if(datemax!=null) {
                sql +="and birthday <= #{datemax} ";
            }
            if(sex!=null && !sex.equals("")) {
                sql +="and sex = #{sex} ";
            }
            if(name!=null && !name.equals("")) {
                sql +="and name like #{name}";
            }
            System.out.println(sql);
            return sql;
        }
    }
	}
