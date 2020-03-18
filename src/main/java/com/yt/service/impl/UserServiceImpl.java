package com.yt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yt.entity.User;
import com.yt.mapper.UserMapper;

@Service("userService")
public class UserServiceImpl {
	
	@Autowired
	private UserMapper userMapper;
	
	public User getUser(String uid1) {
		if(uid1!=null&&!"".equals(uid1)) {
			int uid = Integer.parseInt(uid1);
			return userMapper.selectByPrimaryKey(uid);
		}else {
			return null;
		}
	}

	

}
