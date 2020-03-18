package com.yt.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Collect implements Serializable {
    private Integer id;

    private Integer uid;

    private Integer pid;

    private Set<Product> products;
    
    private Set<Picture> pictures;
    
    private static final long serialVersionUID = 1L;
    

    public Collect() {
		products = new HashSet<Product>();
		pictures = new HashSet<Picture>();
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	public Set<Picture> getPictures() {
		return pictures;
	}

	public void setPictures(Set<Picture> pictures) {
		this.pictures = pictures;
	}
}