package com.yt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yt.entity.Picture;
import com.yt.entity.Product;
import com.yt.service.impl.MypostServiceImpl;
import com.yt.util.renderData;

@Controller
@RequestMapping("mypost")
public class MypostController {
	
	@Autowired
	private MypostServiceImpl mypostService;
	
	@RequestMapping("delImgbyid")
	@ResponseBody
	public String delImgbyid(String id,String pathname) {
		boolean flag = mypostService.delpicByid(id,pathname);
		if(flag) {
			return "success";
		}
		return "failed";
	}
	
	@RequestMapping("getbyid")
	public void getbyid(String id,ModelMap model) {
		Product product = mypostService.getbyid(id);
		List<Picture> pictures=mypostService.getPicsBypid(id);
		model.put("data", product);
		model.put("pictures", pictures);
	}
	
	@RequestMapping("getbymany")
	public void get_MypostBymany(String name,String category,String start_time,String end_time,String page,String limit,HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		HttpSession session = request.getSession();
		String uid =String.valueOf( (int) session.getAttribute("userid"));
		List<Product> products = mypostService.getBymany(uid,name,category,start_time,end_time,page,limit);
		int count = mypostService.countBymany(uid, name, category, start_time, end_time, page, limit);
		model.put("data", products);
		model.put("status", 0);
		model.put("msg","" );
		model.put("count", count);
		renderData.render_Data(response, model);
	}
	
	@RequestMapping("edit")
	@ResponseBody
	public String upt_mypost(Product product,String id,String key ,String value) {
		boolean flag = mypostService.upt_mypost(product,id,key,value);
		if(flag) {
			return "success";
		}
		return "failed";
	}
	
	@RequestMapping("editall")
	@ResponseBody
	public String upt_mypostAll(Product product,String province,String city,String area,HttpServletRequest request) {
		List<String> pics=new ArrayList<String>();
		for(int i=0;i<9;i++) {
			if(request.getParameter("pic"+i)!=null) {
				String url = request.getParameter("pic"+i);
				pics.add(url);
			}
		}
		boolean flag = mypostService.upt_mypostall(product,province,city,area,pics);
		if(flag) {
			return "success";
		}
		return "failed";
	}
	
	@RequestMapping("del")
	@ResponseBody
	public String del_mypost(String id) {
		boolean flag = mypostService.del_product(id);
		if(flag) {
			return "success";
		}
		return "failed";
	}
	
	@RequestMapping("getbyuid")
	public void getbyuid(HttpServletRequest request,HttpServletResponse response,ModelMap model,String page,String limit) {
		HttpSession session = request.getSession();
		int uid = (int) session.getAttribute("userid");
		List<Product> products = mypostService.getByUid(uid,page,limit);
		int count = mypostService.countByUid(uid,page,limit);
		model.put("data", products);
		model.put("status", 0);
		model.put("msg","" );
		model.put("count", count);
		renderData.render_Data(response, model);
	}

}
