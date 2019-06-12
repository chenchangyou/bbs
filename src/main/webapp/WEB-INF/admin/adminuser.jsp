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
        <div style="width:200px;height: 630px;float: left">
            <%@include file="adminmenu.jsp"%>
        </div>

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
        table.render({
            elem: '#test'
            ,url:'/admin/userlist'
            ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                , groups: 5 //只显示 1 个连续页码
                , first: false //不显示首页
                , last: false //不显示尾页
                }
                ,cols: [[
                {field:'id', width:80, title: 'ID'}
                ,{field:'username', width:150, title: '用户名'}
                ,{field:'sex', width:80, title: '性别'}
                ,{field:'age', width:80, title: '年龄'}
                ,{field:'email', width:120, title: '邮箱'}
                ,{field:'createTime', title: '注册时间',templet:'<div>{{layui.util.toDateString(d.createTime, "yyyy-MM-dd HH:mm") }}</div>'}
                ,{field:'state',width:80, title: '状态' }
            ]]
        });
    });
</script>
</body>
</html>
