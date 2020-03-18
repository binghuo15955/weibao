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

import com.yt.entity.Browsing_history;
import com.yt.service.impl.HistoryServiceImpl;
import com.yt.util.renderData;

@Controller
@RequestMapping("history")
public class HistoryController {

	@Autowired
	private HistoryServiceImpl historyService;
	
	@RequestMapping("getByUid")
	@ResponseBody
	public void getbyuid(String page,String limit,HttpServletRequest request,HttpServletResponse response,ModelMap model) {
		try {
			HttpSession session = request.getSession();
			int uid1 = (int) session.getAttribute("userid");
			String uid = String.valueOf(uid1);
			List<Browsing_history> histories= historyService.getByUid(uid, page, limit);
			int pages=historyService.countByUid(uid);
			model.put("histories", histories);
			model.put("pages", pages/Integer.parseInt(limit)+1);
			renderData.render_Data(response, model);
		} catch (Exception e) {
			model.put("histories", null);
			model.put("pages", 0);
			renderData.render_Data(response, model);
		}
		
	}
}
