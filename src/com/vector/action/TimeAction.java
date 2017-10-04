package com.vector.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.vector.service.TimeService;

public class TimeAction extends ActionSupport implements ModelDriven {

    private TimeService timeService;
    @Override
    public Object getModel() {
        return null;
    }

    public void setTimeService(TimeService timeService) {
        this.timeService = timeService;
    }
}
