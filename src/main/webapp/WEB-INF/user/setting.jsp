<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<html>
<head>
    <title>${loginUser.username}的个人中心</title>
    <meta http-equiv="Access-Control-Allow-Origin" content="*"/>
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${ctx}/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <%--引入样式--%>
    <%@include file="userstyle.jsp" %>
</head>
<body>
<%--引入导航栏--%>
<%@include file="../../common/head.jsp" %>
<div style="width: 1160px;padding:0px 10px;margin: 0 auto">
    <%--引入背景--%>
    <%@include file="user_bg.jsp"%>
    <div style=" width: 100%;margin:10px auto;">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-nav" style="background-color: #FFFFFF;color: black">
                <li class="layui-nav-item <%--layui-this--%>"><a href="/user/index"><i class="fa fa-home fa-1x"
                                                                                       style="color: purple"></i>
                    主页 </a></li>
                <li class="layui-nav-item "><a href="/user/post/list?uid=${loginUser.id}"><i
                        class="fa fa-pencil-square-o fa-1x"
                        style="color: #04bdff"></i> 帖子（999+）</a>
                </li>
                <li class="layui-nav-item "><a href="/user/followed?uid=${loginUser.id}"><i
                        class="fa fa-user-plus fa-1x"></i> 关注（20）</a></li>
                <li class="layui-nav-item"><a href="/user/collection?uid=${loginUser.id}"><i class="fa fa-star fa-1x"
                                                                                             style="color: orange"></i>
                    收藏（99+）</a>
                </li>
                <li class="layui-nav-item"><a href="/user/fans?uid=${loginUser.id}"><i class="fa fa-heart fa-1x"
                                                                                       style="color: #eeb4c3"></i>
                    粉丝（7800万+）</a></li>
                <li class="layui-nav-item  layui-this"><a href="/user/setting?uid=${user.id}"><i
                        class="fa fa fa-cog fa-spin fa-1x" style="color: #041527"></i>
                    设置</a></li>

            </ul>
        </div>
    </div>

    <div style="width: 100%;" class="layui-form">
        <%--<div></div>--%>
        <table style="width: 300px;float: left" class="layui-table" lay-skin="row" lay-size="lg">
            <colgroup>
                <col width="150">
                <col width="120">
                <col>
            </colgroup>
            <h5>隐私设置</h5>
            <tbody>
            <tr>
                <td>我的收藏</td>
                <td><input type="checkbox" name="xxx" lay-skin="switch" lay-text="公开|隐藏" checked></td>
            </tr>
            <tr>
                <td>我的关注</td>
                <td><input type="checkbox" name="xxx" lay-skin="switch" lay-text="公开|隐藏"></td>
            </tr>
            <tr>
                <td>我的粉丝</td>
                <td><input type="checkbox" name="xxx" lay-skin="switch" lay-text="公开|隐藏"></td>
            </tr>
            <tr>
                <td>性别</td>
                <td><input type="checkbox" name="xxx" lay-skin="switch" lay-text="公开|隐藏"></td>
            </tr>
            <tr>
                <td>个人资料</td>
                <td><input type="checkbox" name="xxx" lay-skin="switch" lay-text="公开|隐藏"></td>
            </tr>
            </tbody>
        </table>
        <div style="float: left;margin-left: 20px;margin-top: 12px;width: 50%;">
            <blockquote style="padding: 6px;font-size: 16px" class="layui-elem-quote">更改密码</blockquote>
            <form class="layui-form" method="post">
                <input name="uid" value="${user.id}" type="hidden">
                <div class="layui-form-item">
                    <label class="layui-form-label">原密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" required lay-verify="required" placeholder="请输入原密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">新密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="newPassword" required lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="updatepassword">确认更改</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
    </div>

</div>


<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>
<script>
    $(function () {
        var upload = layui.upload;
        $(".bg-setting").click(function () {

            layer.open({
                type: 1,
                skin: 'layui-layer-rim', //加上边框
                area: ['420px', '240px'], //宽高
                content: '<div class="layui-upload">' +
                    '  <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>' +
                    '  <button type="button" class="layui-btn" id="test9">开始上传</button>' +
                    '</div>'
            });
            upload.render({
                elem: '#test8'
                , url: '/upload/updatebg/'
                , auto: false
                //,multiple: true
                , bindAction: '#test9'
                , done: function (data) {

                    if (data.state === 1) {
                        $(".bg-top").css("background", "url(/" + data.data.src + ") no-repeat 0 0");
                        layer.closeAll('page');
                    } else if (data.state === 0) {
                        layer.msg("系通出错！更换失败", { //layui弹出层提示
                            offset: '150'
                        });
                    } else if (data.state === 2) {
                        layer.msg("请您先登录", {
                            offset: '150',
                            time: 800
                        }, function () {
                            $('#denglu').trigger("click");
                        });
                    }
                }
            });
        });
        $("#replacehead").click(function () {
            layer.open({
                type: 1,
                skin: 'layui-layer-rim', //加上边框
                area: ['420px', '240px'], //宽高
                content: '<div class="layui-upload">' +
                    '  <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>' +
                    '  <button type="button" class="layui-btn" id="test9">开始上传</button>' +
                    '</div>'
            });
            upload.render({
                elem: '#test8'
                , url: '/user/uploadThumbnail/'
                , auto: false
                //,multiple: true
                , bindAction: '#test9'
                , done: function (data) {

                    if (data.state === 1) {
                        $("#replacehead").css({
                            "background": "url(/" + data.data.src + ")",
                            "background-size": "100% 100%"
                        });
                        layer.closeAll('page');
                    } else if (data.state === 0) {
                        layer.msg("系通出错！更换失败", { //layui弹出层提示
                            offset: '150'
                        });
                    } else if (data.state === 2) {
                        layer.msg("请您先登录", {
                            offset: '150',
                            time: 800
                        }, function () {
                            $('#denglu').trigger("click");
                        });
                    }
                }
            });

        });
    });
    layui.use('form', function(){
        var form = layui.form;
        //监听提交
        form.on('submit(updatepassword)', function(data){
            $.post("/user/updatepassword",data.field,function (data) {
                if(data === 1){
                    layer.msg("修改成功",{
                        icon:1,
                        time:800
                    },function () {
                        window.location.reload();
                    })
                }else if(data === 2){
                    layer.msg("修改失败！系统出错",{
                        icon:2
                    })
                }else  if(data === 0){
                    layer.msg("您输入的原密码不正确，请重新输入",{
                        icon:2
                    })
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
