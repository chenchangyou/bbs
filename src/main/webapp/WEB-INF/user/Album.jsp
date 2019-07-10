<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<html>
<head>
    <title>${loginUser.username}的个人中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*"/>
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${ctx}/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <%--引入样式--%>
    <%@include file="userstyle.jsp" %>
    <style>
        .user_album img{
            width: 200px;
            height: 180px;
            margin-left: 5px;
            float: left;
        }
    </style>
</head>
<body>
<%--引入导航栏--%>
<%@include file="../../common/head.jsp" %>
<div class="layui-container" style="padding:0px 10px;margin: 0 auto">
    <%--引入菜单栏跟头部--%>
    <%--引入头部--%>
    <%@include file="user_bg.jsp" %>
    <div style=" margin:10px auto;">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-nav" style="background-color: #FFFFFF;color: black">

                <li class="layui-nav-item"><a href="/user/index?uid=${user.id}"><i class="fa fa-home fa-1x"
                                                                                              style="color: purple"></i>
                    主页 </a></li>
                <li class="layui-nav-item <%--layui-this--%>"><a href="/user/post/list?uid=${user.id}"><i
                        class="fa fa-pencil-square-o fa-1x"
                        style="color: #04bdff"></i> 帖子</a>
                </li>
                <li class="layui-nav-item layui-this"><a href="/user/album/?uid=${user.id}"><i style="color: rgba(4,150,98,0.98);" class="layui-icon layui-icon-picture"></i>
                    相册</a></li>
                <li class="layui-nav-item"><a href="/user/followed?uid=${user.id}"><i class="fa fa-user-plus fa-1x"></i>
                    关注</a></li>
                <li class="layui-nav-item"><a href="/user/collection?uid=${user.id}"><i class="fa fa-star fa-1x"
                                                                                        style="color: orange"></i>
                    收藏</a>
                </li>
                <li class="layui-nav-item"><a href="/user/fans?uid=${user.id}"><i class="fa fa-heart fa-1x"
                                                                                  style="color: #eeb4c3"></i>
                    粉丝</a></li>
                <c:if test="${not empty loginUser}">
                    <c:if test="${loginUser.id eq user.id}">
                        <li class="layui-nav-item"><a href="/user/setting?uid=${user.id}"><i
                                class="fa fa fa-cog fa-spin fa-1x" style="color: #041527"></i>
                            设置</a></li>
                    </c:if>
                </c:if>
            </ul>
        </div>
    </div>

    <div class="layui-row layui-col-space8">

        <diV>
           <%-- --%>
               <button id="addAlbum" type="button" class="layui-btn layui-btn-warm">
                   <i class="layui-icon layui-icon-add-1"></i>
                   添加相册
               </button>
        </diV>

        <div class="layui-upload">
            <button type="button" class="layui-btn" id="test2">多图片上传</button>
            <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                预览图：
                <div class="layui-upload-list" id="demo2"></div>
            </blockquote>
        </div>

    </div>
        <div class="layui-row" >
            <blockquote class="layui-elem-quote layui-col-md12">引用区域的文字</blockquote>
            <div id="layer-photos-demo" class="layer-photos-demo user_album">
                <img layer-pid="图片id，可以不写" layer-src="http://119.23.52.230/upload/1562756337431.jpg" src="http://119.23.52.230/upload/1562756337431.jpg" alt="图片名">
                <img layer-pid="图片id，可以不写" layer-src="http://119.23.52.230/upload/1562756337431.jpg" src="http://119.23.52.230/upload/1562756337431.jpg" alt="图片名">
            </div>
        </div>
</div>

<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>\
<script>
    //调用示例
    layer.photos({
        photos: '#layer-photos-demo'
        ,anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
    });
</script>

    <script>
        var uid;
        layui.use('upload', function() {
            var $ = layui.jquery
                , upload = layui.upload;
            upload.render({
                elem: '#test2'
                , url: 'http://119.23.52.230/SSM/uploads/'
                , multiple: true
                , before: function (obj) {
                    //预读本地文件示例，不支持ie8
                    obj.preview(function (index, file, result) {
                        $('#demo2').append('<img src="' + result + '" alt="' + file.name + '" class="layui-upload-img">')
                    });
                }
                , done: function (res) {
                    uid=${user.id}
                    // alert(res.data.src);
                    //上传完毕
                    $.post("/user/album/add/",{
                        uid:uid,
                        url:res.data.src,
                        acid:acid
                    },function (state) {

                    })
                }
            });
            
            $("#addAlbum").click(function () {
                uid=${user.id}
                layer.prompt({
                    formType: 2,
                    title: '请输相册名',
                    area: ['300px', '40px'] //自定义文本域宽高
                }, function(value, index, elem){

                    $.post("/user/albumCategory/add/",{uid:uid,name:value},function (data) {
                            alert(JSON.stringify(data))
                    });
                    // alert(value); //得到value
                    layer.close(index);
                });

            })
        })
    </script>
<script src="${ctx}/static/js/user_index.js" type="text/javascript"></script>

</body>
</html>
