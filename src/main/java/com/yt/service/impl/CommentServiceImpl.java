package com.yt.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yt.entity.Comment;
import com.yt.mapper.CommentMapper;

@Service("commentService")
public class CommentServiceImpl {
	
	@Autowired
	private CommentMapper commentMapper;
	
	public boolean add_Comment(Comment comment) {
		LocalDateTime time = LocalDateTime.now();
		comment.setTime(time);
		comment.setCount("0");
		int row = commentMapper.insertSelective(comment);
		if(row>0) {
			return true;
		}
		return false;
	}
	
	public List<Comment> selectBypid(String pid,String page1,String limit){
		int page2 = (Integer.parseInt(page1)-1)*Integer.parseInt(limit);
		String page = String.valueOf(page2);
		List<Comment> comments = commentMapper.selectByPid(pid,page,limit);
		return comments;
	}
	
	public int countByPid(String pid) {
		return commentMapper.countByPid(pid);
	}
	
	public boolean del_comment(String cid1) {
		int cid=Integer.parseInt(cid1);
		int row = commentMapper.deleteByPrimaryKey(cid);
		if(row>0) {
			return true;
		}
		return false;
	}

	public List<Comment> selectBypid_userid(String pid, int userid, String page1, String limit) {
		int page2 = (Integer.parseInt(page1)-1)*Integer.parseInt(limit);
		String page = String.valueOf(page2);
		return commentMapper.selectByPid_CommentUid(pid,userid, page, limit);
	}

	public int countBypid_userid(String pid, int userid) {
		return commentMapper.countByPid_CommentUid(pid,userid);
	}

	public boolean set_good(String cid, String flag) {
		int row = commentMapper.updateCountByPK(cid,flag);
		if(row>0) {
			return true;
		}
		return false;
	}

	public int countAll() {
		return commentMapper.countAll();
	}
	
	
	

}
