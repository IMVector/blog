package com.vector.vo;

import java.util.ArrayList;
import java.util.Date;

public class Time {
    private Integer tid;
    private String title;
    private String image;
    private String content;
    private Date publishDate;
    private User user;
    private ArrayList imageList=new ArrayList();

    public ArrayList getImageList() {
        return imageList;
    }

    public void setImageList(ArrayList imageList) {
        this.imageList = imageList;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
