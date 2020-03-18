package com.yt.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yt.entity.CategoryCount;
import com.yt.entity.Product;
import com.yt.service.impl.ShopServiceImpl;
import com.yt.util.renderData;

@Controller
@RequestMapping("shop")
public class ShopController {

	@Autowired
	private ShopServiceImpl shopService;

	@RequestMapping("getbyName")
	@ResponseBody
	public void SelectByName(String name, String page, String limit, ModelMap model, HttpServletResponse response,
			HttpServletRequest request) {
		String decodeStr;
		try {
			decodeStr = URLDecoder.decode(name, "utf-8");
			List<Product> products = shopService.selectByName(decodeStr, page, limit);
			int count = shopService.countByName(decodeStr);
			model.put("products", products);
			model.put("count", count/12+1);
			model.put("name", decodeStr);
			renderData.render_Data(response, model);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping("getbyCategory")
	@ResponseBody
	public void selectByCategory(String category, String page, String limit, ModelMap model,
			HttpServletResponse response, HttpServletRequest request) {
		try {
			String decodeStr = URLDecoder.decode(category, "utf-8");
			List<Product> products = shopService.selectByCategory(decodeStr, page, limit);
			int count = shopService.countByCategory(decodeStr);
			model.put("products", products);
			model.put("count", count/12+1);
			renderData.render_Data(response, model);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping("getbyCondition")
	@ResponseBody
	public void selectByCondition(String key, String value, String condition, String price, String page, String limit,
			ModelMap model, HttpServletResponse response) throws UnsupportedEncodingException {
		value = URLDecoder.decode(value, "utf-8");
		List<Product> products = shopService.selectByCondition(key,value, condition, price, page, limit);
		int count = shopService.countByCondition(key,value);
		model.put("products", products);
		model.put("count", count/12+1);
		if("name".equals(key)) {			
			model.put("name", value);
		}
		renderData.render_Data(response, model);
	}

	@RequestMapping("countCategory")
	@ResponseBody
	public void countCategory(ModelMap model,HttpServletResponse response) {
		List<CategoryCount> categoryCounts = shopService.countCategory();
		model.put("categoryCounts", categoryCounts);
		renderData.render_Data(response, model);
	}

}
