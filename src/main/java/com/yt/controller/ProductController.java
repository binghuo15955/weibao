package com.yt.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.util.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yt.entity.Product;
import com.yt.service.impl.ProductServiceImpl;
import com.yt.util.file;
import com.yt.util.renderData;

@Controller
@RequestMapping("product")
public class ProductController {

	@Autowired
	private ProductServiceImpl ProductService;

	//----以下是管理员界面
	
	@RequestMapping("getAll")
	@ResponseBody
	public void getAll(String page,String limit,HttpServletResponse response,ModelMap model) {
		List<Product> products = ProductService.getAll(page,limit);
		int count =ProductService.countAll();
		model.put("data", products);
		model.put("msg", "");
		model.put("status", 0);
		model.put("count",count);
		renderData.render_Data(response, model);
	}
	
	
	//----以下是客户界面
	
	@RequestMapping("getLatestProducts")
	@ResponseBody
	public void getLatestProducts(HttpServletResponse response,ModelMap model) {
		List<Product> products = ProductService.getLatestProducts();
		model.put("products", products);
		renderData.render_Data(response, model);
	}
	
	@RequestMapping("delImg")
	@ResponseBody
	public String delImg(String picurl) {
		boolean flag= file.deleteFile(picurl);
		if(flag) {
			return "success";
		}
		return "failed";
	}

	
	@RequestMapping("uploadImg")
	@ResponseBody
	public void uploadImg(@RequestParam MultipartFile file, ModelMap model,HttpServletResponse response) {
		try {
			if (!file.isEmpty()) {
				String originalFilename = file.getOriginalFilename();
				long size = file.getSize();
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");
				int lastIndexOf = originalFilename.lastIndexOf(".");
				String substring = originalFilename.substring(lastIndexOf);
				String filenames = "C:\\Users\\YT\\eclipse-workspace\\weibao\\src\\main\\webapp\\uploadImg\\"
						 + uuid + substring;
				File files = new File(filenames);
				FileOutputStream fos = new FileOutputStream(filenames);
				IOUtils.copy(file.getInputStream(), fos);
				model.put("code", 200);
				model.put("msg", "success");
				model.put("url", filenames);
				model.put("filename", originalFilename);
			} else {
				model.put("msg", "No File");
				model.put("code", 0);
			}
		} catch (Exception e) {
			model.put("msg", "error");
			model.put("code", 0);
			e.printStackTrace();
		}finally {
			renderData.render_Data(response, model);
		}
	}

	@RequestMapping("post")
	@ResponseBody
	public String post(Product product, String province, String city, String area,HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<String> pics=new ArrayList<String>();
		int uid = (int) session.getAttribute("userid");
		String u_name = (String) session.getAttribute("name");
		String u_sex = (String) session.getAttribute("sex");
		String u_credit = (String) session.getAttribute("credit");
		
		for(int i=0;i<9;i++) {
			if(request.getParameter("pic"+i)!=null) {
				String url = request.getParameter("pic"+i);
				pics.add(url);
			}
		}
		boolean flag1=ProductService.add(product, province, city, area, uid, u_name, u_sex, u_credit,pics);
		if (flag1==true) {
			return "success";
		}
		return "failed";
	}

}
