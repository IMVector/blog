<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 25235
  Date: 2017/10/1
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>我的时间轴</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="blogFace/assets/css/main.css" />
    <noscript>
        <link rel="stylesheet" href="blogFace/assets/css/noscript.css" />
    </noscript>
    <!-- 顺序不能变 -->
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/jquery1.12.4.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogFace/assets/css/bootstrap3.3.7.min.css">
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/jquery2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/bootstrap3.3.7.min.js"></script>
    <!-- 时间轴特殊 -->
    <link href="${pageContext.request.contextPath}/blogFace/assets/css/timeline.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/blogFace/assets/js/modernizr.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/blogFace/assets/js/jquery-1.8.3.min.js"></script>

</head>

<body class="is-loading">
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
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
                <li><a href="${pageContext.request.contextPath}/blog_first.action">主页 </a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/blog_time.action">时间轴 <span class="sr-only">(current)</span></a></li>
                <li><a href="${pageContext.request.contextPath}/blog_personal.action">个人中心</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">链接3 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">子链接</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">子链接1</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">子链接2</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">子链接3</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">子链接4</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">  <s:property value="#session.user.nickName"></s:property></a></li>
                <li class="mynav"><a><img src="<s:property value="#session.user.headImage"/>" alt="" /></a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
<!--导航栏结束-->

<!-- body主要内容显示区 -->
<div class="container" style="margin-top:-10px;">
    <section id="cd-timeline" class="cd-container">
        <div class="cd-timeline-block">
            <div class="cd-timeline-img cd-picture">
                <img src="blogFace/images/cd-icon-picture.svg" alt="Picture">
            </div>
            <!-- cd-timeline-img -->

            <div class="cd-timeline-content">
                <h2>标题</h2>
                <p>内容</p>
                <a href="#" class="cd-read-more">阅读更多</a>
                <span class="cd-date">Jan 14</span>
            </div>
            <!-- cd-timeline-content -->
        </div>
        <!-- cd-timeline-block -->

        <div class="cd-timeline-block">
            <div class="cd-timeline-img cd-movie bounce-in">
                <img src="blogFace/images/cd-icon-movie.svg" alt="Movie">
            </div>
            <!-- cd-timeline-img -->

            <div class="cd-timeline-content bounce-in">
                <h2>标题</h2>
                <p>内容
                    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
                    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
                    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
                    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
                    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
                    内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容
                </p>
                <a href="#" class="cd-read-more">阅读更多</a>
                <span class="cd-date">Jan 18</span>
            </div>
            <!-- cd-timeline-content -->
        </div>
        <!-- cd-timeline-block -->

        <div class="cd-timeline-block">
            <div class="cd-timeline-img cd-picture bounce-in">
                <img src="blogFace/images/cd-icon-picture.svg" alt="Picture">
            </div>
            <!-- cd-timeline-img -->

            <div class="cd-timeline-content bounce-in">
                <h2>标题</h2>
                <p>内容</p>
                <a href="#" class="cd-read-more">阅读更多</a>
                <span class="cd-date">Jan 24</span>
            </div>
            <!-- cd-timeline-content -->
        </div>
        <!-- cd-timeline-block -->

        <div class="cd-timeline-block">
            <div class="cd-timeline-img cd-location bounce-in">
                <img src="blogFace/images/cd-icon-location.svg" alt="Location">
            </div>
            <!-- cd-timeline-img -->

            <div class="cd-timeline-content bounce-in">
                <h2>标题</h2>
                <p>内容</p>
                <a href="#" class="cd-read-more">阅读更多</a>
                <span class="cd-date">Feb 14</span>
            </div>
            <!-- cd-timeline-content -->
        </div>
        <!-- cd-timeline-block -->

        <div class="cd-timeline-block">
            <div class="cd-timeline-img cd-location bounce-in">
                <img src="blogFace/images/cd-icon-location.svg" alt="Location">
            </div>
            <!-- cd-timeline-img -->

            <div class="cd-timeline-content bounce-in">
                <h2>标题</h2>
                <p>内容</p>
                <a href="#" class="cd-read-more">阅读更多</a>
                <span class="cd-date">Feb 18</span>
            </div>
            <!-- cd-timeline-content -->
        </div>
        <!-- cd-timeline-block -->

        <div class="cd-timeline-block">
            <div class="cd-timeline-img cd-movie bounce-in">
                <img src="blogFace/images/cd-icon-movie.svg" alt="Movie">
            </div>
            <!-- cd-timeline-img -->

            <div class="cd-timeline-content bounce-in">
                <h2>标题</h2>
                <p>内容</p>
                <a href="#" class="cd-read-more">阅读更多</a>
                <span class="cd-date">Feb 26</span>
            </div>
            <!-- cd-timeline-content -->
        </div>
        <!-- cd-timeline-block -->
    </section>
    <!-- cd-timeline -->

</div>
<!-- container结束 -->

<script>
    $(function () {
        var $timeline_block = $('.cd-timeline-block');
        //hide timeline blocks which are outside the viewport
        $timeline_block.each(function () {
            if ($(this).offset().top > $(window).scrollTop() + $(window).height() * 0.75) {
                $(this).find('.cd-timeline-img, .cd-timeline-content').addClass('is-hidden');
            }
        });
        //on scolling, show/animate timeline blocks when enter the viewport
        $(window).on('scroll', function () {
            $timeline_block.each(function () {
                if ($(this).offset().top <= $(window).scrollTop() + $(window).height() * 0.75 && $(this).find('.cd-timeline-img').hasClass('is-hidden')) {
                    $(this).find('.cd-timeline-img, .cd-timeline-content').removeClass('is-hidden').addClass('bounce-in');
                }
            });
        });
    });
</script>

<button class="btn btn-success" style="position:fixed;bottom:100px;right:0px;">
    返回顶部
</button>

<!-- Scripts -->
<!--[if lte IE 8]><script src="assets/js/respond.min.js"></script><![endif]-->
<script>
    if ('addEventListener' in window) {
        window.addEventListener('load', function () { document.body.className = document.body.className.replace(/\bis-loading\b/, ''); });
        document.body.className += (navigator.userAgent.match(/(MSIE|rv:11\.0)/) ? ' is-ie' : '');
    }
</script>

</body>

</html>