<%--
  Created by IntelliJ IDEA.
  User: 25235
  Date: 2017/10/1
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>进入小窝</title>
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
        function submit() {
            document.getElementById("loginForm").submit();
        }
    </script>
</head>

<body class="is-loading">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Main -->
    <section id="main">
        <header>
            <span class="avatar"><img src="${pageContext.request.contextPath}/blogFace/images/avatar.jpg" alt="" /></span>
            <h1>用户名</h1>
            <p>一句话签名</p>
        </header>
        <!---->
        <hr />
        <!-- <h2>Extra Stuff!</h2> -->
        <form id="loginForm" method="post" action="blog_login">
            <div class="field">
                <input type="email" name="email" id="email" placeholder="邮箱" />
            </div>
            <div class="field">
                <input type="password" name="password" id="password" placeholder="密码" />
            </div>

            <ul class="actions">
                <li><a id="loginBtn" href="javascript:submit()" class="button">登录</a></li>
                <li><a href="${pageContext.request.contextPath}/regist.jsp" class="button">注册</a></li>
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
