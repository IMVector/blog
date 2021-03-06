package com.vector.dao.impl;

import java.util.List;

import com.vector.vo.User;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.vector.dao.UserDao;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

    @Override
    public void save(User user) {
        this.getHibernateTemplate().save(user);
    }

    @Override
    public User findByEmail(String email) {
        String hql = "from User where email=?";
        List<User> list = this.getHibernateTemplate().find(hql, email);
        if (list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public User findByLogonName(String nickName) {
        String hql = "from User where nickName=?";
        List<User> list = this.getHibernateTemplate().find(hql, nickName);
        if (list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
    }


    @Override
    public User login(User user) {
        String hql = "from User where email=? and password=?";
        List<User> list = this.getHibernateTemplate().find(hql, user.getEmail(), user.getPassword());
        if (list != null && list.size() > 0) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public User getById(int id) {
        String hql = "from User where id=?";
        List<User> ulist = this.getHibernateTemplate().find(hql, id);
        if (ulist != null && ulist.size() > 0) {
            return ulist.get(0);
        }
        return null;
    }

    @Override
    public void updateUser(User user) {
        this.getHibernateTemplate().update(user);
    }

}
