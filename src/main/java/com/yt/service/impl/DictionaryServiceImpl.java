package com.yt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yt.entity.Address;
import com.yt.entity.Dictionary;
import com.yt.mapper.DictionaryMapper;

@Service("dictionaryService")
public class DictionaryServiceImpl {

	@Autowired
	private DictionaryMapper dictionaryMapper;
	
	public boolean del(String id1) {
		int id=Integer.parseInt(id1);
		int row = dictionaryMapper.deleteByPrimaryKey(id);
		if(row>0) {
			return true;
		}
		return false;
	}
	
	public boolean add(Dictionary dictionary) {
		if(dictionary.getEditable()==null || dictionary.getEditable()=="") {
			dictionary.setEditable("·ñ");
		}else {
			dictionary.setEditable("ÊÇ");
		}
		int row = dictionaryMapper.insertSelective(dictionary);
		if(row>0) {
			return true;
		}
		return false;
	}
	
	public boolean set_editable(String id1) {
		int id=Integer.parseInt(id1);
		Dictionary dictionary= new Dictionary();
		dictionary.setId(id);
		int row = dictionaryMapper.updateByPrimaryKeySelective(dictionary);
		if(row>0) {
			return true;
		}
		return false;
	}
	
	public List<Dictionary> getall(String page1,String limit){
		String page = String.valueOf((Integer.parseInt(page1)-1)*Integer.parseInt(limit));
		return dictionaryMapper.selectAll(page,limit);
	}
	
	public int countall() {
		return dictionaryMapper.countAll();
	}
	
	public List<Dictionary> getByMany(String classification,String item,String value,String editable,String page1,String limit){
		String page = String.valueOf((Integer.parseInt(page1)-1)*Integer.parseInt(limit));
		return dictionaryMapper.selectByMany(classification,item,value,editable,page,limit);
	}

	public int countByMany(String classification, String item, String value, String editable) {
		return dictionaryMapper.countByMany(classification,item,value,editable);
	}

	public boolean edit_one(Dictionary dictionary, String id, String key, String value) {

		if(id!=null&& !"".equals(id) && key!=null && !"".equals(key) && value!=null && !"".equals(value)) {
			dictionary.setId(Integer.parseInt(id));
			switch (key) {
			case "classification":
				dictionary.setClassification(value);
				break;
			case "item":
				dictionary.setItem(value);
				break;
			case "value":
				dictionary.setValue(value);
				break;
			default:
				break;
			}
		}
		int row = dictionaryMapper.updateByPrimaryKeySelective(dictionary);
		if(row>0) {
			return true;
		}
		return false;
	}

	public String switch_item(String value, String type) {
		return dictionaryMapper.switch_item(value,type);
	}

	public List<Dictionary> getByclassification(String classification) {
		return dictionaryMapper.selectByClassification(classification);
	}

	
}
