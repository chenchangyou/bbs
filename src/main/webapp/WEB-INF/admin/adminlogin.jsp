<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@include file="../../common/taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>友人论坛</title>
    <link href="${ctx}/static/resources/css/style.css" rel="stylesheet">
    <link href="${ctx}/static/resources/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/resources/css/admin.css" rel="stylesheet">
    <link href="${ctx}/static/resources/css/pro.css" rel="stylesheet">
    <link href="${ctx}/static/resources/css/login.css" rel="stylesheet">
    <script src="${ctx}/static/resources/js/jquery.min.js" type="text/javascript"></script>

    <style type="text/css">
    </style>
</head>
<body>
<div class="container-fluid">
    <form id="loginForm">
        <div class="layadmin-user-login layadmin-user-display-show"
             style="padding-bottom:0px;padding-top:50px;height:250px;"
             id="LAY-user-login">
            <div class="layadmin-user-login-main" style="height:200px;">
                <div class="layadmin-user-login-box layadmin-user-login-header">
                    <h2>管理员登陆</h2>
                </div>
                <div
                        class="layadmin-user-login-box layadmin-user-login-body layui-form" style="height:100px;">
                    <div class="layui-form-item">
                        <label
                                class="layadmin-user-login-icon layui-icon layui-icon-username"
                                for="LAY-user-login-username"></label> <input type="text"
                                                                              name="adname"
                                                                              lay-verify="required" placeholder="用户名"
                                                                              class="layui-input layui-form-danger">
                    </div>
                    <div class="layui-form-item">
                        <label
                                class="layadmin-user-login-icon layui-icon layui-icon-password"
                                for="LAY-user-login-password"></label> <input type="password"
                                                                              name="password" id="userPass"
                                                                              lay-verify="required" placeholder="密码"
                                                                              class="layui-input">
                    </div>
                    <%--<div class="layui-form-item" style="height:50px;">
                        <input type="checkbox" name="remember" lay-skin="primary"
                               title="记住密码">
                        <div class="layui-unselect layui-form-checkbox" lay-skin="primary">
                            <span>记住密码</span><i class="layui-icon layui-icon-ok"></i>
                        </div>
                        <a lay-href="/user/forget"
                           class="layadmin-user-jump-change layadmin-link"
                           style="margin-top: 7px;">忘记密码？</a>
                    </div>--%>
                    <div class="layui-form-item">
                        <button class="layui-btn layui-btn-fluid" type="button" lay-submit=""
                                lay-filter="loginSubmit">登 入
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<!--尾部-->
<script src="${ctx}/static/resources/js/layui.js" type="text/javascript"></script>
<script type="text/javascript">
    layui.use(['form', 'layer'], function () {
        var form = layui.form;
        var layer = layui.layer;
        form.on('submit(loginSubmit)', function () {
            $.ajax({
                type: "post",
                url: "/admin/login",
                data: $("#loginForm").serialize(),
                success: function (data) {
                    if (data.ok) {
                        layer.msg("登陆成功！", {icon: 1, anim: 5, time: 2000}, function () {
                            window.location.href = "/admin/indexs";
                        });
                    } else {
                        layer.msg("登陆失败！请检查用户名和密码后重试！", {icon: 5, anim: 6, time: 3000});
                    }
                }
            });
        });
    });
</script>
</body>
</html>
