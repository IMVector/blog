package com.vector.service;

import com.vector.utils.DividePage;
import com.vector.vo.Blogs;

import java.util.List;

public interface BlogService {
    public List<Blogs> getBlog(Integer id);

    public Blogs getBlogByID(Integer bid);

    public void saveBlog(Blogs blog);

    public List<Blogs> getAllBlogs();

    public List<Blogs> getBlogByTwoID(int id, int bid);
}
