package test.com.vector.action; 

import org.junit.Test;
import org.junit.Before; 
import org.junit.After;

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
String imageStr="/blog/blogFace/jsp/upload/image/20171005/1507177472006024436.jpg()/blog/blogFace/jsp/upload/image/20171005/1507177472006089364.jpg()/blog/blogFace/jsp/upload/image/20171005/1507177472087064757.png()/blog/blogFace/jsp/upload/image/20171005/1507177472006022894.png()/blog/blogFace/jsp/upload/image/20171005/1507177472341088039.jpg()/blog/blogFace/jsp/upload/image/20171005/1507177472356057554.png()";
//    String imageStr="";
    ArrayList outList =new ArrayList();
    String[] temp = imageStr.split("\\(\\)");
    ArrayList list=new ArrayList();
    for (String str : temp) {
        list.add(str);
    }
    outList.add(list);
    ArrayList list1=new ArrayList();
    for (String str : temp) {
        list1.add(str);
    }
    outList.add(list1);
    System.out.println(outList.size());
    System.out.println(outList.get(0));
    ArrayList a=(ArrayList)outList.get(0);
    System.out.println(a.get(0));


} 

/** 
* 
* Method: getBlogs() 
* 
*/ 
@Test
public void testGetBlogs() throws Exception {
//    String str="&nbsp;&nbsp;&nbsp;&nbsp;\n" +
//            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;(e)&nbsp;{\n" +
//            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(.getEditor(&#39;editor&#39;).());\n" +
//            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;...(e)\n" +
//            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n" +
//            "\n" +
//            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;(e)&nbsp;{\n" +
//            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.getEditor(&#39;editor&#39;).();\n" +
//            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;...(e)\n" +
//            "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n" +
//            "\n" +
//            "\n" +
//            "&lt;/body&gt;\n" +
//            "\n" +
//            "&lt;/html&gt;</pre><p><br/></p><p>|||||[{id=1}{title=231}{publishDate=2017/10/4/16/48}{image=null}{titleImage=null}]|||||</p>";
   String str="<p><img src=\"/blog/blogFace/jsp/upload/image/20171006/1507268843135059895.png\" title=\"1507268843135059895.png\"/></p><p><img src=\"/blog/blogFace/jsp/upload/image/20171006/1507268843098030498.png\" title=\"1507268843098030498.png\"/></p><p><br/></p><p>|||||[{title=样本区分}{image=/blog/blogFace/jsp/upload/image/20171006/1507268843135059895.png()/blog/blogFace/jsp/upload/image/20171006/1507268843098030498.png()}]|||||</p>";


    System.out.println(str.indexOf("|||||["));
    System.out.println(str.indexOf("]|||||"));
    int start=str.indexOf("|||||[")+6;
    int end=str.indexOf("]|||||");
    String newContent=str.substring(0,start-6);
    System.out.println(str.substring(start,end));
    String newStr=str.substring(start,end);
    String []strArray=newStr.split("}");
    String []finalStr=new String[2];
    for(int i=0;i<strArray.length;i++){
        String []temp=strArray[i].split("=");
        finalStr[i]=temp[1];
        System.out.println(finalStr[i]);
    }
    String[] titleImage=finalStr[1].split("\\(\\)");
    System.out.println(titleImage[0]);
//    System.out.println(strArray);
//    String newJson = StringEscapeUtils.unescapeHtml4(str.substring(start,end));
//    System.out.println(newJson);

}


} 
