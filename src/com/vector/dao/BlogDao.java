package com.vector.dao;

import com.vector.vo.Blogs;
import java.util.List;

public interface BlogDao {
    public List<Blogs> getBlog(Integer id);

    public Blogs getBlogByID(Integer bid);

    public void saveBlog(Blogs blog);

    public List<Blogs> getAllBlogs();

    public List<Blogs> getBlogByTwoID(int id, int bid);

    public void deleteBlog(int bid);
}
