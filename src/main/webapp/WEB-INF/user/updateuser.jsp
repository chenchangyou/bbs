<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp"%>
<html>
<head>
    <title>${loginUser.username}修改资料</title>
    <meta http-equiv="Access-Control-Allow-Origin" content="*" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<%--引入样式--%>
    <%@include file="../../common/javascript.jsp"%>
</head>
<body style="padding: 20px;">
    <form class="layui-form" action="">
        <input type="hidden" value="${user.id}" name="uid">
        <div class="layui-form-item">
            <label class="layui-form-label">账户名</label>
            <div class="layui-input-block">
                <input value="${user.username}" type="text" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">昵称</label>
            <div class="layui-input-block">
                <input value="${user.nickname}" type="text" name="nickname" required  lay-verify="required" placeholder="请输入昵称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-block">
                <input value="${user.tel}" type="text" name="tel" required  lay-verify="phone" placeholder="请输入手机号码" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input value="${user.email}" type="text" name="email" required  lay-verify="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年龄</label>
            <div class="layui-input-block">
                <input value="${user.age}" type="text" name="age" required  lay-verify="number" placeholder="请输入年龄" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" <c:if test="${user.sex == '男'}">checked</c:if>>
                <input type="radio" name="sex" value="女" title="女" <c:if test="${user.sex == '女'}">checked</c:if> >
                <input type="radio" name="sex" value="保密" title="保密"  <c:if test="${user.sex == '保密'}">checked</c:if>>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">简介</label>
            <div class="layui-input-block">
                <textarea name="synopsis" placeholder="请输入内容" class="layui-textarea">${user.synopsis}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="text-align: right">
                <button class="layui-btn" type="button" id="close1">取消</button>
                <button class="layui-btn" lay-submit lay- lay-filter="formDemo">立即提交</button>
            </div>
        </div>
    </form>
<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>
<script>
    //Demo
    var index = parent.layer.getFrameIndex(window.name);
    layui.use('form', function(){
        var form = layui.form;
        //监听提交
        form.on('submit(formDemo)', function(data){
            $.post("/user/update",data.field,function (data) {
                if(data > 0){
                    parent.layer.msg('修改成功！', {
                         icon: 1,
                         time: 1000 //2秒关闭（如果不配置，默认是3秒）
                     },function () {
                        parent.layer.close(index);
                        parent.location.reload();
                    });
                 }else {
                     parent.layer.msg('修改失败！',
                         {
                             icon:2,
                             time:1200
                         });
                 }
            });
            return false;
        });

        $("#close1").click(function () {
            parent.layer.close(index);
        })
    });
</script>
</body>
</html>
