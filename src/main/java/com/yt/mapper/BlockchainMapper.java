package com.yt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yt.entity.Blockchain;
import com.yt.entity.Order;

public interface BlockchainMapper {
    int deleteByPrimaryKey(String oid);

    int insert(Blockchain record);

    int insertSelective(Blockchain record);

    Blockchain selectByPrimaryKey(String oid);

    int updateByPrimaryKeySelective(Blockchain record);

    int updateByPrimaryKey(Blockchain record);
    
    List<Blockchain> selectAll();
    
    int countAll();

    List<Order> selectByMany(@Param("p_name") String p_name,@Param("oid") String oid,@Param("start_time") String start_time,@Param("end_time") String end_time,@Param("status") String status,@Param("seller_name") String seller_name,@Param("page") String page,@Param("limit") String limit);

	int countByMany(@Param("p_name") String p_name,@Param("oid") String oid,@Param("start_time") String start_time,@Param("end_time") String end_time,@Param("status") String status,@Param("seller_name") String seller_name);

	List<Order> selectAlluesPage(@Param("page") String page,@Param("limit") String limit);
}