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
            <a href="javascript:location.reload();" style="content:none; width: 150px;float: right;text-align: center">
                刷新
                <i style="color: #0000FF" class="layui-anim layui-anim-rotate layui-icon layui-icon-refresh">
                </i>
            </a>
    </ol>

    <div class="layui-row layui-form" style="text-align: center">
        <form class="layui-form">
            <div class="layui-col-sm3">
                <input type="radio" name="field" value="p.id" title="ID">
                <input type="radio" name="field" value="p.title" title="标题" checked>
                <input type="radio" name="field" value="u.username" title="用户名">
            </div>

            <div class="layui-input-block layui-col-md5">
                <input type="text" name="keyword" required lay-verify="required"  id="keyword"  placeholder="请输入关键字" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-col-md2" style="text-align: left; margin-left: 2px;">
                <button type="button"  lay-submit  lay-filter="formDemo" class="layui-btn layui-btn-normal">搜索</button>
            </div>
        </form>
    </div>

    <div style="width: 100%">
            <div>
                <table class="layui-hide" id="test"  lay-filter="test"></table>
            </div>
    </div>

</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use(['table','form'], function(){
        var table = layui.table;
        var util = layui.util;
        var form = layui.form;
        var tableIns= table.render({
            elem: '#test'
            ,url:'/admin/postlist'
            ,title: '帖子数据表'
            ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局 //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                , groups: 5 //只显示 5 个连续页码
                , first: false //不显示首页
                , last: false //不显示尾页
            }
            ,cols: [[
                {field:'id', width:80, title: 'ID'}
                ,{field:'title', width:150, title: '标题'}
                ,{field:'category', width:150, title: '类型',templet: function(d){
                        return''+ d.category.name +''
                    }}
                ,{field:'user', width:150, title: '发布人',templet: function(d){
                        return''+ d.user.username +''
                    }}
                ,{field:'browse',width:80, title: '访问量' }
                ,{field:'awesome',width:80, title: '点赞量' }
                ,{field:'collectCount',width:80, title: '收藏量' }
                ,{field:'createTime', title: '发布时间',templet:'<div>{{layui.util.toDateString(d.createTime, "yyyy-MM-dd HH:mm") }}</div>'}
                ,{field:'state',width:80, title: '状态' }
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
            ,page: true
        });

        form.on('submit(formDemo)', function(data){
           /* console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}*/
            //阻止表单跳转。如果需要表单跳转，去掉这段即可。

            tableIns.reload({
                elem: '#test'

                ,url: '/admin/bypostkeyword' //设置异步接口
                ,id: 'idTest'
                ,where: { //设定异步数据接口的额外参数，任意设
                    field: data.field.field
                    ,keyword: data.field.keyword
                    //…
                }
                ,page: {
                    curr: 1 //重新从第 1 页开始
                },cols: [[
                {field:'id', width:80, title: 'ID'}
                ,{field:'title', width:150, title: '标题'}
                ,{field:'title', width:150, title: '类型',templet: function(d){
                        return''+ d.category.name +''
                    }}
                ,{field:'browse',width:80, title: '访问量' }
                ,{field:'awesome',width:80, title: '点赞量' }
                ,{field:'collectCount',width:80, title: '收藏量' }
                ,{field:'createTime', title: '发布时间',templet:'<div>{{layui.util.toDateString(d.createTime, "yyyy-MM-dd HH:mm") }}</div>'}
                ,{field:'state',width:80, title: '状态' }
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]//设置表头
            });
            return false;
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
                            layer.msg('删除失败');
                        }
                    });
                });
            } else if(obj.event === 'edit'){//编辑按钮的事件
                var index = layer.open({
                    title:'编辑帖子',
                    type: 2,
                    area: ['800px', '100%'],
                    fixed: false, //不固定
                    maxmin: false,
                    content: '/admin/post/edit?pid='+data.id
                });
                layer.full(index);
            }else if(obj.event === 'detail'){
                window.open("/postdetails?postlistId="+data.id);
            }
        });
    });
</script>
</body>
</html>
