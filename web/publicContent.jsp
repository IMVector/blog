<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="assets/js/jquery1.12.4.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogFace/assets/css/bootstrap3.3.7.min.css">
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/jquery2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/bootstrap3.3.7.min.js"></script>


        <style>
        .mycontent img{
            width:100%;
        }
    </style>
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
                <li class="active"><a href="${pageContext.request.contextPath}/public_getAllBlogs.action">主页 <span
                        class="sr-only">(current)</span></a></li>
                <li><a href="${pageContext.request.contextPath}/blog_first.action">我的主页</a></li>
                <li><a href="${pageContext.request.contextPath}/time_timeLine.action">时间轴</a></li>
                <li><a href="${pageContext.request.contextPath}/blog_personal.action">个人中心</a></li>

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"> <s:property value="#session.user.nickName"></s:property></a></li>
                <li class="mynav"><a><img src="<s:property value="#session.user.headImage"/>" alt=""/></a></li>
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
                <img src="${host.headImage}" alt="...">
                <div class="caption">
                    <h3> ${host.nickName}</h3>
                    <p><c:choose>
                        <c:when test="${empty host.description}">
                            介绍下自己吧
                        </c:when>
                        <c:otherwise>
                            ${host.description}
                        </c:otherwise>
                    </c:choose>
                    </p>
                </div>
            </div>
            <!--博客头像个人介绍结束-->
            <!-- 博客目录 及链接-->
            <div class="panel panel-primary">
                <div class="panel-heading">标题</div>
                <div class="panel-body">
                    <ul class="list-group">
                        <c:forEach items="${blogs}" var="publicBlog">
                            <li class="list-group-item">
                                <a href="${pageContext.request.contextPath}/public_getBlogByID.action?bid=${publicBlog.bid}&id=${publicBlog.user.id}">
                                ${publicBlog.title}</a></li>
                        </c:forEach>
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
        <div class="col-md-9">
            <div class="panel panel-primary">
                <div class="panel-heading">内容
                    <a class="btn btn-danger col-md-offset-10"
                       href="${pageContext.request.contextPath}/public_getAllBlogs.action">返回</a>
                </div>

                <div class="page-header text-center">
                    <h1>主标题${currentBlog.title}
                        <small>副标题</small>
                    </h1>
                </div>
                <div class="mycontent">
                    ${currentBlog.content}
                </div>
            </div>
        </div>
    </div>

</div>
</div>
<!-- container结束 -->


<button class="btn btn-success" style="position:fixed;bottom:100px;right:0px;">
    返回顶部
</button>
<script>
    $(document).ready(function () {
            $("img").each(function () {
                var image = new Image();
                image.src = $(this).attr("src");
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