package com.vector.service.impl;

import com.vector.dao.TimeDao;
import com.vector.service.TimeService;

public class TimeServiceImpl implements TimeService {
    private TimeDao timeDao;

    public void setTimeDao(TimeDao timeDao) {
        this.timeDao = timeDao;
    }
}
