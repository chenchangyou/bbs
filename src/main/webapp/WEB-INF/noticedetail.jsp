<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp" %>
<html>
<head>
    <title>友人公告</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%@include file="../common/javascript.jsp" %>

    <style>
        .notice-detail {
            background-color: #ffffff;
            min-height: 100%;
        }

        .titled {

            margin: 20px auto;
        }
    </style>
</head>
<body>

<div class="layui-container notice-detail">
    <div class="layui-row">
        <div class="layui-col-md12">
            <div class="titled">
                <h2>${notice.title}</h2>
                <br>
                <div style="position: relative;">
                    <span class="layui-badge layui-bg-red fly-detail-column">公告</span>
                    <span style="position: absolute;right: 0;top: 0;padding-right: 0!important;">管理员：<span style="color: #1E9FFF">${notice.user.username}</span></span>
                    <span style="position: absolute;right: 0;top: 20px;">发布于：<span style="color: #1E9FFF">${notice.createTime}</span></span>
                </div>
            </div>
        </div>
        <hr>px
        <div style="font-size: 18px" class="layui-col-md12">
           ${notice.content}
        </div>
    </div>

</div>
<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>

</body>
</html>
