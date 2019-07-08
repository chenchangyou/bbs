<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<html>
<head>
    <title>${loginUser.username}·后台管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%@include file="../../common/javascript.jsp" %>

    <style>
        a:hover {
            text-decoration: none;
        }

        .carousel-li {
            width: 250px;
            height: 150px;
            margin-left: 5px;
            border: 1px #dddddd solid;
            border-radius: 5px;
            padding: 3px;
            float: left;
            margin-top: 8px;
            background-color: #ffffff;
            text-align: center;
        }

        .carousel-ul li a {
            border-radius: 5px;
            z-index: 1;
        }

        .carousel-ul li a, .carousel-ul li a img {
            width: 100%;
            height: 100%;
            display: block;
            background-size: 100% 100%;
        }

        .carousel-ul li a span {
            border-radius: 5px;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 1, 0.3);
            padding: 57px;
            display: none;
        }

        .layui-icon-delete, .layui-icon-add-1 {
            color: red;
            width: 36px;
            height: 36px;
            font-size: 35px;
            border-radius: 53px;
            background-color: rgba(188, 188, 188, 0.69);
        }

        .layui-icon-delete, .layui-icon-add-1:hover {
            background-color: rgba(237, 237, 237, 0.6);
        }

        .carousel-ul a:hover .carousel-span {
            display: block;
            z-index: 2;
        }
    </style>

</head>
<body>
<div class="admin-global">
    <ol class="breadcrumb">
        <li>后台首页</li>
        <li class="active">轮播图</li>
    </ol>
    <div style="width: 100%">
        <%--轮播图位置--%>
        <ul id="carousel_ul" class="carousel-ul">

        </ul>
        <ul class="carousel-ul">
            <li class="carousel-li">
                <a href="javascript:" style="background-color: #FFFFFF;display: block">
                    <span class="layui-anim layui-anim-upbit" style="background-color: #f2f2f2;display: block;">
                        <i id="uploadimg" style="background:none; color: #c2c2c2"
                           class="layui-anim layui-anim-scaleSpring layui-icon layui-icon-add-1">
                        </i>
                    </span>
                </a>
            </li>
        </ul>
    </div>
</div>
<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>
<script>

    $(function () {

        var option = '';

        layui.use('upload', function () {
            var upload = layui.upload;

            //执行实例
            var uploadInst = upload.render({
                elem: '#uploadimg' //绑定元素
                , url: 'http://119.23.52.230/SSM/uploads/' //上传接口
                , done: function (res) {
                    //上传完毕回调
                     $.post("/admin/carousel/add",{url:res.data.src},function(data) {
                         if(data!=null){
                             option = '<li class="carousel-li">' +
                                 '                <a href="javascript:" style="background-image: url(' + data.url + ')">' +
                                 '                    <span id="'+data.id+'" class="layui-anim layui-anim-upbit carousel-span"><i class="layui-anim layui-anim-scaleSpring layui-icon layui-icon-delete"></i> </span>' +
                                 '                </a>' +
                                 '            </li>'
                             $("#carousel_ul").append(option);
                             layer.msg("添加成功");

                         }else {
                             layer.msg("添加失败！请重新尝试一下")
                         }
                     })
                }
                , error: function () {
                    //请求异常回调
                    layer.msg("添加失败！请重新尝试一下");
                }
            });
        });
        /*获取图片*/
        $.get("/admin/carousel/list/", function (data) {

            $.each(data, function (i, v) {
                option = '<li class="layui-anim layui-anim-upbit carousel-li">' +
                    '                <a href="javascript:" style="background-image: url(' + v.url + ')">' +
                    '                    <span id="'+v.id+'" class="layui-anim layui-anim-upbit carousel-span"><i class="layui-anim layui-anim-scaleSpring layui-icon layui-icon-delete"></i> </span>' +
                    '                </a>' +
                    '            </li>';
                $("#carousel_ul").append(option);
            });
        });
        /*删除事件*/
        $("#carousel_ul").on("click",".layui-icon-delete",function () {
            var caid = $(this).parent().attr('id');
            var remove = $(this).parent().parent().parent();
            $.post("/admin/carousel/delete",{id:caid},function (result) {
                layer.msg("已删除");
                remove.animate({
                    opacity: '0.5',
                    width: '0px',
                    height: '0px'
                }, function () {
                    $(this).remove();
                });
            });
        });
    })
</script>
</body>
</html>
