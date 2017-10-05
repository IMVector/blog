package com.vector.service.impl;

import com.vector.dao.TimeDao;
import com.vector.service.TimeService;
import com.vector.vo.Time;

import java.util.List;

public class TimeServiceImpl implements TimeService {
    private TimeDao timeDao;

    public void setTimeDao(TimeDao timeDao) {
        this.timeDao = timeDao;
    }

    @Override
    public void saveTimeLine(Time timeLine) {
        timeDao.saveTimeLine(timeLine);
    }

    @Override
    public List<Time> getAllTime(int id) {
        return timeDao.getAllTime(id);
    }

    @Override
    public Time getOneTime(int id, int tid) {
        return timeDao.getOneTime(id,tid);
    }
}
