
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML>

<html>

<head>
    <title>开辟小窝</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="${pageContext.request.contextPath}/blogFace/assets/js/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/blogFace/assets/css/main.css" />
    <!--[if lte IE 9]><link rel="stylesheet" href="${pageContext.request.contextPath}/blogFace/assets/css/ie9.css" /><![endif]-->
    <!--[if lte IE 8]><link rel="stylesheet" href="${pageContext.request.contextPath}/blogFace/assets/css/ie8.css" /><![endif]-->
    <noscript>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/blogFace/assets/css/noscript.css" />
    </noscript>
    <script src="${pageContext.request.contextPath}/blogFace/assets/js/jquery-1.8.3.min.js"></script>

    <script>
        $(function () {
            $("#nickName")
                .blur(
                    function () {
                        //获取用户名的值
                        var nickName = $("#nickName").val();

                        if (nickName.length > 0) {
                            $
                                .post(
                                    "${pageContext.request.contextPath}/blog_checklogonName.action",
                                    {
                                        'nickName': nickName
                                    },
                                    function (data) {
                                        //接收后台传过来的值，进行判断
                                        if (1 == data) {
                                            $("#span1")
                                                .html(
                                                    "<font color='green'>用户名可以使用！</font>");
                                            $("#registBtn").show();
                                        } else if (2 == data) {
                                            $("#span1")
                                                .html(
                                                    "<font color='red'>用户名已经存在！</font>");
                                            $("#registBtn").hide();
                                        }

                                    });
                        }
                    });
        });
        function submit() {
            document.getElementById("registForm").submit();
        }
    </script>
</head>

<body class="is-loading">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <section id="main">

        <h2>开辟小窝</h2>
        <form id="registForm" method="get" action="blog_regist">
            <div class="field">
                <input type="text" name="nickName" id="nickName" placeholder="用户名" />
                <span id="span1"></span>
            </div>
            <div class="field">
                <input type="email" name="email" id="email" placeholder="邮箱" />
            </div>
            <div class="field">
                <input type="password" name="password" id="password" placeholder="密码" />
            </div>
            <div class="field">
                <div class="select-wrapper">
                    <select name="department" id="department">
                        <optgroup label="性别"></optgroup>>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
            </div>
            <div class="field">
                <textarea name="message" id="message" placeholder="介绍下自己吧" rows="4"></textarea>
            </div>

            <ul class="actions">
                <li><a id="registBtn" href="javascript:submit()" class="button">注册</a></li>
                <li><a href="${pageContext.request.contextPath}/login.jsp" class="button">取消</a></li>
            </ul>
        </form>
        <hr />
        <!-- -->
        <footer>
            <ul class="icons">
                <li><a href="#" class="fa-twitter">Twitter</a></li>
                <li><a href="#" class="fa-instagram">Instagram</a></li>
                <li><a href="#" class="fa-facebook">Facebook</a></li>
            </ul>
        </footer>
    </section>

    <!-- Footer -->
    <footer id="footer">
        <ul class="copyright">
            <li>&copy; Jane Doe</li>
            <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
        </ul>
    </footer>

</div>

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
