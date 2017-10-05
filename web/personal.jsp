<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 25235
  Date: 2017/10/1
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>我的小窝</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogFace/assets/css/main.css" />
    <noscript>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/blogFace/assets/css/noscript.css" />
    </noscript>
    <!-- 顺序不能变 -->
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/jquery1.12.4.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogFace/assets/css/bootstrap3.3.7.min.css">
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/jquery2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/bootstrap3.3.7.min.js"></script>

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
                <li><a href="${pageContext.request.contextPath}/blog_first.action">主页</a></li>
                <li><a href="${pageContext.request.contextPath}/time_timeLine.action">时间轴</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/blog_personal.action">个人中心<span class="sr-only">(current)</span></a></li>
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

    <div class="row">

        <!-- 左边区域 -->
        <div class="col-md-3">
            <!-- 252*366 -->
            <!--博客头像个人介绍  -->
            <div class="thumbnail">
                <img src="<s:property value="#session.user.headImage"/>" alt="...">
                <div class="caption">
                    <h3>  <s:property value="#session.user.nickName"></s:property></h3>
                    <p><s:if test="#session.user.description!=null">
                        <s:property value="#session.user.description"></s:property>
                    </s:if><s:else>
                        介绍下自己吧
                    </s:else></p>
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
                        <%--<li class="list-group-item">内容1</li>--%>
                        <%--<li class="list-group-item">内容2</li>--%>
                        <%--<li class="list-group-item">内容3</li>--%>
                        <%--<li class="list-group-item">内容4</li>--%>
                        <%--<li class="list-group-item">内容5</li>--%>
                        <li class="list-group-item">
                            <nav aria-label="Page navigation">
                                <ul class="pagination pagination-sm">
                                    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
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
        <div class="col-md-9" style="background:white;border-radius:6px;">
            <form style="padding-top:5px;">
                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>
                <div class="form-group">
                    <label for="exampleInputFile">File input</label>
                    <input type="file" id="exampleInputFile">
                    <p class="help-block">Example block-level help text here.</p>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>
                <button type="submit" class="button">Submit</button>
            </form>
            <div class="form-group has-success has-feedback">
                <label class="control-label" for="inputSuccess2">Input with success</label>
                <input type="text" class="form-control" id="inputSuccess2" aria-describedby="inputSuccess2Status">
                <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                <span id="inputSuccess2Status" class="sr-only">(success)</span>
            </div>
            <div class="form-group has-warning has-feedback">
                <label class="control-label" for="inputWarning2">Input with warning</label>
                <input type="text" class="form-control" id="inputWarning2" aria-describedby="inputWarning2Status">
                <span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>
                <span id="inputWarning2Status" class="sr-only">(warning)</span>
            </div>
            <div class="form-group has-error has-feedback">
                <label class="control-label" for="inputError2">Input with error</label>
                <input type="text" class="form-control" id="inputError2" aria-describedby="inputError2Status">
                <span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>
                <span id="inputError2Status" class="sr-only">(error)</span>
            </div>
            <div class="form-group has-success has-feedback">
                <label class="control-label" for="inputGroupSuccess1">Input group with success</label>
                <div class="input-group">
                    <span class="input-group-addon">@</span>
                    <input type="text" class="form-control" id="inputGroupSuccess1" aria-describedby="inputGroupSuccess1Status">
                </div>
                <span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>
                <span id="inputGroupSuccess1Status" class="sr-only">(success)</span>
            </div>

        </div>
        <!-- 右边区域结束 -->


    </div>
    <!-- row结束 -->
</div>
<!-- container结束 -->


<button class="btn btn-success" style="position:fixed;bottom:100px;right:0px;">
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
<!--[if lte IE 8]><script src="${pageContext.request.contextPath}/blogFace/assets/js/respond.min.js"></script><![endif]-->
<script>
    if ('addEventListener' in window) {
        window.addEventListener('load', function () { document.body.className = document.body.className.replace(/\bis-loading\b/, ''); });
        document.body.className += (navigator.userAgent.match(/(MSIE|rv:11\.0)/) ? ' is-ie' : '');
    }
</script>

</body>

</html>