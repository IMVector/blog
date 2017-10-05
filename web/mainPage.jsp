<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>主页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogFace/assets/css/main.css"/>
    <noscript>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/blogFace/assets/css/noscript.css"/>
    </noscript>
    <!-- bootstrap样式，顺序不能改变 -->
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/jquery1.12.4.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogFace/assets/css/bootstrap3.3.7.min.css">
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/jquery2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/bootstrap3.3.7.min.js"></script>
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/jquery-1.8.3.min.js"></script>
</head>
<body>
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
                <li class="active"><a href="${pageContext.request.contextPath}/public_getAllBlogs.action">主页 <span class="sr-only">(current)</span></a></li>
                <li><a href="${pageContext.request.contextPath}/blog_first.action">我的主页</a></li>
                <li><a href="${pageContext.request.contextPath}/time_timeLine.action">时间轴</a></li>
                <li><a href="${pageContext.request.contextPath}/blog_personal.action">个人中心</a></li>
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

<div class="container">
    <div class="jumbotron">
        <h1>Hello, world!</h1>
        <p>...</p>
        <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
    </div>


    <div class="panel panel-primary">
        <div class="panel-heading">博客展示</div>
        <ul class="list-group">
            <c:forEach items="${blogList}" var="list">
                <li class="list-group-item mylist-group-item">
                    <div class="row">
                        <div class="col-xs-6 col-md-2">
                            <a href="${pageContext.request.contextPath}/public_getBlogByID.action?bid=${list.bid}&id=${list.user.id}" class="thumbnail goToContent">
                                <img src="${list.titleImage}" style="max-height: 170px;" alt="...">
                            </a>
                        </div>
                        <a href="${pageContext.request.contextPath}/public_getBlogByID.action?bid=${list.bid}&id=${list.user.id}" class="goToContent">
                            ${list.title}

                        </a>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <!-- <div class="panel-footer">标题尾</div> -->

    </div>

</div>

</body>
</html>