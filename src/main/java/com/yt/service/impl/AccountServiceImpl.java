package com.yt.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yt.entity.User;
import com.yt.mapper.UserMapper;
import com.yt.service.RegisterI;
import com.yt.util.initWebSocketServer;

@Service("accountService")
public class AccountServiceImpl implements RegisterI {

	@Autowired
	private UserMapper userMapper;

	private P2PServiceImpl p2pService = initWebSocketServer.getP2pService();

	public int insertUser(User user) {
		String sex = user.getSex();
		if (sex != null && sex != "") {
			if ("female".equals(sex)) {
				user.setSex("女");
			} else if ("male".equals(sex)) {
				user.setSex("男");
			}
		}
		user.setRegister_time(new Date());
		user.setStatus("0");
		user.setCredit("100");
		if (validate_duplicate("username", user.getUsername()) || validate_duplicate("email", user.getEmail())
				|| validate_duplicate("name", user.getName()) || validate_duplicate("telephone", user.getTelephone())) {
			try {
				p2pService.connectToPeer("ws://127.0.0.1:7001");
			} catch (Exception e) {
				return 0;
			}
			/*if(userMapper.insert(user)>0) {
				return user.getUid();
			}*/
			return userMapper.insert(user);
		}
		return 0;
	}

	public User validateUser(User user) {
		String username = user.getUsername();
		String password = user.getPassword();
		try {
			p2pService.connectToPeer("ws://127.0.0.1:7001");
		} catch (Exception e) {
			return null;
		}
		return userMapper.selectByUsername_password(username, password);

	}

	public boolean validate_duplicate(String key, String value) {
		int row = 0;
		if (!"".equals(key)) {
			switch (key) {
			case "username":
				row = userMapper.validate_Duplicate(value, "", "", "");
				if (row < 1) {
					return true;
				} else {
					return false;
				}
			case "email":
				row = userMapper.validate_Duplicate("", value, "", "");
				if (row < 1) {
					return true;
				} else {
					return false;
				}
			case "name":
				row = userMapper.validate_Duplicate("", "", value, "");
				if (row < 1) {
					return true;
				} else {
					return false;
				}

			case "telephone":
				row = userMapper.validate_Duplicate("", "", "", value);
				if (row < 1) {
					return true;
				} else {
					return false;
				}
			default:
				return false;
			}
		}
		return false;

	}

	public boolean edit_password(String username, String old_password, String new_password) {
		if (userMapper.edit_password(username, old_password, new_password) > 0) {
			return true;
		} else {
			return false;
		}
	}

	public User validateAdmin(User user) {
		String username = user.getUsername();
		String password = user.getPassword();
		return userMapper.selectByUsername_password_status(username, password);
	}

	public List<User> getAll(String page, String limit) {
		int page1 = (Integer.parseInt(page) - 1) * Integer.parseInt(limit);
		String page2 = String.valueOf(page1);
		List<User> users = userMapper.selectAll(page2, limit);
		return users;
	}

	public int countAll() {
		return userMapper.countAll();
	}

	public boolean edit(String id, String key, String value) {
		User user = new User();
		user.setUid(Integer.parseInt(id));
		switch (key) {
		case "password":
			user.setPassword(value);
			break;
		case "name":
			user.setName(value);
			break;
		case "sex":
			user.setSex(value);
			break;
		case "email":
			user.setEmail(value);
			break;
		case "telephone":
			user.setTelephone(value);
			break;
		case "address":
			user.setAddress(value);
			break;
		case "credit":
			user.setCredit(value);
			break;
		case "status":
			user.setStatus(value);
			break;
		default:
			break;
		}
		int row = userMapper.updateByPrimaryKeySelective(user);
		if (row > 0) {
			return true;
		}
		return false;
	}

	public boolean del(String id) {
		int uid = Integer.parseInt(id);
		int row =userMapper.deleteByPrimaryKey(uid);
		if(row>0) {
			return true;
		}
		return false;
	}

	public List<User> getbyMany(String name, String username, String start_time, String end_time,
			String email, String telephone, String status, String page, String limit) {
		int page1=(Integer.parseInt(page)-1)*Integer.parseInt(limit);
		String page2=String.valueOf(page1);
		List<User> users = userMapper.selectByMany(name,username,start_time,end_time,email,telephone,status,page2,limit);
		return users;
	}

	public int countbyMany(String name, String username, String start_time, String end_time,
			String email, String telephone, String status) {
		return userMapper.countByMany(name,username,start_time,end_time,email,telephone,status);
	}

}
