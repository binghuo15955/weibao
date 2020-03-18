package com.yt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yt.mapper.PictureMapper;

@Service("pictureService")
public class PictureServiceImpl {
	
	@Autowired
	private PictureMapper pictureMapper;
	
	public List<String> getAllurl(){
		return pictureMapper.selectAllurl();
	}
}
