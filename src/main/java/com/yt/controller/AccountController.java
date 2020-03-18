package com.yt.controller;

import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.util.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yt.entity.User;
import com.yt.service.impl.AccountServiceImpl;
import com.yt.util.renderData;

@Controller
@RequestMapping("account")
public class AccountController {

	@Autowired
	private AccountServiceImpl accountService;	
	
//	---管理界面
	
	@RequestMapping("getbymany")
	@ResponseBody
	public void getbymany(String name,String username,String start_time,String end_time,String email,String telephone,String status,String page,String limit,ModelMap model,HttpServletResponse response) {
		List<User> users= accountService.getbyMany(name,username,start_time,end_time,email,telephone,status,page,limit);
		int count =accountService.countbyMany(name,username,start_time,end_time,email,telephone,status);
		model.put("data",users);
		model.put("msg","");
		model.put("status",0);
		model.put("count",count);
		renderData.render_Data(response, model);
	}
	
	@RequestMapping("del")
	@ResponseBody
	public String del(String id) {
		boolean flag = accountService.del(id);
		if(flag) {
			return "success";
		}
		return "failed";
	}
	
	@RequestMapping("edit")
	@ResponseBody
	public String edit(String id,String key,String value) {
		boolean flag = accountService.edit(id,key,value);
		if(flag) {
			return "success";
		}
		return "failed";
	}
	
	
	@RequestMapping("getAll")
	@ResponseBody
	public void get_all(ModelMap model,String page,String limit,HttpServletResponse response) {
		List<User> users = accountService.getAll(page,limit);
		int count = accountService.countAll();
		model.put("data", users);
		model.put("status", 0);
		model.put("count", count);
		model.put("msg", "");
		
		renderData.render_Data(response, model);
	}
	
	
	
	
//	---用户界面
	
	@RequestMapping("edit_password")
	@ResponseBody
	public String edit_password(String old_password,String new_password,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		boolean flag = accountService.edit_password(username,old_password,new_password);
		if(flag) {
			return "success";
		}else {
			return "failed";
		}
	}

	@RequestMapping("duplicate")
	@ResponseBody
	public String validate_duplicate(HttpServletRequest request) {
		String key = request.getParameter("key");
		String value = request.getParameter("value");
		System.err.println("-->duplicate");
		System.err.println(key+":"+value);
		boolean flag=accountService.validate_duplicate(key,value);
		if(flag==true) {
			return "success";
		}else {
			return "failed";
		}
	}
	
	@RequestMapping("login")
	@ResponseBody
	public String login(HttpServletRequest request, User user,String isAdmin) {
		System.err.println("client-->account-->login");
		User user1 =null;
		if("on".equals(isAdmin)) {
			user1 = accountService.validateAdmin(user);
		}else {
			user1 = accountService.validateUser(user);
		}
		if (user1 != null ) {
			HttpSession session = request.getSession();
			session.setAttribute("name", user1.getName());
			session.setAttribute("username", user1.getUsername());
			session.setAttribute("userid", user1.getUid());
			session.setAttribute("sex", user1.getSex());
			session.setAttribute("credit", user1.getCredit());
			session.setAttribute("status", user1.getStatus());
			return "success";
		} else {
			return "failed";
		}
	}

	@RequestMapping("exit")
	@ResponseBody
	public void exit(HttpServletRequest request) {
		System.err.println("client-->account-->exit");
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		session.removeAttribute("name");
		session.removeAttribute("userid");
		session.removeAttribute("sex");
		session.removeAttribute("credit");
		session.removeAttribute("status");
	}

	@RequestMapping("/add")
	@ResponseBody
	public String addUser(User user,HttpServletRequest request) {
		System.err.println("client-->register-->add");
		int row = accountService.insertUser(user);
		if(row>0) {
			HttpSession session=request.getSession();
			session.setAttribute("username", user.getUsername());
			session.setAttribute("name", user.getName());
			session.setAttribute("userid", user.getUid());
			session.setAttribute("sex", user.getSex());
			session.setAttribute("credit", user.getCredit());
			return "success";
		}else {
			return "failed";
		}
	}

	@RequestMapping("up")
	public String upload(MultipartFile upFile, String desc) {
		try {
			FileOutputStream fos = new FileOutputStream("d:/" + upFile.getOriginalFilename());
			String newFileName = new Date().getTime() + "";
			// 锟斤拷锟� 原锟侥硷拷锟斤拷 锟斤拷锟侥硷拷锟斤拷 锟斤拷锟斤拷路锟斤拷 锟侥硷拷锟斤拷小KB MD5(32位锟街达拷) 锟较达拷锟斤拷 锟较达拷锟斤拷锟斤拷
			// 1 a.txt 123235346.txt d:/2018/11/03/ 123 asfw123213s123
			IOUtils.copy(upFile.getInputStream(), fos);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
}
