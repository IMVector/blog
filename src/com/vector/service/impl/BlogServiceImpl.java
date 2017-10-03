package com.vector.service.impl;

import com.vector.dao.BlogDao;
import com.vector.service.BlogService;
import com.vector.utils.CommonUtils;
import com.vector.utils.DividePage;
import com.vector.vo.Blogs;

import java.util.List;

public class BlogServiceImpl implements BlogService {

    private BlogDao blogDao;

    public void setBlogDao(BlogDao blogDao) {
        this.blogDao = blogDao;
    }

    @Override
    public List<Blogs> getBlog(Integer id) {
        return blogDao.getBlog(id);
    }

    @Override
    public Blogs getBlogByID(Integer bid) {
        return blogDao.getBlogByID(bid);
    }

}
