package com.yt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yt.entity.Picture;

public interface PictureMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Picture record);

    int insertSelective(Picture record);

    Picture selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Picture record);

    int updateByPrimaryKey(Picture record);

	int insertMany(@Param("list") List<Picture> pictures);

	List<Picture> selectByPid(@Param("pid") int pid);
	/**
	 * 鏍规嵁鍟嗗搧ID锛圥ID锛夊垹闄ゅ浘鐗囷紝鐢ㄤ簬鍟嗗搧鍒犻櫎鐨勭骇鑱斿垹闄�
	 * @param pid
	 * @return
	 */
	int deleteByPid(@Param("pid") int pid);

	List<String> selectAllurl();
}