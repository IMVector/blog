<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>我的小窝</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogFace/assets/css/main.css"/>
    <noscript>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/blogFace/assets/css/noscript.css"/>
    </noscript>
    <!-- 顺序不能变 -->
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/jquery1.12.4.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogFace/assets/css/bootstrap3.3.7.min.css">
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/jquery2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/bootstrap3.3.7.min.js"></script>
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/jquery-1.8.3.min.js"></script>
    <%--<script>--%>
        <%--$(document).ready(function () {--%>
                <%--$.post("${pageContext.request.contextPath}/blog_getBlogs.action",--%>
                    <%--{}, function (data) {--%>
                        <%--var dataObj = eval('(' + data + ')'); //此时已变成json数组对象咯，下面可以直接用$.each循环取值啦--%>
                        <%--$.each(dataObj, function (index, item) {--%>
                            <%--$("#aaa").text(item.content);--%>
                            <%--item.bid;--%>
                            <%--item.publishDate;--%>
                            <%--item.title;--%>
                            <%--item.content;--%>
                            <%--item.image;--%>
                        <%--});--%>
                    <%--});--%>
            <%--}--%>
        <%--);--%>
    <%--</script>--%>
    <script>
        <%--function goToContent(bid){--%>
<%--//            alert(bid);--%>
            <%--$(document).ready(function () {--%>
                <%--$.post("",{"bid":bid},function () {--%>
                    <%--console.log("success");--%>
                <%--});--%>
            <%--})--%>
            <%--console.log("获取到的bid是"+bid);--%>
        <%--&lt;%&ndash;})&ndash;%&gt;--%>
        <%--}--%>
    </script>
    <%--<script>--%>
        <%--$(document).ready(function () {--%>
            <%--$(".goToContent").onclick(function () {--%>
                <%--var bid=$(this).attr("blogid");--%>
                <%--alert(bid);--%>
                <%--$.post("${pageContext.request.contextPath}/blog_getBlogByID.action",{"bid":bid},true);--%>
                <%--console.log("获取到的bid是"+bid);--%>
            <%--})--%>

        <%--})--%>
    <%--</script>--%>
</head>

<body class="is-loading">
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1"
                    aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Brand</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/public_getAllBlogs.action">主页</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/blog_first.action">我的主页<span class="sr-only">(current)</span></a></li>
                <li><a href="${pageContext.request.contextPath}/time_timeLine.action">时间轴</a></li>
                <li><a href="${pageContext.request.contextPath}/blog_personal.action">个人中心</a></li>
                <%--<li class="dropdown">--%>
                    <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">链接3 <span class="caret"></span></a>--%>
                    <%--<ul class="dropdown-menu">--%>
                        <%--<li><a href="#">子链接</a></li>--%>
                        <%--<li role="separator" class="divider"></li>--%>
                        <%--<li><a href="#">子链接1</a></li>--%>
                        <%--<li role="separator" class="divider"></li>--%>
                        <%--<li><a href="#">子链接2</a></li>--%>
                        <%--<li role="separator" class="divider"></li>--%>
                        <%--<li><a href="#">子链接3</a></li>--%>
                        <%--<li role="separator" class="divider"></li>--%>
                        <%--<li><a href="#">子链接4</a></li>--%>
                    <%--</ul>--%>
                <%--</li>--%>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><s:property value="#session.user.nickName"></s:property></a></li>
                <li class="mynav"><a><img src="<s:property value="#session.user.headImage"/>"
                                          alt=""/></a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
<!--导航栏结束-->

