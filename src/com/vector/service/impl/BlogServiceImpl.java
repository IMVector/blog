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

    @Override
    public void saveBlog(Blogs blog) {
        blogDao.saveBlog(blog);
    }

    @Override
    public List<Blogs> getAllBlogs() {
        return blogDao.getAllBlogs();
    }

    @Override
    public List<Blogs> getBlogByTwoID(int id, int bid) {
        return blogDao.getBlogByTwoID(id,bid);
    }

    @Override
    public void deleteBlog(int bid) {
        blogDao.deleteBlog(bid);
    }

}
