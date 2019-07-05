<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp"%>
<html>
<head>
    <title>${loginUser.username}·后台管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%@include file="../../common/javascript.jsp"%>

    <style>
        a:hover{
            text-decoration: none;
        }
        .carousel-li{
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
        .carousel-ul li a{
            border-radius: 5px;
            z-index: 1;
        }

        .carousel-ul li a,.carousel-ul li a img{
            width: 100%;
            height: 100%;
            display: block;
            background-size: 100% 100%;
        }

        .carousel-ul li a span{
            border-radius: 5px;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 1, 0.3);
            padding: 57px;
            display: none;
        }
        .layui-icon-close{
            color: red;
            width: 36px;
            height: 36px;
            font-size: 35px;
            border-radius: 53px;
            background-color: rgba(188, 188, 188, 0.69);
        }
        .layui-icon-close:hover{
            background-color: rgba(237, 237, 237, 0.6);
        }
        .carousel-ul a:hover .carousel-span{
            display: block;
            z-index: 2;
        }
    </style>

</head>
<body>
<div  class="admin-global">
    <ol class="breadcrumb">
        <li>后台首页</li>
        <li class="active">轮播图</li>
    </ol>
    <div style="width: 100%">
        <ul class="carousel-ul">

            <li class="carousel-li">
                <a href="javascript:" style="background-image: url('../../static/images/userback.png')">
                    <span class="layui-anim layui-anim-upbit carousel-span" style=""><i class="layui-anim layui-anim-scaleSpring layui-icon layui-icon-close"></i> </span>
                </a>
            </li>
            <li class="carousel-li">
                <a href="javascript:" style="background-image: url('../../static/images/userback.png')">
                    <span class="layui-anim layui-anim-upbit carousel-span" style=""><i class="carousel-i layui-anim layui-anim-scaleSpring layui-icon layui-icon-close"></i> </span>
                </a>
            </li>
            <li class="carousel-li">
                <a href="javascript:" style="background-image: url('../../static/images/userback.png')">
                    <span class="layui-anim layui-anim-upbit carousel-span" style=""><i class="layui-anim layui-anim-scaleSpring layui-icon layui-icon-close"></i> </span>
                </a>
            </li>
            <li class="carousel-li">
                <a href="javascript:" style="background-image: url('../../static/images/userback.png')">
                    <span class="layui-anim layui-anim-upbit carousel-span" style=""><i class="layui-anim layui-anim-scaleSpring layui-icon layui-icon-close"></i> </span>
                </a>
            </li>

        </ul>

    </div>
</div>
<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>
<script>

    $(function () {
        $(".carousel-span i").click(function () {
            $(this).parent().parent().parent().animate({
                opacity:'0.5',
                width:'0px',
                height:'0px'
            },function () {
                $(this).remove();
            });
        });
    })
</script>
</body>
</html>
