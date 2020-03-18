package com.yt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yt.entity.Collect;

public interface CollectMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Collect record);

    int insertSelective(Collect record);

    Collect selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Collect record);

    int updateByPrimaryKey(Collect record);
    
    int insertDistrict(Collect record);

	int deleteByUid_Pid(@Param("uid") String uid,@Param("pid") String pid);

	List<Collect> selectByUid(@Param("uid") String uid,@Param("page") String page,@Param("limit") String limit);

	int countByUid(@Param("uid") String uid);

	Collect selectByUid_Pid(@Param("uid") int uid,@Param("pid") String pid);
}