package com.yt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yt.entity.Address;
import com.yt.service.impl.AddressServiceImpl;
import com.yt.util.renderData;

@Controller
@RequestMapping("address")
public class AddressController {

	@Autowired
	private AddressServiceImpl addressService;
	
	@RequestMapping("get_default")
	@ResponseBody
	public void get_default(HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		HttpSession session = request.getSession();
		int uid=(int) session.getAttribute("userid");
		Address address= addressService.get_default(uid);
		if(address!=null) {
			model.put("address", address);
			model.put("status", "success");
		}else {
			model.put("address", address);
			model.put("status", "failed");
		}
		renderData.render_Data(response, model);
	}
	
	@RequestMapping("set_default")
	@ResponseBody
	public String set_default(String aid,HttpServletRequest request) {
		HttpSession session = request.getSession();
		int uid=(int) session.getAttribute("userid");
		boolean flag = addressService.set_default(aid,uid);
		if(flag) {
			return "success";
		}
		return "failed";
	}
	
	@RequestMapping("del")
	@ResponseBody
	public String del_address(String aid) {
		boolean flag= addressService.del_address(aid);
		if(flag) {
			return "success";
		}else {
			return "failed";
		}
	}
	
	@RequestMapping("update")
	@ResponseBody
	public String upt_address(Address address,String id,String key,String value) {
		boolean flag= addressService.upt_address(address,id,key,value);
		if(flag) {
			return "success";
		}else {
			return "failed";
		}
	}
	
	@RequestMapping("getbyid")
	@ResponseBody
	public void getByid(String aid,ModelMap model,HttpServletResponse response) {
		Address address = addressService.getByaid(aid);
		model.put("data", address);
		renderData.render_Data(response, model);
	}
	
	@RequestMapping("getall")
	@ResponseBody
	public void selectAllByUid(ModelMap model,HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		int uid = (int) session.getAttribute("userid");
		List<Address> addresses = addressService.selectAllByUid(uid);
		model.put("status", 0);
		model.put("data", addresses);
		model.put("message", "");
		renderData.render_Data(response, model);
	}
	
	@RequestMapping("add")
	@ResponseBody
	public String add_address(Address address,String province,String city,String area,HttpServletRequest request) {
		HttpSession session = request.getSession();
		int uid = (int) session.getAttribute("userid");
		boolean flag = addressService.add_address(address,province,city,area,uid);
		if(flag) {
			return "success";
		}else {
			return "false";
		}
	}
	
}
