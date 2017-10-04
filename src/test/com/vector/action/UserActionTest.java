package test.com.vector.action; 

import com.vector.dao.BlogDao;
import com.vector.dao.impl.BlogDaoImpl;
import com.vector.service.BlogService;
import com.vector.service.impl.BlogServiceImpl;
import com.vector.vo.Blogs;
import com.vector.vo.User;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringEscapeUtils;
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
    String str="&nbsp;&nbsp;&nbsp;&nbsp;\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;(e)&nbsp;{\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(.getEditor(&#39;editor&#39;).());\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;...(e)\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n" +
            "\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;(e)&nbsp;{\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.getEditor(&#39;editor&#39;).();\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;...(e)\n" +
            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n" +
            "\n" +
            "\n" +
            "&lt;/body&gt;\n" +
            "\n" +
            "&lt;/html&gt;</pre><p><br/></p><p>|||||[{id=1}{title=231}{publishDate=2017/10/4/16/48}{image=null}{titleImage=null}]|||||</p>";
    System.out.println(str.indexOf("|||||["));
    System.out.println(str.indexOf("]|||||"));
    int start=str.indexOf("|||||[")+6;
    int end=str.indexOf("]|||||");
    System.out.println(str.substring(start,end));
    String newStr=str.substring(start,end);
    String []strArray=newStr.split("}");
    String []finalStr=new String[5];
    for(int i=0;i<strArray.length;i++){
        String []temp=strArray[i].split("=");
        finalStr[i]=temp[1];
        System.out.println(finalStr[i]);
    }
    String newContent=str.substring(0,start);
    System.out.println(newContent);
//    System.out.println(strArray);
//    String newJson = StringEscapeUtils.unescapeHtml4(str.substring(start,end));
//    System.out.println(newJson);

}


} 
