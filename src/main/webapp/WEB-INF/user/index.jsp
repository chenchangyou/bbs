<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp"%>
<html>
<head>
    <title>${loginUser.username}的个人中心</title>
    <meta http-equiv="Access-Control-Allow-Origin" content="*" />
<%--引入样式--%>
    <%@include file="../../common/style.jsp"%>
</head>
<body>
<%--引入导航栏--%>
<%@include file="../../common/head.jsp"%>

<div style="height: 650px; width: 1160px;margin:80px auto;padding:10px 10px;background-color:#FFFFFF;box-shadow: 2px 2px 2px #888888;">
    <ol class="breadcrumb">
        <li>首页</li>
        <li class="active">个人中心</li>
    </ol>

<div style="width: 100%">

    <div style="width:200px;height: 630px;float: left">
        <%-- 引入菜单 --%>
      <%@include file="usermenu.jsp"%>

    </div>
    <div style="width:900px;height: 630px;padding: 15px;float: right">

        <div style="width: 100%;padding: 15px 10px"><h3 style="font-weight: bolder">个人资料</h3></div>
        <hr style="color:#888888;height: 1px ">
        <div style="width: 100%;height: 560px">
            <div style="width: 150px;height: 560px;float: left;text-align: center">
                <img src="${ctx}/${user.headshot}" alt="..." class="img-circle" width="100" height="100">
                <p style="text-align: center;width: 100%"><a href="javascript:;" id="updateThumbnail" style="color: #1E9FFF;"> 修改头像 </a></p>

                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="test1">上传图片</button>
                    <button type="button" class="layui-btn" id="testListAction">上传图片</button>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="demo1">
                        <p id="demoText"></p>
                    </div>
                </div>

            </div>
            <div style="width: 700px;height: 560px;float: right">
                <div style="width: 100%;height: 80px;padding: 2px 10px">
                    <div style="width: 100%;height: 30px">
                        <span style="line-height: 30px ;width: 100px;float: left">ID ：${user.id}</span>
                        <a style="line-height: 30px ;width: 80px;padding: 0 3px;float: right;color: #1E9FFF" href="">个人主页>></a>
                    </div>
                    <div style="width: 100%;height: 30px;margin-top: 10px">
                        <span style="margin-left: 10px;text-align: center;line-height: 30px;">关注 99</span>
                        <span style="margin-left: 10px;text-align: center;line-height: 30px;">粉丝 888万</span>
                        <span style="margin-left: 10px;text-align: center;line-height: 30px;">等级 99+</span>
                    </div>
                </div>
                <hr style="color:#888888;height: 1px ">
                <div style="width: 100%;height: 470px;font-size: 16px">
                    <div style="width: 100%;height: 30px">
                        <span style="line-height: 30px ;width: 100px;float: left">昵称：${user.username}</span>
                        <a style="line-height: 30px ;width: 100px;padding: 0 3px;float: right;color: #1E9FFF" href="">修改资料>></a>
                    </div>
                    <div>性别：${user.sex}</div>
                    <div>年龄：${user.age}</div>
                    <%--<div>联系电话：${user.tel}</div>--%>
                    <div>邮箱：${user.email}</div>
                    <div>注册时间：<fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd"/></div>
                </div>

            </div>
        </div>

    </div>

</div>

</div>

<script>
    $(function () {
        $("#updateThumbnail").click(function () {

            layer.confirm('<button type="button" class="layui-btn" id="test3">\n' +
                '  <i class="layui-icon">&#xe67c;</i>上传图片\n' +
                '</button>', {
                btn: ['保存','关闭'] //按钮
            }, function() {
                layer.msg('保存成功', {icon: 1});
            });
            layui.use('upload', function(){
                var $ = layui.jquery
                    ,upload = layui.upload;
                //普通图片上传
                var uploadInst = upload.render({
                    elem: '#test3'
                    ,url: '/user/uploadThumbnail/'
                    ,auto: false
                    // ,method:'get'//默认post
                    ,bindAction: '#testListAction'
                    ,choose: function(obj){
                        //预读本地文件示例，不支持ie8
                        obj.preview(function(index, file, result){
                            $('#demo1').attr('src', result); //图片链接（base64）
                        });
                    }
                    ,done: function(res){
                        //如果上传失败
                        if(res.code > 0){
                            return layer.msg('上传失败');
                        }/*else {
                            $.post("",{},function (data) {
                                
                            })
                        }*/
                        //上传成功
                    }
                    ,error: function(){
                        //演示失败状态，并实现重传
                        var demoText = $('#demoText');
                        demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                        demoText.find('.demo-reload').on('click', function(){
                            uploadInst.upload();
                        });
                    }
                    ,error: function(index, upload){
                        var tr = demoListView.find('tr#upload-'+ index)
                            ,tds = tr.children();
                        tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
                        tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
                    }
                });
            });

        });
    })
</script>
</body>
</html>
