package com.yt.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yt.entity.Picture;
import com.yt.entity.Product;
import com.yt.mapper.PictureMapper;
import com.yt.mapper.ProductMapper;

@Service("productService")
public class ProductServiceImpl {
	
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private PictureMapper pictureMapper;

	public boolean add(Product product, String province, String city, String area,int uid, String u_name, String u_sex, String u_credit,List<String> pics) {
		String place=province+"-"+city+"-"+area;
		product.setPlace(place);
		product.setUid(uid);
		product.setU_name(u_name);
		product.setU_sex(u_sex);
		product.setU_credit(u_credit);
		product.setEdit_time(new Date());
		product.setCount("0");
		int row = productMapper.insert(product);
		int p_row=0;
		if(pics!=null&&pics.size()>0&&row>0) {
			int pid =product.getId();
			System.out.println("pid="+pid);
			List<Picture> pictures=new ArrayList<Picture>();
			for (String s : pics) {
				Picture picture=new Picture();
				picture.setPicurl(s);
				picture.setPid(pid);
				pictures.add(picture);
			}
			p_row=pictureMapper.insertMany(pictures);
			if(p_row>0) {
				return true;
			}else {
				return false;
			}
		}
		if(row>0) {
			return true;
		}else {
			return false;
		}
	}

	public List<Product> getLatestProducts() {
		return productMapper.selectAllorderByTime();
	}

	public List<Product> getAll(String page, String limit) {
		int page1=(Integer.parseInt(page)-1)*Integer.parseInt(limit);
		String page2=String.valueOf(page1);
		return productMapper.selectAll(page2,limit);
	}

	public int countAll() {
		return productMapper.countAll();
	}

	public int countAllScan() {
		return productMapper.countAllScan();
	}

	public List<String> getAllorderByCount() {
		return productMapper.selectAllorderByCount();
	}	

}
