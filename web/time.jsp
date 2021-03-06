<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>我的时间轴</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="blogFace/assets/css/main.css"/>
    <noscript>
        <link rel="stylesheet" href="blogFace/assets/css/noscript.css"/>
    </noscript>
    <!-- 顺序不能变 -->
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/jquery1.12.4.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogFace/assets/css/bootstrap3.3.7.min.css">
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/jquery2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/bootstrap3.3.7.min.js"></script>
    <!-- 时间轴特殊 -->
    <link href="${pageContext.request.contextPath}/blogFace/assets/css/timeline.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/blogFace/assets/js/modernizr.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/blogFace/assets/js/jquery-1.8.3.min.js"></script>
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
                <li><a href="${pageContext.request.contextPath}/public_getAllBlogs.action">主页 </a></li>
                <li><a href="${pageContext.request.contextPath}/blog_first.action">我的主页 </a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/time_timeLine.action">时间轴 <span
                        class="sr-only">(current)</span></a></li>
                <li><a href="${pageContext.request.contextPath}/blog_personal.action">个人中心</a></li>
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

    <section id="cd-timeline" class="cd-container">
        <div class="cd-timeline-block">
            <div class="cd-timeline-img cd-picture">
                <img src="blogFace/images/cd-icon-picture.svg" alt="Picture">
            </div>
            <!-- cd-timeline-img -->

            <div class="cd-timeline-content">
                <h1>新建足迹</h1>
                <textarea id="content" style="height:100px;"></textarea>
                <ul></ul>
                <button type="button" id="j_upload_img_btn">图片上传</button>
                <button onclick="formSubmit()">发送</button>
                <ul></ul>
                <div id="upload_img_wrap" class="row">
                </div>
            </div>
            <!-- cd-timeline-content -->
        </div>
        <!-- cd-timeline-block -->

        <!-- cd-timeline-block -->
        <c:forEach items="${timeLine}" var="currentTimeLine">
        <div class="cd-timeline-block">
            <div class="cd-timeline-img cd-picture bounce-in">
                <img src="blogFace/images/cd-icon-picture.svg" alt="Picture">
            </div>
            <!-- cd-timeline-img -->

            <div class="cd-timeline-content bounce-in">
                <h2>标题</h2>
                <div class="row">
                    <c:forEach items="${currentTimeLine.limageList}" var="image">
                    <div class="col-xs-6 col-md-4">
                        <a href="#" class="thumbnail">
                            <img src="${image}" style="max-height: 150px"
                                 alt="图片不见了">
                        </a>
                    </div>
                    </c:forEach>
                </div>
                <%--<p>内容</p>--%>
                ${currentTimeLine.lcontent}
                <%--<a href="#" class="cd-read-more">阅读更多</a>--%>
                <span class="cd-date">${currentTimeLine.lpublishDate}</span>
            </div>
            <!-- cd-timeline-content -->
        </div>
        <!-- cd-timeline-block -->
        </c:forEach>

        <!-- cd-timeline-block -->
    </section>
    <!-- cd-timeline -->
    <form id="myform" action="${pageContext.request.contextPath}/time_saveTimeLine.action" method="get"
          style="display: none">
        <textarea id="formContent" name="lcontent"></textarea>
        <textarea id="formImage" name="limage"></textarea>
    </form>
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
    document.getElementById('j_upload_img_btn').onclick = function () {
        var dialog = uploadEditor.getDialog("insertimage");
        dialog.title = '多图上传';
        dialog.render();
        dialog.open();
    };


    // 多图上传动作
    function _beforeInsertImage(t, result) {
        var imageHtml = '';
        for (var i in result) {
//            imageHtml += '<li><img src="'+result[i].src+'" alt="'+result[i].alt+'" height="150"></li>';
            imageHtml += "<div class='col-xs-6 col-md-4'> <a href='#' class='thumbnail'> <img style='max-height: 145px;max-width: 110px;' src=" + result[i].src + " alt=" + result[i].alt + "/> </a></div>";
            myTimeImage += result[i].src;
            myTimeImage += "()";
            <!--110*150-->
            <%--<ul id="upload_img_wrap"></ul>--%>
        }
        document.getElementById('upload_img_wrap').innerHTML += imageHtml;
        console.log(myTimeImage);
    }

    function formSubmit() {
        var contetn = $("#content").val();
        $("#formContent").val(contetn);
        $("#formImage").val(myTimeImage);
        $("#myform").submit();
    }


</script>
<!--图片预加载-->
<script>
    $(document).ready(function () {
        $("img").each(function () {
            var image = new Image();
            image.src = $(this).attr("src");
//                console.log(image.src);
        });

    })
</script>
<!-- Scripts -->
<!--[if lte IE 8]>
<script src="assets/js/respond.min.js"></script><![endif]-->
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