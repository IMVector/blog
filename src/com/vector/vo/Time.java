package com.vector.vo;

import java.util.ArrayList;
import java.util.Date;

public class Time {
    private Integer tid;
    private String ltitle;
    private String limage;
    private String lcontent;
    private Date lpublishDate;
    private User luser;
    private ArrayList limageList=new ArrayList();

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getLtitle() {
        return ltitle;
    }

    public void setLtitle(String ltitle) {
        this.ltitle = ltitle;
    }

    public String getLimage() {
        return limage;
    }

    public void setLimage(String limage) {
        this.limage = limage;
    }

    public String getLcontent() {
        return lcontent;
    }

    public void setLcontent(String lcontent) {
        this.lcontent = lcontent;
    }

    public Date getLpublishDate() {
        return lpublishDate;
    }

    public void setLpublishDate(Date lpublishDate) {
        this.lpublishDate = lpublishDate;
    }

    public User getLuser() {
        return luser;
    }

    public void setLuser(User luser) {
        this.luser = luser;
    }

    public ArrayList getLimageList() {
        return limageList;
    }

    public void setLimageList(ArrayList limageList) {
        this.limageList = limageList;
    }
}
