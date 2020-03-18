package com.yt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yt.service.impl.AccountServiceImpl;
import com.yt.service.impl.CommentServiceImpl;
import com.yt.service.impl.OrderServiceImpl;
import com.yt.service.impl.ProductServiceImpl;
import com.yt.util.renderData;

@Controller
@RequestMapping("manage")
public class ManageController {
	
	@Autowired
	private ProductServiceImpl productService;
	@Autowired
	private AccountServiceImpl accountService;
	@Autowired
	private CommentServiceImpl commentService;
	@Autowired
	private OrderServiceImpl orderService;
	
	@RequestMapping("getallcount")
	@ResponseBody
	public void getallcount(HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		model.put("product", productService.countAll());//获取商品总数
		model.put("user", accountService.countAll());//获取用户总数
		model.put("comment", commentService.countAll());//获取评论总数
		model.put("scan", productService.countAllScan());//获取浏览量总数
		model.put("order", orderService.countAll());//获取订单总数
		
	//	SELECT category,count(category) FROM weibao.order WHERE YEARWEEK(DATE_FORMAT(time,'%Y-%m-%d')) = YEARWEEK(NOW()) group by category asc;
		model.put("category", orderService.getAllorderByCategory());//获取订单分类排行（周）
		model.put("seller_name", orderService.getAllorderBySeller_name());//获取卖最多的用户
		model.put("scan_count", productService.getAllorderByCount());//获取商品浏览排行
		model.put("buyer_name", orderService.getAllorderByBuyer_name());//获取买最多的用户
		renderData.render_Data(response, model);
	}

}
