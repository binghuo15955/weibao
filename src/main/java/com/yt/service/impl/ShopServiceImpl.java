package com.yt.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yt.entity.CategoryCount;
import com.yt.entity.Product;
import com.yt.mapper.ProductMapper;

@Service("shopService")
public class ShopServiceImpl {
	
	@Autowired
	private ProductMapper productMapper;
	
	public List<Product> selectByCategory(String category,String page, String limit){
		int page1 = Integer.parseInt(page);
		int limit1=Integer.parseInt(limit);
		page = String.valueOf((page1-1)*limit1);
		List<Product> products= productMapper.selectbyCategory(category,page,limit);
		return products;
	}
	
	public int countByCategory(String category){
		return productMapper.countbyCategory(category);		
	}
	
	//根据传入的Map例如，{"category":"男鞋"}or{"name":"万达优惠券"}来确认需要搜索的东西，在mybatis里判断
	public List<Product> selectByCondition(String key,String value,String condition,String price,String page,String limit){
		int page1 = Integer.parseInt(page);
		int limit1=Integer.parseInt(limit);
		page = String.valueOf((page1-1)*limit1);
		return productMapper.selectByCondition(key,value,condition,price,page,limit);
	}
	
	public int countByCondition(String key,String value){
		return productMapper.countByCondition(key,value);
	}
	
	public List<CategoryCount> countCategory(){
		return productMapper.countCategory();
	}

	public List<Product> selectByName(String search, String page, String limit) {
		int page1 = Integer.parseInt(page);
		int limit1=Integer.parseInt(limit);
		page = String.valueOf((page1-1)*limit1);
		return productMapper.selectByName(search,page,limit);
	}

	public int countByName(String name) {
		return productMapper.countByName(name);
	}
	
}
