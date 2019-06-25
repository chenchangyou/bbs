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
    <script src="${ctx}/static/layui/layui.js" type="text/javascript"></script>
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
        .list-group-item a{
            display: block;
        }
    </style>
</head>
<body>
<%--引入导航栏--%>
<%@include file="../../common/head.jsp" %>
<div style="width: 1160px;padding:0px 10px;margin: 0 auto">
    <%--引入菜单栏跟头部--%>
    <div class="bg-top">
        <div id="user_bg" style="width: 100%;height: 100px;background-image: url('../../static/images/bg_transparent.png') ">
            <div style="width: 100%;margin-left: 20px;padding-top: 10px;">
                <div style="width: 70px;height: 70px;float: left;border: 2px solid hsla(0,0%,100%,.4);border-radius: 52px;">
                    <a id="replacehead"  style=" background: url('${ctx}/${user.headshot}'); background-size:100% 100%;" href="javascript:;">
                        <%--<img>--%>
                        <span class="replace_bg layui-anim layui-anim-upbit">更换头像</span>
                    </a>
                </div>
                <div style="width: 750px;float: left;margin-left: 20px;margin-top: 10px;color: #FFFFFF">
                    <div>
                        <span style="font-weight: 700;font-size: 24px;color: #FFFFFF; vertical-align: middle">${user.username}</span>
                    </div>
                    <div style="margin-top: 5px">
                        个性签名：
                    </div>
                </div>
            </div>
            <div style="float: right;height: 80px;width: 130px;margin-top: 37px">
                <a class="bg-setting" href="javascript:;"style="">
                    <i class="fa fa-cog"></i>
                    <span>更换背景</span>
                </a>
            </div>
        </div>
    </div>
    <div style=" width: 100%;margin:10px auto;">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-nav" style="background-color: #FFFFFF;color: black">
                <li class="layui-nav-item <%--layui-this--%>"><a href="/user/index"><i class="fa fa-home fa-1x" style="color: purple"></i>
                    主页 </a></li>
                <li class="layui-nav-item "><a href="/user/post/list?uid=${user.id}"><i class="fa fa-pencil-square-o fa-1x"
                                                                                                       style="color: #04bdff"></i> 帖子（999+）</a>
                </li>
                <li class="layui-nav-item layui-this"><a href="/user/followed?uid=${user.id}"><i class="fa fa-user-plus fa-1x"></i> 关注（20）</a></li>
                <li class="layui-nav-item"><a href="/user/collection?uid=${user.id}"><i class="fa fa-star fa-1x" style="color: orange"></i> 收藏（99+）</a>
                </li>
                <li class="layui-nav-item"><a href="/user/fans?uid=${user.id}"><i class="fa fa-heart fa-1x" style="color: #eeb4c3"></i>
                    粉丝（7800万+）</a></li>
                <li class="layui-nav-item"><a href="/user/setting?uid=${user.id}"><i class="fa fa fa-cog fa-spin fa-1x" style="color: #041527"></i>
                    设置</a></li>

            </ul>
        </div>
    </div>

    <div style="width: 100%;">
        <c:forEach items="${followedList}" var="followed">
            <div class="panel panel-default">
                <div class="panel-body">
                        <a href="javascript:;">
                            <img style="width: 60px;height: 60px" src="${ctx}/${followed.followeId.headshot}" alt="..." class="img-circle">
                        </a>
                        <span>
                            ${followed.followeId.username}
                        </span>
                    <span class="layui-form">
                            <input type="checkbox" name="switch" lay-skin="switch" lay-filter="switchTest" lay-text="关注|已取消">
                    </span>
                </div>
            </div>
        </c:forEach>
    </div>

</div>




<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>

<script>
    layui.use(['layer','form'], function () {
        var $ = layui.jquery
            , upload = layui.upload
            , form = layui.form
            , layer = layui.layer;

        form.on('switch(switchTest)', function(data){
            var status_id = data.value;
            var csrfToken = "<?= Yii::$app->request->csrfToken ?>";
            $.ajax({
                url: "/admin/category/ajaxstatus",
                type: "post",
                dataType: "JSON",
                data: {status_id: status_id, _csrf_admin: csrfToken},
                success: function (data) {
                    if (data.success == true) {
                        layer.msg(data.msg);
                        location.reload();
                        return false;
                    } else {
                        layer.msg(data.msg);
                        setTimeout(function () {
                            location.reload();
                        }, 1000);
                        return false;
                    }
                }
            });
        });
    });
</script>
<script>

    /*layui.use('form', function(){
        var form = layui.form;
        form.on('switch(filter)', function(data){
            console.log(data.elem); //得到checkbox原始DOM对象
            console.log(data.elem.checked); //开关是否开启，true或者false
            console.log(data.value); //开关value值，也可以通过data.elem.value得到
            console.log(data.othis); //得到美化后的DOM对象
        });
    });*/

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
