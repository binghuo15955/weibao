package com.yt.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.yt.entity.Order;

public interface OrderMapper {
    int deleteByPrimaryKey(String oid);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(String oid);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

	List<Order> selectByBuyer_id(@Param("buyer_id") int buyer_id,@Param("page") String page,@Param("limit") String limit);

	int countByBuyer_id(@Param("buyer_id")int buyer_id);

	List<Order> selectByMany(@Param("p_name") String p_name,@Param("oid") String oid,@Param("start_time") String start_time,@Param("end_time") String end_time,@Param("status") String status,@Param("seller_name") String seller_name,@Param("buyer_id") int buyer_id, @Param("page") String page,@Param("limit") String limit);

	int countByMany(@Param("p_name") String p_name,@Param("oid") String oid,@Param("start_time") String start_time,@Param("end_time") String end_time,@Param("status") String status,@Param("seller_name") String seller_name,@Param("buyer_id") int buyer_id);

	List<Order> selectAll(@Param("page") String page,@Param("limit") String limit);

	int countAll();

	List<String> selectAllorderByCategory();

	List<String> selectAllorderByBuyer_name();

	List<String> selectAllorderBySeller_name();
}