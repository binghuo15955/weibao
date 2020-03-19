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
		model.put("product", productService.countAll());//��ȡ��Ʒ����
		model.put("user", accountService.countAll());//��ȡ�û�����
		model.put("comment", commentService.countAll());//��ȡ��������
		model.put("scan", productService.countAllScan());//��ȡ���������
		model.put("order", orderService.countAll());//��ȡ��������
		
	//	SELECT category,count(category) FROM weibao.order WHERE YEARWEEK(DATE_FORMAT(time,'%Y-%m-%d')) = YEARWEEK(NOW()) group by category asc;
		model.put("category", orderService.getAllorderByCategory());//��ȡ�����������У��ܣ�
		model.put("seller_name", orderService.getAllorderBySeller_name());//��ȡ�������û�
		model.put("scan_count", productService.getAllorderByCount());//��ȡ��Ʒ�������
		model.put("buyer_name", orderService.getAllorderByBuyer_name());//��ȡ�������û�
		renderData.render_Data(response, model);
	}

}
