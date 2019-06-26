<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp"%>
<html>
<head>
    <title>${loginUser.username}的个人中心</title>
    <%@include file="../../common/javascript.jsp"%>
</head>
<body>
<div class="admin-global">
    <ol class="breadcrumb">
        <li>后台首页</li>
        <li class="active">管理中心</li>
    </ol>

    <div style="width: 100%">

            <div>
                <table class="layui-hide" id="test"  lay-filter="test"></table>
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
        var util = layui.util;
        table.render({
            elem: '#test'
            ,url:'/admin/postlist'
            ,title: '帖子数据表'
            ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局 //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                , groups: 5 //只显示 1 个连续页码
                , first: false //不显示首页
                , last: false //不显示尾页
            }
            ,cols: [[
                {field:'id', width:80, title: 'ID',}
                ,{field:'title', width:150, title: '标题'}
                ,{field:'browse',width:80, title: '访问量' }
                ,{field:'createTime', title: '发布时间',templet:'<div>{{layui.util.toDateString(d.createTime, "yyyy-MM-dd HH:mm") }}</div>'}
                ,{field:'state',width:80, title: '状态' }
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
            ,page: true
        });
        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除<span style="color: red">"'+data.title+'</span>"该贴吗', function(index){
                    $.post("/admin/deletePost",{postId:data.id},function (data) {
                        if(data =='ok'){
                            obj.del();
                            layer.close(index);
                            layer.msg('删除成功');
                        }else {
                            layer.msg(data);
                        }
                    });

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
