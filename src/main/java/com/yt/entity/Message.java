package com.yt.entity;

import java.io.Serializable;
/**
 *
 * 类名：Message.java
 * 描述：消息类
 * 时间：2018年5月8日 下午21:02:57
 * @author cn.wenwuyi
 * @version 1.0
 */
public class Message implements Serializable{
	/**
	 * 类型 
	 * QUERY_LATEST=0;
	 * QUERY_ALL=1;
	 * RESPONSE_BLOCKCHAIN=2;
	 */ 
    private int    type;
    /**
     * 数据
     */
    private String data;
 
    public Message() {
    }

    public Message(int type) {
        this.type = type;
    }

    public Message(int type, String data) {
        this.type = type;
        this.data = data;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}