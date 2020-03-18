package com.yt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yt.entity.Address;
import com.yt.entity.Browsing_history;

public interface AddressMapper {
    int deleteByPrimaryKey(Integer aid);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(Integer aid);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);

	List<Address> selectAllByUid(@Param("uid") int uid);

	int set_default(@Param("aid") int aid);

	int cancel_alldefault(@Param("uid") int uid);

	Address get_default(@Param("uid") int uid);
}