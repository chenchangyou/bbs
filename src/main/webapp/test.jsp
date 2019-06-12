<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="common/taglib.jsp"%>
<html>
<head>
    <title>欢迎来到友人博客</title>
    <%@include file="common/style.jsp"%>
    <style>
        .loader {
            position: fixed;
            left: 0px;
            top: 0px;
            width: 100%;
            height: 100%;
            z-index: 9999;

            background: url('https://img-blog.csdn.net/20161205162919763') 50% 50% no-repeat rgb(249,249,249);
        }
        .box{
            width: 200px;
            height: 200px;
            border:  1px red solid;
        }
     </style>
</head>
<body>
<!--你的内容-->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>信息流 - 滚动加载</legend>
</fieldset>
        <ul id="demo">

        </ul>
</body >

<script>

    layui.use('flow', function(){
        var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
        var flow = layui.flow;
        flow.load({
            elem: '#demo' //指定列表容器
            ,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页
                var lis = [];
                //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
                $.get('/getpostlist?page='+page, function(res){
                    //假设你的列表返回在data集合中
                    layui.each(res.date, function(index, item){
                        lis.push('<li>'+ item.title +'</li>');
                    });
                    //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                    //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                    next(lis.join(''), page < res.pages);
                });
            }
        });
    });
</script>


<%--<script type="text/javascript">--%>
    <%--function load(){--%>
        <%--$("#loading").fadeOut("slow");--%>
    <%--}--%>
<%--</script>--%>

<script>
   // location.href="home";
</script>
</html>
