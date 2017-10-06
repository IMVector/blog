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

    <!--ueditor必须-->
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/blogFace/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/blogFace/ueditor.all.min.js">
    </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/blogFace/lang/zh-cn/zh-cn.js"></script>

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
                <li><a href="${pageContext.request.contextPath}/blog_first.action">我的主页</a></li>
                <li><a href="${pageContext.request.contextPath}/time_timeLine.action">时间轴</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/blog_personal.action">个人中心<span
                        class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"> <s:property value="#session.user.nickName"></s:property></a></li>
                <li><a href="${pageContext.request.contextPath}/blog_exit.action">退出登录</a><li>
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
                <img src="<s:property value="#session.user.headImage"/>" alt="...">
                <div class="caption">
                    <h3><s:property value="#session.user.nickName"></s:property></h3>
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
                            <li class="list-group-item"><a
                                    href="${pageContext.request.contextPath}/blog_getBlogByID.action?bid=<s:property value='#blog1.bid'/>"><s:property
                                    value="#blog1.title"></s:property></a></li>
                        </s:iterator>

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
            <div class="panel panel-danger">
                <div class="panel-heading text-center">个人信息</div>
                <div class="row">
                    <div class="col-lg-6">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <div class="form-group">
                                    <span class="label label-default">用户名：</span>
                                    ${sessionScope.user.nickName}
                                </div>

                                <div class="form-group">
                                    <span class="label label-primary">邮箱：</span>
                                    ${sessionScope.user.email}
                                </div>

                                <div class="form-group">
                                    <span class="label label-success">密码：</span>
                                    <font style="font-weight: bold">......</font>
                                </div>

                                <div class="form-group">
                                    <span class="label label-info">性别：</span>
                                    ${sessionScope.user.gender}
                                </div>

                                <div class="form-group">
                                    <span class="label label-danger">介绍：</span>
                                    ${sessionScope.user.description}
                                </div>

                                <div class="form-group">
                                    <span class="label label-warning">我的头像：</span>
                                    <br><br>
                                    <div class="row">
                                        <div class="col-xs-6 col-md-5">
                                            <a href="#" class="thumbnail" id="imageHolder" >
                                                <img src="${sessionScope.user.headImage}"
                                                     style="max-height: 170px;max-width: 130px;" alt="图片被偷跑了">
                                            </a>
                                        </div>
                                    </div>
                                </div>

                            </li>
                            <li class="list-group-item"><input type="button" class="button col-md-offset-8"
                                                               value="修改信息"></li>
                        </ul>
                    </div>
                    <div class="col-md-6">

                        <ul class="list-group">
                            <li class="list-group-item">
                                <form action="blog_updateUser.action" method="post">

                                    <div class="form-group">
                                        <label for="nackName">用户名</label>
                                        <input type="text" class="form-control" id="nackName" name="nickName"
                                               placeholder="用户名">
                                    </div>
                                    <%--<div class="form-group">--%>
                                    <%--<label for="nackName">邮箱</label>--%>
                                    <%--<input type="email" class="form-control" id="email" name="email" placeholder="邮箱">--%>
                                    <%--</div>--%>
                                    <div class="form-group">
                                        <label for="password">密码</label>
                                        <input type="password" class="form-control" id="password" name="password"
                                               placeholder="密码">
                                    </div>
                                    <div class="form-group">
                                        <label for="gender">性别</label>
                                        <div class="select-wrapper">
                                            <select name="gender" id="gender">
                                                <option value="男">男</option>
                                                <option value="女">女</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="description">介绍</label>
                                        <input type="text" id="description" name="description">
                                    </div>
                                    <input type="text" id="headImage" name="headImage" style="display: none">
                                    <br>
                                    <br>
                                    <br>
                                    <br>
                                <button type="button" id="uploadHeadImage">图片上传</button>
                                <button type="submit" class="button">确认提交</button>
                            </form>
                            </li>

                        </ul>
                    </div>
                </div>

            </div>

        </div>
        <!-- 右边区域结束 -->


    </div>
    <!-- row结束 -->
</div>
<!-- container结束 -->
<script>
    $(document).ready(function () {
        $("#gender").val("${sessionScope.user.gender}");
    })
</script>
<!-- 加载编辑器的容器 -->
<textarea id="uploadEditor" style="display: none;"></textarea>

<!-- 使用ue -->
<script type="text/javascript">
    var myTimeImage = "";
    // 实例化编辑器，这里注意配置项隐藏编辑器并禁用默认的基础功能。
    var uploadEditor = UE.getEditor("uploadEditor", {
        isShow: false,
        focus: false,
        enableAutoSave: false,
        autoSyncData: false,
        autoFloatEnabled: false,
        wordCount: false,
        sourceEditor: null,
        scaleEnabled: true,
        toolbars: [["insertimage"]]
    });

    // 监听多图上传和上传附件组件的插入动作
    uploadEditor.ready(function () {
        uploadEditor.addListener("beforeInsertImage", _beforeInsertImage);
    });

    // 自定义按钮绑定触发多图上传和上传附件对话框事件
    document.getElementById('uploadHeadImage').onclick = function () {
        var dialog = uploadEditor.getDialog("insertimage");
        dialog.title = '头像上传';
        dialog.render();
        dialog.open();
    };


    // 多图上传动作
    function _beforeInsertImage(t, result) {
        var imageHtml = '';
        for (var i in result) {
            myTimeImage = result[i].src;
            $("#headImage").val(result[i].src);
            imageHtml = " <img src=" + result[i].src + " style=\"max-height: 170px;max-width: 140px;\" alt=\"图片被偷跑了\">";

        }
        document.getElementById('imageHolder').innerHTML = imageHtml;
        console.log(myTimeImage);
    }


</script>

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