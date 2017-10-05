package com.vector.dao;

import com.vector.vo.Time;

import java.util.List;

public interface TimeDao {
    public void saveTimeLine(Time timeLine);
    public List<Time> getAllTime(int id);
    public Time getOneTime(int id,int tid);
}
