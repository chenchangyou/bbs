<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp"%>
<html>
<head>
    <title>${loginUser.username}的个人中心</title>
    <%@include file="../../common/style.jsp"%>
</head>
<body>
<%@include file="../../common/head.jsp"%>

<div style="height: 650px; width: 1160px;margin:80px auto;padding:10px 10px;background-color:#FFFFFF;box-shadow: 2px 2px 2px #888888;">
    <ol class="breadcrumb">
        <li>后台首页</li>
        <li class="active">管理中心</li>
    </ol>

    <div style="width: 100%">

        <div style="width:200px;height: 630px;float: left">
            <%@include file="adminmenu.jsp"%>
        </div>
        <div style="width:900px;height: 630px;padding: 15px;float: right">
            <div>
                <table class="layui-hide" id="test"></table>
            </div>
        </div>

    </div>

</div>

<script>
    layui.use('table', function(){
        var table = layui.table;
        var util = layui.util;
        table.render({
            elem: '#test'
            ,url:'/admin/postlist'
            ,cols: [[
                {field:'id', width:80, title: 'ID',}
                ,{field:'title', width:150, title: '标题'}
                ,{field:'content', width:200, title: '内容'}
                ,{field:'browse',width:80, title: '访问量' }
                ,{field:'createTime', title: '发布时间',templet:'<div>{{layui.util.toDateString(d.createTime, "yyyy-MM-dd HH:mm") }}</div>'}
                ,{field:'state',width:80, title: '状态' }
            ]]
        });
    });
</script>
</body>
</html>
