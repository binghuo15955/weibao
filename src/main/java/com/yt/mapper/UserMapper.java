package com.yt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yt.entity.User;

public interface UserMapper {
	int deleteByPrimaryKey(Integer uid);

	int insert(User record);

	int insertSelective(User record);

	User selectByPrimaryKey(Integer uid);

	int updateByPrimaryKeySelective(User record);

	int updateByPrimaryKeyWithBLOBs(User record);

	int updateByPrimaryKey(User record);

	User selectByUsername_password(@Param("username") String username, @Param("password") String password);

	int validate_Duplicate(@Param("username") String username,@Param("email") String email,@Param("name") String name,@Param("telephone") String telephone);

	int edit_password(@Param("username") String username,@Param("old_pw") String old_password,@Param("new_pw") String new_password);

	User selectByUsername_password_status(@Param("username") String username, @Param("password") String password);

	List<User> selectAll(@Param("page") String page,@Param("limit") String limit);

	int countAll();

	List<User> selectByMany(@Param("name") String name, @Param("username") String username,@Param("start_time")  String start_time, @Param("end_time") String end_time,
			@Param("email") String email, @Param("telephone") String telephone,@Param("status")  String status,@Param("page") String page,@Param("limit") String limit);

	int countByMany(@Param("name") String name, @Param("username") String username,@Param("start_time")  String start_time, @Param("end_time") String end_time,
			@Param("email") String email, @Param("telephone") String telephone,@Param("status")  String status);

}