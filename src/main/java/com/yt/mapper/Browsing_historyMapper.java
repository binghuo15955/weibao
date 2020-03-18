package com.yt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yt.entity.Browsing_history;

public interface Browsing_historyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Browsing_history record);

    int insertSelective(Browsing_history record);

    Browsing_history selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Browsing_history record);

    int updateByPrimaryKey(Browsing_history record);
    
    List<Browsing_history> selectByUid(@Param("uid") String uid,@Param("page") String page,@Param("limit") String limit);

    int countByUid(@Param("uid") String uid);

    List<Browsing_history> selectByMany(@Param("name") String name,@Param("start_time") String start_time,@Param("end_time") String end_time,@Param("page") String page,@Param("limit") String limit);

    int countByMany(@Param("name") String name,@Param("start_time") String start_time,@Param("end_time") String end_time);
}