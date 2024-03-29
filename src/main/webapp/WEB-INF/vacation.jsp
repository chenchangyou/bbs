<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp"%>
<html>
<head>
    <title>${loginUser.username}的个人中心</title>
    <%@include file="../common/javascript.jsp"%>
</head>
<body>
<div  class="admin-global">
    <ol class="breadcrumb">
        <li>后台首页</li>
        <li class="active">管理中心</li>
        <a href="javascript:location.reload()" style="content:none; width: 150px;margin-left: 85%">刷新
            <a href="javascript:location.reload();">
                <i style="color: #0000FF" class="layui-anim layui-anim-rotate layui-icon layui-icon-refresh">
                </i></a></a>
    </ol>

<div style="width: 100%">
        <div>
            <table class="layui-hide" id="test"></table>
        </div>
</div>
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use('table', function(){
        var table = layui.table;
        table.render({
            elem: '#test'
            ,url:'/vacationTab'
            ,title: '用户数据表'
            ,totalRow: true
            ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                , groups: 5 //只显示 1 个连续页码
                , first: false //不显示首页
                , last: false //不显示尾页
                }
                ,cols: [[
                {field:'id', width:80, title: 'ID'}
                ,{field:'sname', width:150, title: '姓名'}
                ,{field:'sex', width:80, title: '性别'}
                ,{field:'grade', width:80, title: '班级、年级'}
                ,{field:'sphone', width:160, title: '联系电话'}
                ,{field:'dormitory', width:80, title: '现住宿舍'}
                ,{field:'reason', width:180, title: '留宿原因'}
                ,{field:'newdormitory', width:80, title: '假期留宿宿舍'}
                ,{field:'teacher', width:80, title: '负责老师'}
                ,{field:'tphone', width:160, title: '联系电话'}
                ,{field:'counselor',width:80, title: '辅导员' }
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
        });
        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除'+data.username+'该用户吗？', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.prompt({
                    formType: 2
                    ,value: data.email
                }, function(value, index){
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });
            }
        });
    });
</script>
</body>
</html>
