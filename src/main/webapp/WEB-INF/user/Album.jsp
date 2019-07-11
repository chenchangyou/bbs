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
            float: left;
            margin: 5px 3px;
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

    <div class="layui-row layui-col-space8 uploadload">

        <diV>
               <button id="addAlbum" type="button" class="layui-btn layui-btn-warm">
                   <i class="layui-icon layui-icon-add-1"></i>
                   添加相册
               </button>
        </diV>

        <c:forEach items="${albumCategoryList}" var="albumCategory">
            <div class="layui-row" >
                <blockquote class="layui-elem-quote layui-col-md12 layui-form"style="height: 60px">
                    <span class="layui-col-md11 layui-col-xs9">${albumCategory.name}</span>
                    <span class="layui-col-md1 layui-col-xs3">
                        <input id="${albumCategory.id}" type="checkbox" <c:if test="${albumCategory.state}">checked</c:if> name="open" lay-skin="switch" lay-filter="Albumchecked" lay-text="公开|隐藏">
                    </span>
                </blockquote>
                <div class="layer-photos-demo user_album layui-col-md12 layer-photos-demo">
                    <div class="layui-row"  style="text-align: center">
                        <div class="layui-col-md10" style="padding:5px; overflow: auto;height: 190px">
                            <c:forEach items="${albumCategory.album}" var="album">
                                <img layer-pid="${album.id}" layer-src="${album.url}" src="${album.url}" alt="${album.createTime}">
                            </c:forEach>
                        </div>
                        <div class="layui-upload layui-col-md2" style="text-align: center">
                            <button type="button" class="layui-btn uploadAlbum" id="${albumCategory.id}">上传相片</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>
<script>
    //调用示例
    layer.photos({
        photos: '.layer-photos-demo'
        ,anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
    });
</script>

    <script>
        var uid;
        layui.use(['upload','form'], function() {
            var $ = layui.jquery
                , upload = layui.upload
                , form = layui.form;
            var uploadInst = upload.render({
                elem:'.uploadAlbum'
                ,url: 'http://119.23.52.230/SSM/uploads/'
                ,size: 1024*3 //限定大小
            });

            $(".uploadload").on("click",".uploadAlbum",function () {
                var elemid= $(this).attr('id');
                var $this=$(this);
                uploadInst.reload({
                    elem: ''+elemid+''
                    ,accept: 'images'
                    , multiple: true
                    , before: function (obj) {
                        //预读本地文件示例，不支持ie8
                        obj.preview(function (index, file, result) {

                        });
                        $this.parent().prev().append('<div id="load" style="position: relative; top:30%;z-index:999999;background:url(/static/images/transition.gif) top center no-repeat;width:100%;height:140px;margin:auto auto;"></div>');
                    }
                    , done: function (res) {
                        uid=${user.id}
                        //上传完毕
                            $.ajax({
                                url: '/user/album/add/',
                                data: {
                                    uid:uid,
                                    url:res.data.src,
                                    acid:elemid
                                },
                                type: 'post',
                                dataType: 'json',
                                beforeSend: function () {
                                    $("#load").remove();
                                    $this.parent().prev().append('<div id="load" style="position: relative;top:30%;z-index:999999;background:url(/static/images/transition.gif) top center no-repeat;width:100%;height:140px;margin:auto auto;"></div>');

                                },
                                complete: function () {
                                    $this.parent().prev().append('<div id="load" style="position: relative;top:30%;z-index:999999;background:url(/static/images/transition.gif) top center no-repeat;width:100%;height:140px;margin:auto auto;"></div>');
                                    $("#load").remove();
                                },
                                success:function(state){
                                    $("#load").remove();
                                    $this.parent().prev().prepend('<img layer-pid="'+state.id+'" layer-src="'+state.url+'" src="'+state.url+'" alt="'+state.createTime+'">')
                                   layer.msg('上传成功');
                                },
                                error:function(){
                                    $("#load").remove();
                                }
                            });
                    }
                     });
                });



            $("#addAlbum").click(function () {
                uid=${user.id}
                layer.prompt({
                    formType: 2,
                    title: '请输相册名',
                    area: ['300px', '40px'] //自定义文本域宽高
                }, function(value, index, elem){
                    $.post("/user/albumCategory/add/",{uid:uid,name:value},function (data) {

                        var content ='' +
                            ' <div class="layui-row" >' +
                            '                <blockquote class="layui-elem-quote layui-col-md12">'+data.name+'</blockquote>' +
                            '                <div id="layer-photos-demo" class="layer-photos-demo user_album layui-col-md12">' +
                            '                    <div class="layui-row"  style="text-align: center">' +
                            '                        <div class="layui-col-md10" style="padding:5px; overflow: auto;height: 190px">' +
                            '                        </div>' +
                            '                        <div class="layui-upload layui-col-md2" style="text-align: center">' +
                            '                            <button type="button" class="layui-btn uploadAlbum" id="'+data.id+'">上传相片</button>' +
                            '                        </div>' +
                            '                    </div>' +
                            '                </div>' +
                            '            </div>'

                        if(data!=null){
                            layer.msg("新建相册成功");
                            $(".uploadload").append(content)
                        }else {
                            layer.msg(
                                "创建失败"
                            )
                        }
                    });
                    layer.close(index);
                });

            });
            //监听指定开关
            form.on('switch(Albumchecked)', function(data){

                var id = $(this).attr("id");
                $.post("/user/albumCategory/updateState/",{id:id,state:this.checked},function () {

                });
                // layer.msg('开关checked：'+ (this.checked), {
                //     offset: '6px'
                // });
                //
                layer.tips(this.checked ? '已公开' : '已隐藏',data.othis)
            });

        })
    </script>
<script src="${ctx}/static/js/user_index.js" type="text/javascript"></script>

</body>
</html>
