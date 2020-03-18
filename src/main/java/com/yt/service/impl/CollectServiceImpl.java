package com.yt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yt.entity.Collect;
import com.yt.mapper.CollectMapper;

@Service("CollectService")
public class CollectServiceImpl {
	
	@Autowired
	private CollectMapper collectMapper;
	
	
	public List<Collect> getByUid(String uid,String page1,String limit){
		String page = String.valueOf((Integer.parseInt(page1)-1)*Integer.parseInt(limit));
		return collectMapper.selectByUid(uid,page,limit);
	}
	
	public int countByUid(String uid){
		return collectMapper.countByUid(uid);
	}
	
	/*public List<Collect> getByMany(String name,String start_time,String end_time,String page1,String limit){
		String page = String.valueOf((Integer.parseInt(page1)-1)*Integer.parseInt(limit));
		return CollectMapper.selectByMany(name,start_time,end_time,page,limit);
	}
	
	public int countByMany(String name,String start_time,String end_time){
		return CollectMapper.countByMany(name,start_time,end_time);
	}*/

	public boolean add(String uid, String pid) {
		Collect collect = new Collect();
		collect.setPid(Integer.parseInt(pid));
		collect.setUid(Integer.parseInt(uid));
		int row = collectMapper.insertDistrict(collect);	
		if(row>0) {
			return true;
		}
		return false;
		
	}

	public boolean del(String uid, String pid) {
		int row = collectMapper.deleteByUid_Pid(uid,pid);
		if(row>0) {
			return true;
		}
		return false;
	}
	
	public boolean delbyid(String cid) {
		int id=Integer.parseInt(cid);
		int row = collectMapper.deleteByPrimaryKey(id);
		if(row>0) {
			return true;
		}
		return false;
	}

	public boolean getByUid_Pid(int uid, String pid) {
		Collect collect= collectMapper.selectByUid_Pid(uid,pid);
		if (collect!=null) {
			return true;
		}
		return false;
	}

}
