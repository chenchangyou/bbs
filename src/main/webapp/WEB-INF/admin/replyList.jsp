<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp"%>
<html>
<head>
    <title>${loginUser.username}的个人中心</title>
    <%@include file="../../common/javascript.jsp"%>
    <style>
        body .demo-class{
            width: 400px;
            height: 300px;
        }
        body .demo-class .layui-layer-title{
            background: #000001; color:#fff; border: none;
            width: 100%;
        }
        body .demo-class .layui-layer-btn{border-top:1px solid #E9E7E7}
        body .demo-class .layui-layer-btn a{background:#333;}
        body .demo-class .layui-layer-btn .layui-layer-btn1{background:#999;}
    </style>
</head>
<body>
<div  class="admin-global">
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
                <input type="radio" name="field" value="r.id" title="ID">
                <input type="radio" name="field" value="u.username" title="用户名">
                <input type="radio" name="field" value="p.title" title="标题">
                <input type="radio" name="field" value="r.content" title="内容" checked>
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
            <table class="layui-hide" id="test" lay-filter="test"></table>
        </div>
</div>
</div>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use(['table','layedit','form'], function(){
        var table = layui.table
            ,form = layui.form;


        var tableIns=table.render({
            elem: '#test'
            ,url:'/admin/reply/list'
            ,title: '用户数据表'
            ,totalRow: true
            ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                , groups: 5 //只显示 5 个连续页码
                , first: false //不显示首页
                , last: false //不显示尾页
                }
                ,cols: [[
                {type:'numbers' ,fixed:'left'}
                ,{field:'id', width:80, title: 'ID'}
                ,{field:'user', width:120, title: '回帖人',templet: function(d){
                        return''+ d.user.username +''
                    }}
                ,{field:'dormitory', width:80, title: '回帖ID',templet: function(d){
                        return''+ d.post.id +''
                    }}
                ,{field:'post', width:180, title: '回帖标题',templet: function(d){
                        return''+ d.post.title +''
                    }}
                ,{field:'content', width:220, title: '回帖内容'}
                ,{field:'createTime', width:160,sort:true, title: '回帖时间',templet:'<div>{{layui.util.toDateString(d.createTime, "yyyy-MM-dd HH:mm") }}</div>'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
        });

        form.on('submit(formDemo)', function(data){
             tableIns.reload({
                elem: '#test'
                ,url: '/admin/ByReplykeyword' //设置异步接口
                ,id: 'idTest'
                ,where: { //设定异步数据接口的额外参数，任意设
                    field: data.field.field
                    ,keyword: data.field.keyword
                    //…
                }
                ,page: {
                    curr: 1 //重新从第 1 页开始
                },cols: [[
                    {type:'numbers' ,fixed:'left'}
                    ,{field:'id', width:80, title: 'ID'}
                    ,{field:'user', width:120, title: '回帖人',templet: function(d){
                            return''+ d.user.username +''
                        }}
                    ,{field:'dormitory', width:80, title: '回帖ID',templet: function(d){
                            return''+ d.post.id +''
                        }}
                    ,{field:'post', width:180, title: '回帖标题',templet: function(d){
                            return''+ d.post.title +''
                        }}
                    ,{field:'content', width:220, title: '回帖内容'}
                    ,{field:'createTime', width:160,sort:true, title: '回帖时间',templet:'<div>{{layui.util.toDateString(d.createTime, "yyyy-MM-dd HH:mm") }}</div>'}
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
                layer.confirm('真的删除该评论吗？', function(index){

                    $.post('/deletereply', {replyId: data.id}, function (data) {
                        if (data > 0) {
                            obj.del();
                            layer.close(index);
                            layer.msg('删除成功', {
                                icon: 1
                            });
                        } else {
                            layer.msg('删除失败', {
                                icon: 2
                            });
                        }
                    });
                });
            } else if(obj.event === 'edit'){

                layer.open({
                    title:'查看或者编辑用户回复',
                    type: 2,
                    area: ['800px', '650px'],
                    fixed: false, //不固定
                    maxmin: true,
                    content: '/admin/reply/edit?rid='+data.id
                });
            }
        });
    });
</script>
</body>
</html>
