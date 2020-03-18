package com.yt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yt.service.impl.UserServiceImpl;

@Controller
@RequestMapping("user")
public class UserController {

	 @Autowired
	 private UserServiceImpl userService;
	 
	 
	 
	
	@RequestMapping("getUser")
	public String getUser(ModelMap model,HttpServletRequest request) {
		HttpSession session = request.getSession();		
		String uid = (String) session.getAttribute("userid");
		model.put("user", userService.getUser(uid));
		return "success";
	}

	@RequestMapping("uploadImg")
	public String uploadImg(HttpServletRequest request) throws Exception {
		String folderPath = "/uploadImg";
//
//		FileItem uploadFileItem = null;
//
//		request.setCharacterEncoding("UTF-8");
//		
//		DiskFileItemFactory diskFactory = new DiskFileItemFactory();
//
//		diskFactory.setSizeThreshold(1024 * 1024 * 1024);
//
//		ServletFileUpload upload = new ServletFileUpload(diskFactory);
//
//		upload.setSizeMax(1024 * 1024 * 1024);
//
//		List<FileItem> fileItems = upload.parseRequest(new ServletRequestContext(request));

		return null;
	}

}
