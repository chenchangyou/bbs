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
        <li class="active">管理中心</li>
    </ol>

    <div style="width: 100%">

        <div class="admin-rightbox">
            <button type="button" class="layui-btn layui-btn-sm" id="addcaregory" data-type="addRow">
                <i class="layui-icon layui-icon-add-1"></i> 添加类型
            </button>
            <a href="javascript:location.reload()" style=" position: absolute;right: 0;content:none; width: 150px;margin-left: 85%">刷新
                <i style="color: #0000FF" class="layui-anim layui-anim-rotate layui-icon layui-icon-refresh">
                </i>
            </a>
            <div>
                <table class="layui-table" lay-data="{width: 892, height:330, url:'/admin/category/list/', page:true, id:'idTest'}" lay-filter="test3">
                    <thead>
                    <tr>
                        <th lay-data="{field:'id', width:80, sort: true}">ID</th>
                        <th lay-data="{field:'name', width:120, sort: true, edit: 'text'}">类型名</th>
                        <th lay-data="{fixed: 'right', title: '操作', width:150, toolbar: '#barDemo'}">类型名</th>
                    </tr>
                    </thead>
                </table>
                <script type="text/html" id="barDemo">
                    <a class="layui-btn layui-btn-xs" lay-event="save">保存修改</a>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                </script>
            </div>
        </div>

    </div>

</div>
<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;

       /* //监听单元格编辑
        table.on(['edit(test3)'], function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段
        });
*/
        table.on('tool(test3)', function (obj) {
            var data = obj.data,
            layEvent = obj.event;
            //console.log(obj)
            if(layEvent === 'detail'){ //查看
                //do somehing
            } else if(layEvent === 'del'){ //删除
                layer.confirm('真的删除"' +data.name +'"该类型吗？', function(index){

                    $.post("/admin/category/delete",{id:data.id},function (state) {
                       if(state > 0){
                           layer.msg('删除成功',{
                               icon:1
                           });
                       } else {
                           layer.msg('删除失败',{
                               icon:2
                           });
                       }
                    });

                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    //向服务端发送删除指令
                });
            } else if(layEvent === 'save'){ //保存修改
                $.post("/admin/category/update",{id:data.id,name:data.name},function (state){
                    if(state > 0){
                        layer.msg('成功修改为"'+data.name +'"',{
                            icon:1
                        });
                    }else {
                        layer.msg('修改失败！',{
                            icon: 2
                        });
                    }
                });
            }
        });

    });

    $(function () {
      $("#addcaregory").click(function () {
          layer.prompt({
              title: '请输入类别名称'},
              function(val, index){
              $.post("/admin/category/add",{cname:val},function (date) {
                    if(date > 0 ){
                        layer.msg("添加成功！",{
                            time:800
                        },function () {
                            window.location.reload();
                        })
                    }else {
                        layer.msg('添加失败', {
                            offset: '150',
                            icon: 2
                        });
                    }
              });
                  layer.close(index);
          });
      })
    })

</script>
</body>
</html>
