package com.yt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yt.entity.CategoryCount;
import com.yt.entity.Product;

public interface ProductMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Product record);

	int insertSelective(Product record);

	Product selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Product record);

	int updateByPrimaryKey(Product record);

	List<Product> selectByUserIdWithPics_Pages(@Param("uid") int uid,@Param("page") String page,@Param("limit")String limit);

	int countByUserId(@Param("uid") int uid,@Param("page") String page,@Param("limit")String limit);

	List<Product> selectByMany(@Param("uid") int uid,@Param("name") String name, @Param("category") String category, @Param("start_time") String start_time,@Param("end_time") String end_time,@Param("page") String page,@Param("limit")String limit);
	
	int countByMany(@Param("uid") int uid,@Param("name") String name, @Param("category") String category, @Param("start_time") String start_time,@Param("end_time") String end_time,@Param("page") String page,@Param("limit")String limit);

	//------> --> --> --> --> --> --> --> --> --> 锟斤拷锟斤拷锟斤拷shop页锟斤拷锟�--> --> --> --> --> --> --> --> --> --> --> --> --> --> --> --> --> -->
	
	List<Product> selectbyCategory(@Param("category") String category,@Param("page") String page,@Param("limit") String limit);

	int countbyCategory(@Param("category") String category);

	List<CategoryCount> countCategory();

	List<Product> selectByCondition(@Param("key") String key,@Param("value") String value,@Param("condition") String condition,@Param("price") String price,@Param("page") String page,@Param("limit") String limit);

	int countByCondition(@Param("key") String key,@Param("value") String value);

	List<Product> selectByName(@Param("name") String name,@Param("page") String page,@Param("limit") String limit);

	int countByName(@Param("name") String name);
	
	//------> --> --> --> --> --> --> --> --> --> 锟斤拷锟斤拷锟斤拷shop-single页锟斤拷锟�--> --> --> --> --> --> --> --> --> --> --> --> --> --> --> --> --> -->
	
	List<Product> selectByUserIdWithPics(@Param("uid") int uid);

	/*
	 * 涓荤晫闈� 鏈�杩戞坊鍔�
	 */
	List<Product> selectAllorderByTime();

	int updateQuantityByPrimaryKey(@Param("id")Integer pid,@Param("quantity") String quantity);

	void addLookCount(@Param("id") String id);

	List<Product> selectAll(@Param("page") String page,@Param("limit") String limit);
	
	int countAll();

	int countAllScan();

	List<String> selectAllorderByCount();

}