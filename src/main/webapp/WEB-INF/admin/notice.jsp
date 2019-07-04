<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp"%>
<html>
<head>
    <title>${loginUser.username}的个人中心</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%@include file="../../common/javascript.jsp"%>
</head>
<body>
<div  class="admin-global">
    <ol class="breadcrumb">
        <li>后台首页</li>
        <li class="active">公告</li>
    </ol>
    <div style="width: 100%">
            <button type="button" class="layui-btn layui-btn-sm" id="addcaregory" onclick="tc(null);" data-type="addRow">
                <i class="layui-icon layui-icon-add-1"></i> 新增公告
            </button>
            <div>
                <table id="demo" lay-filter="text"></table>

                <script type="text/html" id="barDemo">
                    <a class="layui-btn layui-btn-xs" lay-event="detail">查看/编辑</a>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                </script>
            </div>
        </div>
</div>
<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>
<script>
    layui.use(['table','util'], function(){
        var table = layui.table;
        var util = layui.util;
        //监听单元格编辑
        table.render({
            elem: '#demo'
            ,url:'/admin/notice/list/'
            ,title: '公告列表'
            ,height: 450 //容器高度
            ,cols: [[
                {field:'nid', width:80, title: 'ID'}
                , {field:'title', width:150, title: '标题',edit:true}
                , {field:'content', width:200, title: '内容'}
                , {field:'createTime', width:180, title: '时间',templet:'<div>{{layui.util.toDateString(d.createTime, "yyyy-MM-dd HH:mm") }} </div>'}
                , {field:'state', width:80, title: '状态'}
                ,{field:'user', title: '发布人', width: 200
                    ,templet: function(d){
                        return''+ d.user.username +''
                    }
                }
                , {field:'right', minwidth:80, title: '操作',toolbar: '#barDemo'}
            ]] //设置表头
        });

        table.on('tool(text)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            if(layEvent === 'detail'){ //查看

                tc(data.nid);

            } else if(layEvent === 'del'){ //删除
                layer.confirm('真的删除<span style="color: red">'+data.title+'</span>该公告吗', function(index){

                    $.post("/admin/notice/delete",{nid:data.nid},function (state) {
                        if(state > 0){
                            obj.del();
                            layer.close(index);
                            layer.msg('删除成功');
                        }else {
                            layer.msg('删除失败');
                        }
                    })
                });
            }
        });
    });
    function tc(nid) {
        layer.open({
            title:'查看或者编辑公告',
            type: 2,
            area: ['800px', '650px'],
            fixed: false, //不固定
            maxmin: true,
            content: '/admin/notice/edit?nid='+nid
        });
    }

</script>
</body>
</html>
