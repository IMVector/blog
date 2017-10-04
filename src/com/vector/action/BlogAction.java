package com.vector.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.vector.service.BlogService;
import com.vector.vo.Blogs;

public class BlogAction extends ActionSupport implements ModelDriven <Blogs>{
    private Blogs blog=new Blogs();
    private BlogService blogService;

    @Override
    public Blogs getModel() {
        return blog;
    }

    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }


    public void setBlog(Blogs blog){
        this.blog=blog;
    }
    /**
     *保存博客
     */
    public String saveBlog(){
        blogService.saveBlog(blog);
        return "saveBlog";
    }
}
