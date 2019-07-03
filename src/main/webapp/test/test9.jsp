<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="../common/taglib.jsp"%>
<html>
<!DOCTYPE html>
<head>
    <title>欢迎来到友人博客</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../static/layui/css/layui.css">
</head>
<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
    <%--引入导航栏--%>
    <%@include file="nav.jsp"%>
    <%--引入菜单--%>
    <%@include file="menu.jsp"%>

    <div class="layui-body layui-tab-content site-demo site-demo-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">777777777777777777777777</div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="../static/layui/layui.js"></script>
<script>
    layui.use('layer', function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer;

        /*layer.prompt({title: '输入口令，并确认', formType: 1}, function(pass, index){
            layer.close(index);

            if(pass === 123456){

            }else {
                layer.msg("口令错误！请重新输入")
            }
        });*/

    });


    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>

</html>
