<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp"%>
<html>
<head>
    <title>会员注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <%@include file="../common/javascript.jsp"%>
    <style>
        #tel_btn{
            margin-top: 3px;
            margin-left: 22%;
        }

    </style>
</head>
<body>
<%@include file="../common/head.jsp"%>
<div id="forms" style="width: 380px;margin: 125px auto;padding:10px 20px;background-color:rgba(240, 242, 242, 0.82);box-shadow: 2px 2px 2px #888888;">
<form class="layui-form" >
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
        <div class="layui-form-item">
            <label class="layui-form-label">年龄</label>
            <div class="layui-input-inline">
                <input type="text" name="age"  autocapitalize="off" required  lay-verify="number" placeholder="请输入您的年龄" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-inline">
                <input type="text" name="email" lay-filter="emailve" lay-verify="email" autocomplete="off" class="layui-input" placeholder="请输入邮箱">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">验证码</label>
            <div class="layui-input-inline">
                <input type="text" name="validCode" placeholder="请输入验证码" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><button  type="button" lay-submit lay-filter="emailve"  class="layui-btn" id="tel_btn" style="height: 43px">获取验证码</button></div>
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


    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-filter="formDemo" lay-submit type="submit">立即注册</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</div>
<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;
        //监听提交
        form.on('submit(formDemo)', function(data){
            // layer.msg(JSON.stringify(data.field));
            var data = data.field;
            $.post("/user/register",data,function (data) {
                if(data.ok){
                    window.location.href = "/user/success";
                }else {
                    layer.msg(data.error,{icon:5,anim:6,time:1000})
                }
            });
            return false;
        });

        form.on('submit(emailve)',function (data) {
            // layer.msg(JSON.stringify(data.field));
            var username = data.field.username;
            var email = data.field.email;
            var index;
            var btn = $("#tel_btn");
            var countdown = 60;//定义秒数
            $.ajax({
                url: '/sendEmail',
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
                    if(state === 2){
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
                        layer.msg('发送失败请检查邮箱是否正确');
                    }
                },
                error:function(){
                    layer.msg('系统出错，发送失败',{
                        icon:2
                    });
                }
            });
            $("#load").remove();
            return false;
        })
    });
    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //……
        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
        form.render();
    });


</script>
</body>
</html>
