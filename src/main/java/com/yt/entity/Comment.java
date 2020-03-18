package com.yt.entity;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

public class Comment implements Serializable {
    private Integer cid;

    private Integer pid;

    private Integer post_uid;

    private String comment;

    private LocalDateTime time;

    private Integer comment_uid;

    private String comment_name;

    private String count;

    private static final long serialVersionUID = 1L;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getPost_uid() {
        return post_uid;
    }

    public void setPost_uid(Integer post_uid) {
        this.post_uid = post_uid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

    public Integer getComment_uid() {
        return comment_uid;
    }

    public void setComment_uid(Integer comment_uid) {
        this.comment_uid = comment_uid;
    }

    public String getComment_name() {
        return comment_name;
    }

    public void setComment_name(String comment_name) {
        this.comment_name = comment_name == null ? null : comment_name.trim();
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count == null ? null : count.trim();
    }
}