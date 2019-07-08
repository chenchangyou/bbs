<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<html>
<head>
    <title>${loginUser.username}的个人中心</title>
    <%@include file="../../common/javascript.jsp" %>
</head>
<body>
<div class="admin-global">
    <ol class="breadcrumb">
        <li>后台首页</li>
        <li class="active">管理中心</li>
        <a href="javascript:location.reload()" style=" position: absolute;right: 0;content:none; width: 150px;margin-left: 85%">刷新
                <i style="color: #0000FF" class="layui-anim layui-anim-rotate layui-icon layui-icon-refresh">
                </i>
        </a>
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
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#test'
            , url: '/admin/userlist'
            , title: '用户数据表'
            , totalRow: true
            , page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
                layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                //,curr: 5 //设定初始在第 5 页
                , groups: 5 //只显示 1 个连续页码
                , first: false //不显示首页
                , last: false //不显示尾页
            }
            , cols: [[
                {field: 'id', width: 50, title: 'ID'}
                , {field: 'username', width: 100, title: '用户名'}
                , {field: 'nickname', width: 100, title: '昵称'}
                , {field: 'sex', width: 80, title: '性别'}
                , {field: 'age', width: 80, title: '年龄'}
                , {field: 'tel', width: 120, title: '电话'}
                , {field: 'email', width: 150, title: '邮箱'}
                , {
                    field: 'createTime',
                    title: '注册时间',
                    templet: '<div>{{layui.util.toDateString(d.createTime, "yyyy-MM-dd HH:mm") }}</div>'
                }
                , {field: 'state', width: 80, title: '状态'}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}
            ]]
        });
        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            //console.log(obj)
            if (obj.event === 'del') {
                layer.confirm('真的删除"<span style="color: red;">' + data.username + '</span>"该用户吗？', function (index) {
                    $.post("/user/delete/",{id:data.id},function (state) {
                        if(state > 0){
                            layer.msg("删除成功");
                            obj.del();
                            layer.close(index);
                        }else {
                            layer.msg("删除失败");
                        }
                    });
                });
            } else if (obj.event === 'edit') {
                 var index = layer.open({
                    title:'修改个人资料',
                    type: 2,
                    area: ['450px', '600px'],
                    fixed: true, //不固定
                    maxmin: false,
                    content: '/user/update?uid='+data.id
                });
                layer.full(index);
            }
        });
    });
</script>
</body>
</html>
