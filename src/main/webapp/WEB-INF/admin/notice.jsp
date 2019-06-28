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
            <button type="button" class="layui-btn layui-btn-sm" id="addcaregory" data-type="addRow">
                <i class="layui-icon layui-icon-add-1"></i> 新增公告
            </button>
            <div>
                <table class="layui-table" lay-data="{width: 892, height:330, url:'/admin/Notice/', page:true, id:'idTest'}" lay-filter="test3">
                    <thead>
                    <tr>
                        <th lay-data="{field:'nid', width:80, sort: true}">ID</th>
                        <th lay-data="{field:'title', width:120, sort: true, edit: 'text'}">标题</th>
                        <th lay-data="{field:'createTime', width:120, sort: true, edit: 'Date',templet:'div>{{layui.util.toDateString(d.createTime, 'yyyy年MM月dd日 HH:mm:ss')}}</div>'}">时间</th>
                        <th lay-data="{field:'state', width:120, sort: true, edit: 'text'}">状态</th>
                    </tr>
                    </thead>
                </table>
                <script type="text/html" id="barDemo">
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                </script>
            </div>
        </div>


</div>
<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //监听单元格编辑
        table.on('edit(test3)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段
            layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
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
              /*layer.msg('得到了'+val);*/
                  layer.close(index);
          });
      })
    })

</script>
</body>
</html>
