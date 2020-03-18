package com.yt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yt.entity.Comment;
import com.yt.service.impl.CommentServiceImpl;
import com.yt.util.renderData;

@Controller
@RequestMapping("comment")
public class CommentController {

	@Autowired
	private CommentServiceImpl commentService;
	
	@RequestMapping("set_good")
	@ResponseBody
	public String set_good(String cid,String flag) {
		boolean flag1 = commentService.set_good(cid,flag);
		if(flag1) {
			return "success";
		}
		return "failed";
	}
	
	@RequestMapping("del")
	@ResponseBody
	public String del_comment(String cid) {
		boolean flag = commentService.del_comment(cid);
		if(flag) {
			return "success";
		}
		return "failed";
	}
	
	@RequestMapping("getbypidanduserid")
	@ResponseBody
	public void getbypidanduserid(String pid,String page,String limit,HttpServletRequest request ,HttpServletResponse response,ModelMap model) {
		HttpSession session = request.getSession();
		int userid = (int) session.getAttribute("userid");
		List<Comment> comments = commentService.selectBypid_userid(pid,userid,page,limit);
		int pages = commentService.countBypid_userid(pid,userid);
		model.put("comments", comments);
		model.put("pages", pages/Integer.parseInt(limit));
		renderData.render_Data(response, model);
	}
	
	@RequestMapping("getbypid")
	@ResponseBody
	public void getbypid(String pid,String page,String limit,HttpServletResponse response,ModelMap model) {
		List<Comment> comments = commentService.selectBypid(pid,page,limit);
		int pages = commentService.countByPid(pid);
		model.put("comments", comments);
		model.put("pages", pages/Integer.parseInt(limit));
		renderData.render_Data(response, model);
	}
	
	@RequestMapping("add")
	@ResponseBody
	public String add_comment(Comment comment,HttpServletRequest request) {
		HttpSession session = request.getSession();
		int comment_uid = (int) session.getAttribute("userid");
		String comment_name = (String) session.getAttribute("name");
		comment.setComment_uid(comment_uid);
		comment.setComment_name(comment_name);
		boolean flag = commentService.add_Comment(comment);
		if(flag) {
			return "success";
		}
		return "failed";
	}
}
