<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>找回密码</title>
    <link href="/static/resources/css/style.css" rel="stylesheet">
    <link href="/static/resources/css/layui.css" rel="stylesheet">
    <link href="/static/resources/css/admin.css" rel="stylesheet">
    <link href="/static/resources/css/pro.css" rel="stylesheet">
    <link href="/static/resources/css/login.css" rel="stylesheet">
    <script src="/static/resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="/static/resources/js/layui.js" type="text/javascript"></script>
    <style type="text/css">
    </style>
</head>
<body>
<!--导航栏部分-->


<!-- 中间内容 -->
<div class="layui-container">
<div class="container-fluid layui-row">
    <form class="layui-form" id="loginForm">
        <div class="layadmin-user-login layadmin-user-display-show" style="padding-bottom:0px;padding-top:50px;height:250px;"
             id="LAY-user-login">
            <div class="layadmin-user-login-main" style="height:200px;">
                <div class="layadmin-user-login-box layadmin-user-login-header">
                    <h2>密码找回</h2>
                </div>
                <div
                        class="layadmin-user-login-box layadmin-user-login-body layui-form" style="height:100px;">
                    <div class="layui-form-item">
                        <label
                                class="layadmin-user-login-icon layui-icon layui-icon-username"
                                for="LAY-user-login-username"></label> <input type="text"
                                                                              name="username" id="userName"
                                                                              lay-verify="required" placeholder="请输入用户名"
                                                                              class="layui-input layui-form-danger">
                    </div>
                    <div class="layui-form-item">
                        <label
                                class="layadmin-user-login-icon layui-icon layui-icon-website"
                                for="LAY-user-login-password"></label> <input type="text"
                                                                              name="email" id="userPass"
                                                                              lay-verify="email" placeholder="请输入邮箱" class="layui-input">
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-inline">
                            <input type="text" name="validCode" placeholder="请输入验证码" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux" style="padding: 0px 0 !important;">
                            <button  type="button" lay-submit lay-filter="emailve"  class="layui-btn" id="tel_btn" style="height: 39px">获取验证码</button>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label
                                class="layadmin-user-login-icon layui-icon layui-icon-password"
                                for="LAY-user-login-password"></label> <input type="password"
                                                                              name="newPassword" id=""
                                                                              lay-verify="password" placeholder="请输新的密码" class="layui-input">
                    </div>
                    <div class="layui-form-item">
                        <button class="layui-btn layui-btn-fluid" type="button" lay-submit=""
                                lay-filter="loginSubmit">重置密码</button>
                    </div>

                </div>
            </div>
        </div>
    </form>
</div>
</div>
<!--尾部-->

<script type="text/javascript">
    layui.use(['form','layer'], function() {
        var form = layui.form;
        var layer=layui.layer;
        form.on('submit(loginSubmit)',function(){
            $.ajax({
                type:"post",
                url:"/user/reset/",
                data:$("#loginForm").serialize(),
                success:function(data){
                    if(data.ok){
                        layer.msg("密码重置成功！正在跳回首页",{icon:1,anim:2,time:1600},function(){
                            window.location.href="/home";
                        });
                    }else{
                        layer.msg(data.error,
                            {icon:5,anim:6,time:2000});
                    }
                }
            });
        });

        form.on('submit(emailve)',function (data) {
            // layer.msg(JSON.stringify(data.field));
            var username = data.field.username;
            var email = data.field.email;
            var index;
            var btn = $("#tel_btn");
            var countdown = 60;//定义秒数
            $.ajax({
                url: '/resetSendEmail',
                data: {
                    toEmail:email,
                    username:username
                },
                type: 'post',
                dataType: 'json',
                beforeSend: function () {
                    index = layer.load(1, {
                        shade: [0.1,'#fff'] //0.1透明度的白色背景
                    });
                },
                success:function(state){
                    if(state.ok){
                        layer.close(index);
                        layer.msg('发送成功，请注意查收',{
                            icon:1,
                            time:1200
                        },function settime() {
                            if (countdown == 0) {
                                btn.attr("disabled", false);
                                btn.html("获取验证码");
                                btn.removeClass("disabled");
                                countdown = 5;
                                return;
                            } else {
                                btn.addClass("disabled");
                                btn.attr("disabled", true);
                                btn.html("重新发送(" + countdown + ")");
                                countdown--;
                            }
                            setTimeout(settime, 1000);
                        });
                    }else {
                        layer.close(index);
                        layer.msg(state.error,{

                        });
                    }
                },
                error:function(){
                    layer.close(index);
                    layer.msg('系统出错，发送失败',{
                        icon:2
                    });
                }
            });

            return false;
        })

    });
</script>
</body>
</html>