<!-- body主要内容显示区 -->
<div class="container" style="margin-top:-10px;">

    <div class="row">

        <!-- 左边区域 -->
        <div class="col-md-3" style="background:white;border-radius:6px;padding-top:10px;">
            <!-- 252*366 -->
            <!--博客头像个人介绍  -->
            <div class="thumbnail">
                <img src="<s:property value="#session.user.headImage"/>" alt="...">
                <div class="caption">
                    <h3>
                        <s:property value="#session.user.nickName"></s:property>
                    </h3>
                    <p>
                        <s:if test="#session.user.description!=null">
                            <s:property value="#session.user.description"></s:property>
                        </s:if><s:else>
                        介绍下自己吧
                    </s:else>
                    </p>
                </div>
            </div>
            <!--博客头像个人介绍结束-->
            <!-- 博客目录 及链接-->
            <div class="panel panel-primary">
                <div class="panel-heading">标题</div>
                <div class="panel-body">
                    <ul class="list-group">
                        <s:iterator value="blog" var="blog1">
                            <li class="list-group-item"><a href="${pageContext.request.contextPath}/blog_getBlogByID.action?bid=<s:property value='#blog1.bid'/>"><s:property value="#blog1.title"></s:property></a></li>
                        </s:iterator>
                        <%--<li class="list-group-item">内容2</li>--%>
                        <%--<li class="list-group-item">内容3</li>--%>
                        <%--<li class="list-group-item">内容4</li>--%>
                        <%--<li class="list-group-item">内容5</li>--%>
                        <li class="list-group-item">
                            <nav aria-label="Page navigation">
                                <ul class="pagination pagination-sm">
                                    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
                                    </li>
                                    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li>
                                        <a href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 博客目录 及链接结束-->

        </div>
        <!-- 左边区域结束 -->

        <!-- 右边区域 -->
        <div class="col-md-9">
            <!-- 内容编辑区跳转响应框 -->
            <a class="input-group" href="${pageContext.request.contextPath}/editContent.jsp">
                <input type="text" class="form-control" aria-label="..." style="height:100px;">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="button" style="height:100px;">编辑内容</button>
                </div>
            </a>


            <div class="panel panel-danger">
                <div class="panel-heading text-center">我的博客</div>
                <!-- <div class="panel-body">
                    标题内容
                </div> -->
                <!-- List group -->
                <ul class="list-group">
                    <s:iterator value="blog" var="blog1">
                    <li class="list-group-item mylist-group-item">
                        <div class="row">
                            <div class="col-xs-6 col-md-2">
                                <a href="${pageContext.request.contextPath}/blog_getBlogByID.action?bid=<s:property value='#blog1.bid'/>" class="thumbnail goToContent">
                                    <img src="<s:property value='#blog1.titleImage'/>" style="max-height: 170px;" alt="...">
                                </a>
                            </div>
                            <a href="${pageContext.request.contextPath}/blog_getBlogByID.action?bid=<s:property value='#blog1.bid'/>" class="goToContent"><s:property value="blog1.image"/><s:property value="#blog1.title"/> 这里可以写很多内容。。。。。。。。。。。。。。。。。。。。。。。。。<br>
                            </a>
                        </div>
                    </li>
                    </s:iterator>
                </ul>
                <!-- <div class="panel-footer">标题尾</div> -->
            </div>

        </div>
        <!-- 右边区域结束 -->


    </div>
    <!-- row结束 -->
</div>
<!-- container结束 -->


<button class="btn btn-success" style="position:fixed;bottom:100px;right:0px;" onclick="show()">
    返回顶部
</button>
<script>
    $(document).ready(function () {
            $("img").each(function() {
                var image=new Image();
                image.src=$(this).attr("src");
                console.log(image.src);
            });

        }

    )
</script>
<!-- Scripts -->
<!--[if lte IE 8]>

<script src="${pageContext.request.contextPath}/blogFace/assets/js/respond.min.js"></script><![endif]-->
<script>
    if ('addEventListener' in window) {
        window.addEventListener('load', function () {
            document.body.className = document.body.className.replace(/\bis-loading\b/, '');
        });
        document.body.className += (navigator.userAgent.match(/(MSIE|rv:11\.0)/) ? ' is-ie' : '');
    }
</script>

</body>

</html>