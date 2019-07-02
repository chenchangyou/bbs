<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="common/taglib.jsp"%>
<html>
<!DOCTYPE html>
<head>
    <title>欢迎来到友人博客</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="Access-Control-Allow-Origin" content="*" />
    <link rel="stylesheet" href="static/layui/css/layui.css">
</head>
<body>
<div class="layui-form" style="margin: 50px auto" >
    <select style="float: left;width: 200px;" id="filter" name="city" lay-verify="">
        <option value="">请选择一个城市</option>
        <option value="010">北京</option>
        <option value="021">上海</option>
        <option value="0571">杭州</option>
    </select>
    <select style="float: left;width: 200px;" id="type" name="posttype" lay-verify="">
    </select>
</div>

<script src="static/layui/layui.js"></script>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
        form.on('select(filter)', function(data){
            console.log(data.elem); //得到select原始DOM对象
            console.log(data.value); //得到被选中的值
            console.log(data.othis); //得到美化后的DOM对象
        });
    });
</script>
    </body>

</html>
