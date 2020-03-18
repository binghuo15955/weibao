package com.yt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yt.entity.Comment;

public interface CommentMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);

	List<Comment> selectByPid(@Param("pid") String pid,@Param("page") String page,@Param("limit") String limit);

	int countByPid(@Param("pid") String pid);

	List<Comment> selectByPid_CommentUid(@Param("pid") String pid,@Param("comment_uid") int userid,@Param("page") String page,@Param("limit") String limit);

	int countByPid_CommentUid(@Param("pid") String pid,@Param("comment_uid") int userid);

	int updateCountByPK(@Param("cid") String cid,@Param("flag") String flag);

	int countAll();
}