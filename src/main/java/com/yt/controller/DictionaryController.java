package com.yt.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yt.entity.Address;
import com.yt.entity.Dictionary;
import com.yt.service.impl.DictionaryServiceImpl;
import com.yt.util.renderData;

@Controller
@RequestMapping("dictionary")
public class DictionaryController {

	@Autowired
	private DictionaryServiceImpl dictionaryService;

	@RequestMapping("switch_item")
	@ResponseBody
	public String switch_item(String value,String type,HttpServletResponse response) {
		return dictionaryService.switch_item(value,type);
	}
	
	@RequestMapping("edit_one")
	@ResponseBody
	public String edit_one(Dictionary dictionary,String id,String key,String value) {
		boolean flag= dictionaryService.edit_one(dictionary,id,key,value);
		if(flag) {
			return "success";
		}else {
			return "failed";
		}
	}
	
	@RequestMapping("add")
	@ResponseBody
	public String add(Dictionary dictionary) {
		boolean flag = dictionaryService.add(dictionary);
		if (flag) {
			return "success";
		}
		return "failed";
	}
	
	@RequestMapping("del")
	@ResponseBody
	public String del(String id) {
		boolean flag = dictionaryService.del(id);
		if (flag) {
			return "success";
		}
		return "failed";
	}

	@RequestMapping("getbymany")
	@ResponseBody
	public void getbymany(String classification, String item, String value, String editable, String page, String limit,
			HttpServletResponse response, ModelMap model) {
		if(classification.equals("init")) {
			List<Dictionary> product_classification = dictionaryService.getByMany("商品分类", item, value, editable, page,
					limit);
			List<Dictionary> skill_classification = dictionaryService.getByMany("技能服务", item, value, editable, page,
					limit);
			model.put("product_classification", product_classification);
			model.put("skill_classification", skill_classification);
			renderData.render_Data(response, model);
		}
		List<Dictionary> dictionaries = dictionaryService.getByMany(classification, item, value, editable, page,
				limit);
		int count = dictionaryService.countByMany(classification, item, value, editable);
		model.put("data", dictionaries);
		model.put("count", count);
		model.put("status", "0");
		model.put("message", "");
		renderData.render_Data(response, model);
	}

	@RequestMapping("getall")
	@ResponseBody
	public void getall(String page, String limit, HttpServletResponse response, ModelMap model) {
		List<Dictionary> dictionaries = dictionaryService.getall(page, limit);
		int count = dictionaryService.countall();
		model.put("data", dictionaries);
		model.put("count", count);
		model.put("status", "0");
		model.put("message", "");
		renderData.render_Data(response, model);
	}

}
