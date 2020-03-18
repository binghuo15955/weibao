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

import com.yt.entity.Product;
import com.yt.service.impl.CollectServiceImpl;
import com.yt.service.impl.GoodsServiceImpl;
import com.yt.service.impl.HistoryServiceImpl;
import com.yt.util.renderData;

@Controller
@RequestMapping("goods")
public class GoodsController {
	
	@Autowired
	private GoodsServiceImpl goodsService;
	@Autowired
	private HistoryServiceImpl historyService;
	@Autowired
	private CollectServiceImpl collectService;
	
	@RequestMapping("getbyuid")
	@ResponseBody
	public void getProductByid(String id,String uid,ModelMap model,HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		if(session.getAttribute("userid")!=null) {
			int userid = (int) session.getAttribute("userid");
			boolean flag = collectService.getByUid_Pid(userid,id);
			model.put("isLove", flag);
		}
		int id1=Integer.parseInt(id);
		//拿到这个发布人发布的所有商品
		List<Product> products = goodsService.selectByUid(uid,id);
		
		for (int i = 0; i < products.size(); i++) {//找寻到对应pid的商品信息
			if(id1==products.get(i).getId()) {
				Product product = products.get(i);
				model.put("product", product);
				products.remove(i);

				if(session.getAttribute("userid")!=null) {
					int userid = (int) session.getAttribute("userid");
					historyService.add(userid,id,product.getName(),product.getCurrent_price(),product.getPictureSet(),uid);
				}
				break;
			}
		}
		model.put("username", username);
		model.put("products", products);
		renderData.render_Data(response, model);
	}
	
}
