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
    private Time time = new Time();
    private TimeService timeService;

    @Override
    public Object getModel() {
        return time;
    }

    public void setTimeService(TimeService timeService) {
        this.timeService = timeService;
    }

    /**
     * 转到timeLine页
     *
     * @return
     */
    public String timeLine() {
        User u = (User) ActionContext.getContext().getSession().get("user");
        getTime(u.getId());
        return "timeLine";
    }

    /**
     * 保存时间轴
     *
     * @return
     */
    public String saveTimeLine() {
        System.out.println(time.getLcontent());
        System.out.println(time.getLimage());
        if (time.getLcontent() != null && time.getLcontent() != "" || time.getLimage() != null && time.getLimage() != "") {
            User u = (User) ActionContext.getContext().getSession().get("user");
            Date date = new Date();
            time.setLuser(u);
            time.setLpublishDate(date);
            timeService.saveTimeLine(time);
//            ServletActionContext.getResponse().setContentType(
//                    "text/html;charset=utf-8");
//            time.setLimageList((ArrayList) dealImage(time.getLimage()));
//            ArrayList list = new ArrayList();
//            list.add(time);
//            ActionContext.getContext().getValueStack().set("timeLine", list);
        }

        return "timeLine";
    }

    /**
     * 处理image返回每个image的src 合成一个list
     *
     * @param imageStr
     * @return
     */
    public List dealImage(String imageStr) {
        String[] temp = imageStr.split("\\(\\)");
        ArrayList list = new ArrayList();
        for (String str : temp) {
            list.add(str);
        }
        return list;
    }

    /**
     * 查询某个用户的所有的timeLine
     *
     * @return
     */
    public String getTime(int id) {
        List<Time> list = timeService.getAllTime(id);
        ServletActionContext.getResponse().setContentType(
                "text/html;charset=utf-8");
        if (list != null && list.size() > 0) {
            for (Time t : list) {
                t.setLimageList((ArrayList) dealImage(t.getLimage()));
            }
            //填充值栈
            ActionContext.getContext().getValueStack().set("timeLine", list);
        }

        return null;
    }

}
