package com.vector.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.vector.service.TimeService;
import com.vector.vo.Time;
import com.vector.vo.User;
import org.apache.struts2.ServletActionContext;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TimeAction extends ActionSupport implements ModelDriven {
    private Time timeLine = new Time();
    private TimeService timeService;

    @Override
    public Object getModel() {
        return timeLine;
    }

    public void setTimeService(TimeService timeService) {
        this.timeService = timeService;
    }

    /**
     * 保存时间轴
     *
     * @return
     */
    public String saveTimeLine() {

        System.out.println(timeLine.getContent());
        System.out.println(timeLine.getImage());
        User u = (User) ActionContext.getContext().getSession().get("user");
        Date date = new Date();
        timeLine.setUser(u);
        timeLine.setPublishDate(date);
        timeService.saveTimeLine(timeLine);
        ServletActionContext.getResponse().setContentType(
                "text/html;charset=utf-8");
        timeLine.setImageList((ArrayList)dealImage(timeLine.getImage()));
        ActionContext.getContext().getValueStack().set("mytimeLine", timeLine);

        return "saveTimeLine";
    }

    /**
     * 处理image返回每个image的src 合成一个list
     * @param imageStr
     * @return
     */
    public List dealImage(String imageStr) {
        String[] temp = imageStr.split("\\(\\)");
        ArrayList list=new ArrayList();
        for (String str : temp) {
            list.add(str);
        }
        return list;
    }
    int id=0;
    /**
     * 查询某个用户的所有的timeLine
     * @return
     */
    public String getTime(){
        List<Time> list=timeService.getAllTime(id);
        ServletActionContext.getResponse().setContentType(
                "text/html;charset=utf-8");
        if(list!=null&&list.size()>0){
            //填充值栈
            ActionContext.getContext().getValueStack().set("timeLine", list);
        }
        for(Time t:list){
            t.setImageList((ArrayList) dealImage(t.getImage()));
        }
        return null;
    }

}
