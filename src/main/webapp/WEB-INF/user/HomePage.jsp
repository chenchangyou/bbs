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
    <%--<%@include file="common/style.jsp" %>--%>
    <style>
        body {
            background-color: #F4F5F7;
        }

        .layui-nav .layui-nav-item a {
            color: #3b3b3b;
            font-size: 14px;
        }

        .layui-nav .layui-nav-item a i {
            line-height: 20px;
        }

        .layui-nav .layui-nav-item a:hover {
            color: rgba(29, 131, 255, 0.88);
            /*font-weight: bolder;*/
            text-decoration: none;
        }
        .bg-setting{
            background-color: rgba(0,0,1,0.2);
            text-align: center;
            width: 110px;
            line-height: 28px;
            border: 1px solid hsla(0,0%,100%,.3);
            border-radius: 25px;
            color: #f4fcff;
            display:none ;
        }
        .bg-setting:hover{
            background-color: rgba(0,0,1,0.4);
            color: #f4fcff;
        }
        a:hover{
            text-decoration: none;
            /*color: cornflowerblue;*/
        }
        a:link{
            text-decoration: none;
            /*color: #000000;*/
        }
        a:visited{
            /*color: snow;*/
        }
        .bg-top:hover .bg-setting{
            display:block;
        }
        .layui-upload{
            margin: 10px auto;
        }
        #user_bg{

        }
        .bg-top{
            width: 100%;
            height: 280px;
            padding-top: 180px;
            <c:if test="${not empty userbg}">
            background-image: url('/${userbg.url}');
            </c:if>
            <c:if test="${empty userbg}">
            background-image: url('../../static/images/userback.png');
            </c:if>

        }
        #replacehead{
            border-radius: 52px;
            width: 65px;
            height: 65px;
            display: block;
        }
        .replace_bg{
            text-align: center;
            line-height: 65px;
            border-radius: 52px;
            font-size: 12px;
            width:100%;
            height:100%;
            color: #dadada;
            background-color: rgba(0,0,1,0.4);
            display: none;
        }
        #replacehead:hover .replace_bg{
            display: block;
        }
    </style>
</head>
<body>
<%--引入导航栏--%>
<%@include file="../../common/head.jsp" %>
    <div style="width: 1160px;padding:0px 10px;margin: 0 auto">
        <%--引入菜单栏跟头部--%>
        <%@include file="usermenu.jsp"%>


        <div style="width: 100%;">

            <div style="width: 800px;float: left;">
                <blockquote class="layui-elem-quote">我的介绍</blockquote>
                <div style="width: 100%;font-size: 16px">
                    <div style="width: 100%;height: 30px">
                        <span style="line-height: 30px ;width: 100px;float: left">昵称：${user.username}</span>
                        <a style="line-height: 30px ;width: 100px;padding: 0 3px;float: right;color: #1E9FFF" href="">修改资料>></a>
                    </div>
                    <div>性别：${user.sex}</div>
                    <div>年龄：${user.age}</div>
                    <div>联系电话：${user.tel}</div>
                    <div>邮箱：${user.email}</div>
                    <div>注册时间：<fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd"/></div>
                </div>
                <textarea class="form-control" rows="3">不写点什么嘛</textarea>
            </div>
            <div style="width: 316px;float: right">
                <div class="panel panel-warning">
                    <div class="panel-body">
                       我的公告
                    </div>
                    <div class="panel-footer">欢迎来到我的主页</div>
                </div>
            </div>

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

                   if(data.state === 1){
                       $(".bg-top").css("background","url(/"+data.data.src+") no-repeat 0 0");
                       layer.closeAll('page');
                   }else if (data.state === 0){
                       layer.msg("系通出错！更换失败",{ //layui弹出层提示
                           offset: '150'
                       });
                   } else if(data.state === 2){
                        layer.msg("请您先登录",{
                            offset: '150',
                            time:800
                        },function () {
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

                    if(data.state === 1){
                        $("#replacehead").css({"background":"url(/"+data.data.src+")","background-size":"100% 100%"});
                        layer.closeAll('page');
                    }else if (data.state === 0){
                        layer.msg("系通出错！更换失败",{ //layui弹出层提示
                            offset: '150'
                        });
                    } else if(data.state === 2){
                        layer.msg("请您先登录",{
                            offset: '150',
                            time:800
                        },function () {
                            $('#denglu').trigger("click");
                        });
                    }

                }
            });

        })
    });
</script>
</body>
</html>
