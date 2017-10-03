package com.vector.dao;

import com.vector.vo.Blogs;
import java.util.List;

public interface BlogDao {
    public List<Blogs> getBlog(Integer id);

    public Blogs getBlogByID(Integer bid);
}
