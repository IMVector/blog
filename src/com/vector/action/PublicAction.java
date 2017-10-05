package com.vector.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.vector.service.BlogService;
import com.vector.service.UserService;
import com.vector.vo.Blogs;
import com.vector.vo.User;
import org.apache.struts2.ServletActionContext;

import java.util.List;

public class PublicAction extends ActionSupport implements ModelDriven {
    private Blogs blog=new Blogs();
    private BlogService blogService;
    private UserService userService;
    @Override
    public Object getModel() {
        return blog;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }

    /**
     * 查询所有blog按时间先后排序
     * @return
     */
    public String getAllBlogs(){
        List<Blogs> list=blogService.getAllBlogs();

        if(list!=null&&list.size()>0){
            ServletActionContext.getResponse().setContentType(
                    "text/html;charset=utf-8");
            //填充值栈
            ActionContext.getContext().getValueStack().set("blogList", list);
        }
        return "getAllBlogs";
    }
    private int id=0;
    public void setId(int id){this.id=id;}
    public String getBlogByID(){
        System.out.println("bid is   "+blog.getBid());
        System.out.println("id is    "+id);
        List<Blogs> currentList=blogService.getBlogByTwoID(id,blog.getBid());
        List<Blogs> showList=blogService.getBlog(id);
        User user=userService.getByid(id);
        ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
        if(currentList!=null&&currentList.size()>0){
            ActionContext.getContext().getValueStack().set("currentBlog",currentList.get(0));
        }
        if(showList!=null&&showList.size()>0){
            ActionContext.getContext().getValueStack().set("blogs",showList);
        }
        if(user!=null){
            ActionContext.getContext().getValueStack().set("host",user);
        }
        return "getBlogByID";
    }


}
