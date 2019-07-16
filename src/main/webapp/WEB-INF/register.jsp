<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp"%>
<html>
<head>
    <title>会员注册</title>
    <%@include file="../common/style.jsp"%>
</head>
<body>
<%@include file="../common/head.jsp"%>
<div style="width: 380px;margin: 125px auto;padding:10px 20px;background-color:rgba(240, 242, 242, 0.82);box-shadow: 2px 2px 2px #888888;">
<form class="layui-form" action="${ctx}/user/register" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" required  lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
        <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input type="tel" name="tel" lay-verify="required|phone" autocomplete="off" class="layui-input"  placeholder="请输入手机号">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-inline">
                <input type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input" placeholder="请输入邮箱">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">年龄</label>
        <div class="layui-input-inline">
            <input type="text" name="age"  autocapitalize="off" required  lay-verify="number" placeholder="请输入您的年龄" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男" checked="">
            <input type="radio" name="sex" value="女" title="女">
            <input type="radio" name="sex" value="保密" title="保密">
        </div>
    </div>

    <button type="button" class="ui_btn ui_org_btn" id="tel_btn"
            style="height: 43px">获取验证码</button>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit type="submit">立即注册</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</div>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;
        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //……
        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
        form.render();
    });

    $(function() {

        var btn = $("#tel_btn");
        $(function() {
            btn.click(settime);
        });
        var countdown = 5;//倒计时总时间，为了演示效果，设为5秒，一般都是60s
        function settime() {
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
        }
    })
</script>
</body>
</html>
