package com.yt.controller;

import java.util.List;
import java.util.UUID;

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
import com.yt.service.impl.DictionaryServiceImpl;
import com.yt.service.impl.OrderServiceImpl;
import com.yt.util.renderData;

@Controller
@RequestMapping("order")
public class OrderController {

	@Autowired
	private OrderServiceImpl orderService;
	@Autowired
	private DictionaryServiceImpl dictionaryService;
	
	//----管理员界面----
	
	@RequestMapping("getAll")
	@ResponseBody
	public void getAll(String page,String limit,HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		HttpSession session = request.getSession();
		List<Order> orders = orderService.getAll(page,limit);
		int count =orderService.countAll();
		List<Dictionary> dictionaries = dictionaryService.getByclassification("订单状态");

		session.setAttribute("dictionaries", dictionaries);
		model.put("data",orders);
		model.put("status", "0");
		model.put("msg", "");
		model.put("count", count);
		renderData.render_Data(response, model);
	}
	
	
	//----用户界面----
	
	@RequestMapping("getbyoid")
	@ResponseBody
	public void getbyoid(String oid,HttpServletResponse response,ModelMap model) {
		Order order = orderService.getByOid(oid);
		model.put("data", order);
		renderData.render_Data(response, model);
	}

	@RequestMapping("getbymany")
	@ResponseBody
	public void getbypname_oid(String p_name,String oid,String start_time,String end_time,String status,String seller_name,String page,String limit,HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		HttpSession session = request.getSession();
		int seller_id=(int) session.getAttribute("userid");	
		List<Order> orders = orderService.getByMany(p_name, oid,start_time,end_time,status,seller_name,seller_id,page,limit);
		int count = orderService.countByMany(p_name, oid,start_time,end_time,status,seller_name,seller_id);
		model.put("data",orders);
		model.put("status", "0");
		model.put("msg", "");
		model.put("count", count);
		renderData.render_Data(response, model);
	}
	
	@RequestMapping("del")
	@ResponseBody
	public String del_order(String oid) {
		boolean flag = orderService.delByoid(oid);
		if(flag) {
			return "success";
		}
		return "failed";
	}
	
	@RequestMapping("getRecordByBuyerid")
	@ResponseBody
	public void getRecordByBuyerid(String page,String limit,HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		HttpSession session = request.getSession();
		int buyer_id = (int) session.getAttribute("userid");
		List<Order> orders = orderService.selectByBuyer_id(buyer_id,page,limit);
		int count=orderService.countByBuyer_id(buyer_id);
		model.put("data", orders);
		model.put("status", "0");
		model.put("msg", "");
		model.put("count", count);
		renderData.render_Data(response, model);
	}
	
	@RequestMapping("setStatus")
	@ResponseBody
	public String setStatus(String oid) {
		boolean flag = orderService.setStatus2three(oid);
		if(flag) {
			return "success";
		}
		return "failed";
	}
	
	@RequestMapping("add")
	@ResponseBody
	public void add_order(Order order,HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		HttpSession session = request.getSession();
		int buyer_id=(int) session.getAttribute("userid");
		String buyer_name=(String) session.getAttribute("name");
		String oid = UUID.randomUUID().toString().replace("-", "");
		order.setBuyer_id(buyer_id);
		order.setBuyer_name(buyer_name);
		order.setOid(oid);
		boolean flag = orderService.insertSelective(order);
		if(flag) {
			model.put("status", "success");
			model.put("oid", oid);
		}else {
			model.put("status", "failed");
		}
		renderData.render_Data(response, model);
		
	}
}
