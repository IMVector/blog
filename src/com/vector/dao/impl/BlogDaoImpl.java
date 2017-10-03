package com.vector.dao.impl;

import com.vector.dao.BlogDao;
import com.vector.vo.Blogs;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import java.util.List;

public class BlogDaoImpl extends HibernateDaoSupport implements BlogDao {
    /**
     * 返回某个用户的所有博客
     * @param id
     * @return
     */
    @Override
    public List<Blogs> getBlog(Integer id) {
        String hql="from Blogs where user.id=?";
        List<Blogs> list=this.getHibernateTemplate().find(hql,id);
        if(list!=null&&list.size()>0){
            return list;
        }
        return null;
    }

    @Override
    public Blogs getBlogByID(Integer bid) {
        String hql="from Blogs where bid=?";
        List<Blogs> blog=this.getHibernateTemplate().find(hql,bid);
        if(blog!=null&&blog.size()>0){
            return blog.get(0);
        }
        return null;
    }
}
