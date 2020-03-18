package com.yt.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yt.entity.Picture;
import com.yt.entity.Product;
import com.yt.mapper.PictureMapper;
import com.yt.mapper.ProductMapper;
import com.yt.util.file;

@Service("mypostService")
public class MypostServiceImpl {

	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private PictureMapper pictureMapper;

	public List<Product> getByUid(int uid, String page, String limit) {
		int page_int = (Integer.parseInt(page) - 1) * Integer.parseInt(limit);
		page = String.valueOf(page_int);
		List<Product> products = productMapper.selectByUserIdWithPics_Pages(uid, page, limit);
		return products;
	}

	public int countByUid(int uid, String page, String limit) {
		return productMapper.countByUserId(uid, page, limit);
	}

	public boolean del_product(String pid1) {
		int pid = Integer.parseInt(pid1);
		int row = productMapper.deleteByPrimaryKey(pid);// 删除对应ID的商品
		if (row > 0) {
			List<Picture> pictures = pictureMapper.selectByPid(pid);
			row = pictureMapper.deleteByPid(pid);// 删除对应商品id的图片数据库数据
			for (int i = 0; i < pictures.size(); i++) {// 循环删除对应商品id的本地图片
				String pathname = pictures.get(i).getPicurl();
				if (file.deleteFile(pathname)) {
					continue;
				} else {
					return false;
				}
			}
			return true;
		} else {
			return false;
		}
	}

	public boolean upt_mypost(Product product, String id, String key, String value) {
		if (id != null && !"".equals(id) && key != null && !"".equals(key) && value != null && !"".equals(value)) {
			product.setId(Integer.parseInt(id));
			switch (key) {
			case "name":
				product.setName(value);
				break;
			case "category":
				product.setCategory(value);
				break;
			case "origin_price":
				product.setOrigin_price(value);
				break;
			case "current_price":
				product.setCurrent_price(value);
				break;
			case "quality":
				product.setQuality(value);
				break;
			case "place":
				product.setPlace(value);
				break;
			case "telephone":
				product.setTelephone(value);
				break;
			case "delivery":
				product.setDelivery(value);
				break;
			case "description":
				product.setDescription(value);
				break;
			default:
				break;
			}
		}
		product.setEdit_time(new Date());
		int row = productMapper.updateByPrimaryKeySelective(product);
		if (row > 0) {
			return true;
		}
		return false;
	}

	public List<Product> getBymany(String uid1, String name, String category, String start_time, String end_time,
			String page, String limit) {
		int uid = Integer.parseInt(uid1);
		int page_int = (Integer.parseInt(page) - 1) * Integer.parseInt(limit);
		page = String.valueOf(page_int);
		return productMapper.selectByMany(uid, name, category, start_time, end_time, page, limit);
	}

	public int countBymany(String uid1, String name, String category, String start_time, String end_time, String page,
			String limit) {
		int uid = Integer.parseInt(uid1);
		return productMapper.countByMany(uid, name, category, start_time, end_time, page, limit);
	}

	public Product getbyid(String id1) {
		int id = Integer.parseInt(id1);
		return productMapper.selectByPrimaryKey(id);
	}

	public List<Picture> getPicsBypid(String pid1) {
		int pid = Integer.parseInt(pid1);
		return pictureMapper.selectByPid(pid);
	}

	public boolean delpicByid(String pictureid, String pathname) {
		try {
			int id = Integer.parseInt(pictureid);
			String path = "";
			path = "C:\\Users\\YT\\eclipse-workspace\\weibao\\src\\main\\webapp";
			path += pathname.split("localhost:8080/weibao")[1];

			boolean flag = file.deleteFile(path);
			if (flag) {
				pictureMapper.deleteByPrimaryKey(id);
				return true;
			}
			return false;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean upt_mypostall(Product product, String province, String city, String area, List<String> pics) {
		String place = province + "-" + city + "-" + area;
		product.setPlace(place);
		int row = productMapper.updateByPrimaryKeySelective(product);
		if (row > 0) {
			if (pics != null && pics.size() > 0 && row > 0) {
				int pid = product.getId();
				System.out.println("pid=" + pid);
				List<Picture> pictures = new ArrayList<Picture>();
				for (String s : pics) {
					Picture picture = new Picture();
					picture.setPicurl(s);
					picture.setPid(pid);
					pictures.add(picture);
				}
				int p_row = pictureMapper.insertMany(pictures);
				if (p_row > 0) {
					return true;
				} else {
					return false;
				}
			}
			return true;
		}
		return false;
	}

}
