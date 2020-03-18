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

import com.yt.entity.Collect;
import com.yt.service.impl.CollectServiceImpl;
import com.yt.util.renderData;

@Controller
@RequestMapping("collect")
public class CollectController {

	@Autowired
	private CollectServiceImpl collectService;
	
	
	@RequestMapping("delbyid")
	@ResponseBody
	public String del(String cid) {
		boolean flag = collectService.delbyid(cid);
		if(flag) {
			return "success";
		}
		return "failed";
	}
	
	
	@RequestMapping("del")
	@ResponseBody
	public String del(String pid,HttpServletRequest request) {
		HttpSession session = request.getSession();
		int uid1 = (int) session.getAttribute("userid");
		String uid = String.valueOf(uid1);
		boolean flag = collectService.del(uid, pid);
		if(flag) {
			return "success";
		}
		return "failed";
	}
	
	@RequestMapping("add")
	@ResponseBody
	public String add(String pid,HttpServletRequest request) {
		HttpSession session = request.getSession();
		int uid1 = (int) session.getAttribute("userid");
		String uid = String.valueOf(uid1);
		boolean flag = collectService.add(uid, pid);
		if(flag) {
			return "success";
		}
		return "failed";
	}
	
	@RequestMapping("getByUid")
	@ResponseBody
	public void getbyuid(String page,String limit,HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		try {
			HttpSession session = request.getSession();
			int uid1 = (int) session.getAttribute("userid");
			String uid = String.valueOf(uid1);
			List<Collect> collects= collectService.getByUid(uid, page, limit);
			int pages=collectService.countByUid(uid);
			model.put("collects", collects);
			model.put("pages", pages/Integer.parseInt(limit)+1);
			renderData.render_Data(response, model);
		} catch (Exception e) {
			model.put("collects", null);
			model.put("pages", 0);
			renderData.render_Data(response, model);
		}
		
	}
}
