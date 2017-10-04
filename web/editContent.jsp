<%@ taglib prefix="s" uri="/struts-tags" %>
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


    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/blogFace/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/blogFace/ueditor.all.min.js">

    </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/blogFace/lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        div {
            width: 100%;
        }
    </style>
</head>

<body class="is-loading">
<div class="container">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <p class="text-center"></p>
            <input type="text" id="title" style="font-weight:bold;color:#000000" placeholder="在此输入文章标题" />
            <br>
            <a class="btn btn-danger col-md-offset-9" href="${pageContext.request.contextPath}/blog_first.action">退出</a>
            <a class="btn btn-warning " href="">暂存</a>
            <a class="btn btn-info " href="javascript:getContent()">提交</a>
        </div>
        <form id="contentForm" action="${pageContext.request.contextPath}/Tblog_saveBlog.action" method="psot">
            <script id="editor" type="text/plain" style="height:600px;"></script>

            </form>
            </div>
            </div>


            <script type="text/javascript">
            //实例化编辑器
            //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
            var ue = UE.getEditor('editor');

            function isFocus(e) {
                alert(UE.getEditor('editor').isFocus());
                UE.dom.domUtils.preventDefault(e)
            }

            function setblur(e) {
                UE.getEditor('editor').blur();
                UE.dom.domUtils.preventDefault(e)
            }

            function insertHtml() {
                var value = prompt('插入html代码', '');
                UE.getEditor('editor').execCommand('insertHtml', value)
            }

            function createEditor() {
                enableBtn();
                UE.getEditor('editor');
            }

            function getAllHtml() {
                alert(UE.getEditor('editor').getAllHtml())
            }

            function getContent() {

                if (UE.getEditor('editor').hasContents()) {
                    var content = UE.getEditor('editor').getContent();
                    var title = $("#title").val();
                    //获取日期
                    var date = new Date();
                    var day = date.getDate();
                    var month = date.getMonth() + 1;
                    var year = date.getFullYear();
                    var hour = date.getHours();
                    var minute = date.getMinutes()
                    var publishDate = year + "/" + month + "/" + day + "/" + hour + "/" + minute;
                    //获取所有图像
                    var image = "";
                    //获取标题图像
                    var titleImage = image.slice(0, image.indexOf("()"));
                    //匹配img
                    var imgReg = /<img.*?(?:>|\/>)/gi;
                    //匹配src属性
                    var srcReg = /src=[\'\"]?([^\'\"]*)[\'\"]?/i;
                    var arr = content.match(imgReg);
                    if (arr != null) {
                        for (var i = 0; i < arr.length; i++) {
                            var src = arr[i].match(srcReg);
                            //获取图片地址
                            if (src[1]) {
                                image += src[1];
                                image += "()";
                                //console.log('已匹配的图片地址'+(i+1)+'：'+src[1]);
                            }

                        }
                    }
                    var act = "${pageContext.request.contextPath}/Tblog_saveBlog.action";
                    if(title == null || title == undefined || title == "") {
                    title="标题偷偷跑了";
                    }

                    <%--//el表达式获取session中的值--%>
                    <%--${sessionScope.user.id}--%>
                    <%--console.log( ${sessionScope.user.id})--%>
                    <%--alert( ${sessionScope.user.id});--%>
                    var str2 = "";
                    var str3 = "";
                    <%--//无图处理--%>
                    if (image !== null && image !== "" && image !== undefined) {
                    str2 =image;
                    str3 =titleImage;
                    } else {
                    str2 ="null";
                    str3 ="null";
                    }
                    //字符串拼接
                    var hideStr="|||||[{title="+title+"}{image="+str2+"}{titleImage="+str3+"}]|||||";
                    //向edit添加内容
                    UE.getEditor('editor').setContent(hideStr, true);
                    $("#contentForm").attr({ "action": act, "method": "post" });
                    $("#contentForm").submit();

                }//if
            }

            function getPlainTxt() {
                var arr = [];
                arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
                arr.push("内容为：");
                arr.push(UE.getEditor('editor').getPlainTxt());
                alert(arr.join('\n'))
            }

            function setContent(isAppendTo) {
                var arr = [];
                arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
                UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
                alert(arr.join("\n"));
            }

            function setDisabled() {
                UE.getEditor('editor').setDisabled('fullscreen');
                disableBtn("enable");
            }

            function setEnabled() {
                UE.getEditor('editor').setEnabled();
                enableBtn();
            }

            function getText() {
                //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
                var range = UE.getEditor('editor').selection.getRange();
                range.select();
                var txt = UE.getEditor('editor').selection.getText();
                alert(txt)
            }

            function getContentTxt() {
                var arr = [];
                arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
                arr.push("编辑器的纯文本内容为：");
                arr.push(UE.getEditor('editor').getContentTxt());
                alert(arr.join("\n"));
            }

            function hasContent() {
                var arr = [];
                arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
                arr.push("判断结果为：");
                arr.push(UE.getEditor('editor').hasContents());
                alert(arr.join("\n"));
            }

            function setFocus() {
                UE.getEditor('editor').focus();
            }

            function deleteEditor() {
                disableBtn();
                UE.getEditor('editor').destroy();
            }

            function disableBtn(str) {
                var div = document.getElementById('btns');
                var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
                for (var i = 0, btn; btn = btns[i++];) {
                    if (btn.id == str) {
                        UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
                    } else {
                        btn.setAttribute("disabled", "true");
                    }
                }
            }

            function enableBtn() {
                var div = document.getElementById('btns');
                var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
                for (var i = 0, btn; btn = btns[i++];) {
                    UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
                }
            }

            function getLocalData() {
                alert(UE.getEditor('editor').execCommand("getlocaldata"));
            }

            function clearLocalData() {
                UE.getEditor('editor').execCommand("clearlocaldata");
                alert("已清空草稿箱")
            }
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


