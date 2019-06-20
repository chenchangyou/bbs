<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/taglib.jsp" %>
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
            color: #000;
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
    </style>
</head>
<body>
<%--引入导航栏--%>
<%@include file="common/head.jsp" %>

<div style="width: 1160px;padding:0px 10px;margin: 0 auto">

    <div class="bg-top" style="width: 100%;height: 280px;padding-top: 185px;background-image: url('static/images/userback.png')">
        <div style="width: 100%;height: 100px;background-image: url('static/images/bg_transparent.png') ">
            <div style="width: 100%;margin-left: 20px;padding-top: 10px;">
                <div style="width: 70px;height: 70px;float: left;border: 2px solid hsla(0,0%,100%,.4);border-radius: 52px;">
                    <img width="65" height="65" src="static/images/userback.png">
                </div>
                <div style="width: 750px;float: left;margin-left: 20px;margin-top: 10px;color: #FFFFFF">
                    <div>
                        <span style="font-weight: 700;font-size: 24px;color: #FFFFFF; vertical-align: middle">zhutengfei</span>
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
    <div style="height: 650px; width: 100%;margin:10px auto;">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <%--<ul class="layui-tab-title">
                <li class="layui-this">主页</li>
                <li>帖子</li>
                <li>关注</li>
                <li>收藏</li>
                <li>粉丝</li>
            </ul>--%>
            <ul class="layui-nav" style="background-color: #FFFFFF;color: black">
                <li class="layui-nav-item layui-this"><a href=""><i class="fa fa-home fa-1x" style="color: purple"></i>
                    主页 </a></li>
                <li class="layui-nav-item <%--layui-this--%>"><a href=""><i class="fa fa-pencil-square-o fa-1x"
                                                                            style="color: #04bdff"></i> 帖子（999+）</a>
                </li>
                <li class="layui-nav-item"><a href=""><i class="fa fa-user-plus fa-1x"></i> 关注（20）</a></li>
                <li class="layui-nav-item"><a href=""><i class="fa fa-star fa-1x" style="color: orange"></i> 收藏（99+）</a>
                </li>
                <li class="layui-nav-item"><a href=""><i class="fa fa-heart fa-1x" style="color: #eeb4c3"></i>
                    粉丝（7800万+）</a></li>
                <li class="layui-nav-item"><a href=""><i class="fa fa fa-cog fa-spin fa-1x" style="color: #041527"></i>
                    设置</a></li>

            </ul>
        </div>
    </div>
</div>

<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>
</body>
</html>
