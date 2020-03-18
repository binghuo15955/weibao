package com.yt.service.impl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yt.entity.Browsing_history;
import com.yt.entity.Picture;
import com.yt.mapper.Browsing_historyMapper;

@Service("historyService")
public class HistoryServiceImpl {
	
	@Autowired
	private Browsing_historyMapper historyMapper;
	
	
	public List<Browsing_history> getByUid(String uid,String page1,String limit){
		String page = String.valueOf((Integer.parseInt(page1)-1)*Integer.parseInt(limit));
		return historyMapper.selectByUid(uid,page,limit);
	}
	
	public int countByUid(String uid){
		return historyMapper.countByUid(uid);
	}
	
	public List<Browsing_history> getByMany(String name,String start_time,String end_time,String page1,String limit){
		String page = String.valueOf((Integer.parseInt(page1)-1)*Integer.parseInt(limit));
		return historyMapper.selectByMany(name,start_time,end_time,page,limit);
	}
	
	public int countByMany(String name,String start_time,String end_time){
		return historyMapper.countByMany(name,start_time,end_time);
	}

	public boolean add(int userid, String id, String name, String current_price, Set<Picture> pictureSet, String seller_id) {
		LocalDateTime time=LocalDateTime.now();
		Browsing_history history = new Browsing_history();
		history.setUid(userid);
		history.setName(name);
		history.setPid(Integer.parseInt(id));
		history.setPrice(current_price);
		history.setTime(time);
		history.setSeller_id(Integer.parseInt(seller_id));
		if(!pictureSet.isEmpty()) {
			history.setPicurl(pictureSet.iterator().next().getPicurl());
		}
		
		int row = historyMapper.insertSelective(history);
		if(row>0) {
			return true;
		}
		return false;
	}

}
