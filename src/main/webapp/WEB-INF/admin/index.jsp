<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp"%>
<html>
<head>
    <title>${loginUser.username}的个人中心</title>
    <%@include file="../../common/style.jsp"%>
</head>
<body>
<%@include file="../../common/head.jsp"%>

<div class="admin-global">
    <ol class="breadcrumb">
        <li>后台首页</li>
        <li class="active">管理中心</li>
    </ol>

<div style="width: 100%">
    <div class="layui-tab" lay-allowClose="true">
        <ul class="layui-tab-title">
            <li class="layui-this">网站设置</li>
            <li>用户基本管理</li>
            <li>权限分配</li>
            <li>全部历史商品管理文字长一点试试</li>
            <li>订单管理</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">1</div>
            <div class="layui-tab-item">2</div>
            <div class="layui-tab-item">3</div>
            <div class="layui-tab-item">4</div>
            <div class="layui-tab-item">5</div>
            <div class="layui-tab-item">6</div>
        </div>
    </div>
    <div style="width:150px;height: 630px;float: left">
        <%--<%@include file="adminmenu.jsp"%>--%>

    </div>
    <div class="admin-rightbox">
        <div>
            <table class="layui-hide" id="test"></table>
        </div>
    </div>

</div>
</div>
<script>
    layui.use('element', function(){
        var element = layui.element;

        //一些事件监听
        element.on('tab(demo)', function(data){
            console.log(data);
        });
    });
    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'/admin/findAll'
            ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                , groups: 5 //只显示 1 个连续页码
                , first: false //不显示首页
                , last: false //不显示尾页
            }
            ,cols: [[
                {field:'nid', width:80, title: 'ID'}
                ,{field:'title', width:150, title: '标题'}
                ,{field:'content', width:200, title: '内容'}
                ,{field:'createTime', title: '发布时间',templet:'<div>{{layui.util.toDateString(d.createTime, "yyyy-MM-dd HH:mm") }}</div>'}
                ,{field:'state',width:80, title: '状态' }
            ]]
        });
    });
</script>
</body>
</html>
