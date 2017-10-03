package com.vector.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.vector.service.BlogService;
import com.vector.utils.JsonDateDeal;
import com.vector.utils.JsonHelper;
import com.vector.vo.Blogs;
import com.vector.vo.User;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.vector.service.UserService;
import org.json.JSONObject;

import javax.xml.ws.Response;

public class UserAction extends ActionSupport implements ModelDriven {

    private User user = new User();
    private Blogs blog=new Blogs();
    private UserService userService;
    private BlogService blogService;

    @Override
    public Object getModel() {
        return user;
    }

    // 注入（一定提供set方法）
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }

    /**
     * 转到注册页面
     *
     * @return
     */
    public String registUI() {
        return "registUI";
    }

    /**
     * 用户注册
     *
     * @return
     */
    @InputConfig(resultName = "registInput")
    public String regist() {
        userService.register(user);
        return "regist";
    }

    /**
     * 检查用户是否已经存在
     *
     * @return
     * @throws IOException
     */
    public String checklogonName() throws IOException {
        User customer = userService.findByLogonName(user.getEmail());
        ServletActionContext.getResponse().setContentType(
                "text/html;charset=utf-8");
        if (customer == null) {
            ServletActionContext.getResponse().getWriter().println(1);
        } else {
            ServletActionContext.getResponse().getWriter().println(2);
        }
        return null;
    }

    @InputConfig(resultName = "loginInput")
    public String login() {
        User u = userService.login(user);
        if (u != null) {
            ActionContext.getContext().getSession().put("user", u);//用户成功登录
            try {
                getBlogs();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return "loginSuccess";
        } else {
            //登录失败跳转到input逻辑视图中，为了和regist校验区分所以加注解
            return "loginInput";
        }
    }

    /**
     * 跳转到第一页
     * @return
     */
    public String first() throws IOException {
        getBlogs();
        return "first";
    }

    /**
     * 跳转到个人中心
     * @return
     * @throws IOException
     */
    public String personal() throws IOException {
        getBlogs();
        return "personal";
    }

    /**
     * 跳转到时间轴页面
     * @return
     */
    public String time(){
        return "time";
    }
    /**
     * 查询当前用户的所有blog
     * @return
     * @throws IOException
     */
    public String getBlogs() throws IOException {
        User user = (User) ActionContext.getContext().getSession().get("user");
        //用户登陆成功时查询所有内容
        List<Blogs> blogsList = blogService.getBlog(user.getId());
        System.out.println("size is "+blogsList.size());
        ServletActionContext.getResponse().setContentType(
                "text/html;charset=utf-8");
        //填充值栈
        ActionContext.getContext().getValueStack().set("blog", blogsList);
        //必须返回null，要不前端就没有响应fuck
        return null;
    }

    /**
     * 查询某个博客
     * @return
     */
    private int bid=0;
    public void setBid(int bid){
        this.bid=bid;
    }
    public String getBlogByID() throws IOException {
        //先查询所有的博客
        getBlogs();
        //查询某个博客
        System.out.println(bid);
        System.out.println("下面已经执行");
        Blogs currentblog=blogService.getBlogByID(bid);
        System.out.println(currentblog.getContent());
        ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
        ActionContext.getContext().getValueStack().set("currentBlog",currentblog);
        return "goToContent";
    }

}








//{
//        if (blogsList != null && blogsList.size() > 0) {
//        for (Blogs b : blogsList) {
//        //！！！！！！！非常重要，有指针解析不了，所以要把user设置为null;
//        b.setUser(null);
//        }
//        }
//        //处理一下date型数据
//        JsonConfig jsonConfig = new JsonConfig();
//        jsonConfig.registerJsonValueProcessor(Date.class,
//        new JsonDateDeal());// 注入处理Date类
//        //format
//        JSONArray jsonArray2 = JSONArray.fromObject(blogsList, jsonConfig);
//        System.out.println(jsonArray2.toString());
//        PrintWriter out = ServletActionContext.getResponse().getWriter();
//        out.write(jsonArray2.toString());
//        }