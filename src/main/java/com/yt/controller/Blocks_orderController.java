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

import com.yt.entity.Dictionary;
import com.yt.entity.Order;
import com.yt.service.impl.Blocks_orderServiceImpl;
import com.yt.service.impl.DictionaryServiceImpl;
import com.yt.util.renderData;

@Controller
@RequestMapping("blocks_order")
public class Blocks_orderController {

	@Autowired
	private Blocks_orderServiceImpl blocks_orderService;
	@Autowired
	private DictionaryServiceImpl dictionaryService;
	
	@RequestMapping("getall")
	@ResponseBody
	public void getAll(String page,String limit,HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		HttpSession session = request.getSession();
		List<Order> orders = blocks_orderService.getAll(page,limit);
		int count =blocks_orderService.countAll();
		List<Dictionary> dictionaries = dictionaryService.getByclassification("¶©µ¥×´Ì¬");

		session.setAttribute("dictionaries", dictionaries);
		model.put("data",orders);
		model.put("status", "0");
		model.put("msg", "");
		model.put("count", count);
		renderData.render_Data(response, model);
	}
	
	@RequestMapping("getbymany")
	@ResponseBody
	public void getbymany(String p_name,String oid,String start_time,String end_time,String status,String seller_name,String page,String limit,HttpServletResponse response,ModelMap model) {
		List<Order> orders = blocks_orderService.getByMany(p_name, oid,start_time,end_time,status,seller_name,page,limit);
		int count = blocks_orderService.countByMany(p_name, oid,start_time,end_time,status,seller_name);
		model.put("data",orders);
		model.put("status", "0");
		model.put("msg", "");
		model.put("count", count);
		renderData.render_Data(response, model);
	}
}
