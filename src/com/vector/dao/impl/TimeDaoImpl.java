package com.vector.dao.impl;

import com.vector.dao.TimeDao;
import com.vector.vo.Time;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

public class TimeDaoImpl extends HibernateDaoSupport implements TimeDao {

    /**
     * 保存时间轴信息
     * @param timeLine
     */
    @Override
    public void saveTimeLine(Time timeLine) {
        this.getHibernateTemplate().save(timeLine);
    }

    @Override
    public List<Time> getAllTime(int id) {
        String hql="from Time where User.id=?";
        List<Time> list=this.getHibernateTemplate().find(hql,id);
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }
    @Override
    public Time getOneTime(int id,int tid) {
        String hql="from Time where User.id=? and tid=?";
        List<Time> list=this.getHibernateTemplate().find(hql,id,tid);
        if(list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }
}
