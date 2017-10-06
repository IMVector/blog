package com.vector.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.vector.service.BlogService;
import com.vector.vo.Blogs;
import com.vector.vo.User;
import org.apache.struts2.ServletActionContext;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
    public String saveBlog() throws UnsupportedEncodingException, ParseException {
//        System.out.println(blog.getBid());
//        System.out.println(blog.getContent());
//        System.out.println(blog.getTitle());
//        System.out.println(blog.getImage());
//        System.out.println(blog.getPublishDate());
//        System.out.println(blog.getTitleImage());
        HttpServletRequest request=ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        String content=request.getParameter("editorValue");
        System.out.println("s2输出内容"+content);
//        |||||[{id=1}{title=231}{publishDate=2017/10/4/16/48}{image=null}]|||||
//        System.out.println(content.indexOf("|||||["));
        int start=content.indexOf("|||||[")+6;
        int end=content.indexOf("]|||||");
        String newContent=content.substring(0,start-6);
        System.out.println(content.substring(start,end));
        String newStr=content.substring(start,end);
        String []strArray=newStr.split("}");
        String []finalStr=new String[2];
        for(int i=0;i<strArray.length;i++){
            String []temp=strArray[i].split("=");
            finalStr[i]=temp[1];
            System.out.println(finalStr[i]);
        }
        Date date = new Date();
        User u= (User) ActionContext.getContext().getSession().get("user");
        String[] titleImage=finalStr[1].split("\\(\\)");
        System.out.println(titleImage[0]);
        blog.setTitle(finalStr[0]);
        blog.setUser(u);
        blog.setImage(finalStr[1]);
        blog.setTitleImage(titleImage[0]);
        blog.setPublishDate(date);
        blog.setContent(newContent);
        ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
        ActionContext.getContext().getValueStack().set("currentBlog",blog);

        blogService.saveBlog(blog);
        return "saveBlog";
    }
}
