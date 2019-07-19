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
    <div class="layui-row layui-form" style="text-align: center">
        <form class="layui-form">
            <div class="layui-col-sm2">
                <input type="radio" name="field" value="id" title="ID">
                <input type="radio" name="field" value="username" title="用户名" checked>
            </div>

            <div class="layui-input-block layui-col-md6">
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
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use(['table','form'], function () {
        var table = layui.table
            ,form = layui.form;
        var tableIns = table.render({
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
                , {field: 'state', width: 80, title: '状态',templet: function(d){
                    if(d.state==1&&d.type==1){
                        return'普通用户'
                    }else if(d.state==1&&d.type==2){
                        return '管理员'
                    }
                    }}
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
                    area: ['100%', '100%'],
                    fixed: true, //不固定
                    maxmin: false,
                    content: '/user/update?uid='+data.id
                });
                layer.full(index);
            }
        });

        form.on('submit(formDemo)', function(data){
            console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            //阻止表单跳转。如果需要表单跳转，去掉这段即可。

            tableIns.reload({
                elem: '#test'

                ,url: '/admin/findBykeyword/' //设置异步接口
                ,id: 'idTest'
                ,where: { //设定异步数据接口的额外参数，任意设
                    field: data.field.field
                    ,keyword: data.field.keyword
                    //…
                }
                ,page: {
                    curr: 1 //重新从第 1 页开始
                },cols: [[
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
                ]] //设置表头
            });
            return false;
        });

        function sousuo(){
            form.on('radio(filter)', function(data){
                console.log(data.elem); //得到radio原始DOM对象
                console.log(data.value); //被点击的radio的value值

                var keyword = $("#keyword").val();
                //这里以搜索为例
            });
        }
    });
</script>
</body>
</html>
