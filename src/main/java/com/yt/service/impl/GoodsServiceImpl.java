package com.yt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yt.entity.Product;
import com.yt.mapper.ProductMapper;

@Service("goodsService")
public class GoodsServiceImpl {
	
	@Autowired
	private ProductMapper productMapper;
	
	public List<Product> selectByUid(String uid1,String id){
		int uid=Integer.parseInt(uid1);
		productMapper.addLookCount(id);
		return productMapper.selectByUserIdWithPics(uid);
	}
}
