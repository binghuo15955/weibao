package com.yt.entity;

import java.io.Serializable;

public class CategoryCount implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String category;
	private String count;
	
	public CategoryCount() {
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
	

}
