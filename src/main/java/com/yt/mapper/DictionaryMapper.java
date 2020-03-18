package com.yt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yt.entity.Dictionary;

public interface DictionaryMapper {
	int deleteByPrimaryKey(Integer id);

    int insert(Dictionary record);

    int insertSelective(Dictionary record);

    Dictionary selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dictionary record);

    int updateByPrimaryKey(Dictionary record);

	List<Dictionary> selectAll(@Param("page") String page,@Param("limit") String limit);

	List<Dictionary> selectByMany(@Param("classification") String classification,@Param("item")  String item,@Param("value")  String value, @Param("editable") String editable,@Param("page") String page,@Param("limit") String limit);

	int countAll();

	int countByMany(@Param("classification") String classification,@Param("item")  String item,@Param("value")  String value, @Param("editable") String editable);

	String switch_item(@Param("value") String value,@Param("classification") String classification);

	List<Dictionary> selectByClassification(@Param("classification") String classification);
}