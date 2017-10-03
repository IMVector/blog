package test.com.vector.action; 

import com.vector.dao.BlogDao;
import com.vector.dao.impl.BlogDaoImpl;
import com.vector.service.BlogService;
import com.vector.service.impl.BlogServiceImpl;
import com.vector.vo.Blogs;
import com.vector.vo.User;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.junit.Test;
import org.junit.Before; 
import org.junit.After;

import java.awt.List;
import java.util.*;

/** 
* UserAction Tester. 
* 
* @author <Authors name> 
* @since <pre>十月 3, 2017</pre> 
* @version 1.0 
*/ 
public class UserActionTest { 

@Before
public void before() throws Exception { 
} 

@After
public void after() throws Exception { 
} 

/** 
* 
* Method: getModel() 
* 
*/ 
@Test
public void testGetModel() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: setUserService(UserService userService) 
* 
*/ 
@Test
public void testSetUserService() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: setBlogService(BlogService blogService) 
* 
*/ 
@Test
public void testSetBlogService() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: registUI() 
* 
*/ 
@Test
public void testRegistUI() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: regist() 
* 
*/ 
@Test
public void testRegist() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: checklogonName() 
* 
*/ 
@Test
public void testChecklogonName() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: login() 
* 
*/ 
@Test
public void testLogin() throws Exception {

} 

/** 
* 
* Method: getBlogs() 
* 
*/ 
@Test
public void testGetBlogs() throws Exception {
    User u=new User();
    u.setNickName("adsf");
    u.setId(1);
    Blogs blogs=new Blogs();
    blogs.setTitle("afss");
    blogs.setContent("asdfsdf");
    JSONArray jsonArray2 = JSONArray.fromObject(blogs);
    System.out.println(jsonArray2.toString());
}


} 
