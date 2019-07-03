<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="../common/taglib.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Monster</title>
    <%@include file="../common/style.jsp"%>
    <style>
        #bigbg{
            background:url("../static/images/user.png") no-repeat ;
            height: 1000px;
        }
        ul{
            margin-bottom: 1px;
        }
    </style>
    <script>
        $(function () {
            //由于模块都一次性加载，因此不用执行 layui.use() 来加载对应模块，直接使用即可：
            ;!function(){
                var layer = layui.layer
                    ,form = layui.form
                    ,carousel = layui.carousel
                    ,$ = layui.jquery;

                //建造实例
                carousel.render({
                    elem: '#test1'
                    ,width: '100%' //设置容器宽度
                    ,arrow: 'hover' //始终显示箭头
                    // ,anim: 'updown' //切换动画方式
                    ,height:"330px"
                    ,autoplay:"false"
                }),
                    $('#layerDemo .layui-btn').on('click', function(){
                        var othis = $(this), method = othis.data('method');
                        active[method] ? active[method].call(this, othis) : '';
                    });

                layer.msg('欢迎光临！尊敬的用户！');
            }();
        })

    </script>
</head>
<body>
<div>
    <ul class="layui-nav">
        <img src="../static/images/g2.png" width="60px" height="60px"><li class="layui-nav-item">Monster</li>
        <li class="layui-nav-item"><a href="/index">首页</a></li>
        <li class="layui-nav-item layui-this">
            <a href="javascript:;">饰品市场</a>
            <dl class="layui-nav-child">
                <dd><a href="">CSGO</a></dd>
                <dd><a href="">DOTA2</a></dd>
                <dd><a href="">绝地求生</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="">论坛</a></li>
        <li class="layui-nav-item">
            <a href="javascript:;">更多</a>
            <dl class="layui-nav-child">
                <dd><a href="">BUG反馈</a></dd>
                <dd><a href="">意见和建议</a></dd>
                <dd class="layui-this"><a href="">加入我们！</a></dd>
                <dd><a href="">商务合作</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="">社区</a></li>
        <li class="layui-nav-item" style="float: right"><!-- Large modal -->
            <a href="/login">登录</a>
        </li>
        <li class="layui-nav-item" style="float: right">
            <a href="/register">注册</a></li>
    </ul>
</div>

<div id="bigbg">
    <div class="layui-container" style="background-color: white;padding: 0 1px;">
        <!--轮播图-->
        <div class="layui-carousel" id="test1" style="padding-top: 1px">
            <div carousel-item style="color: #353C4C">
                <div><img src="../static/images/lbt.png"></div>
                <div><img src="../static/images/lbt.png"></div>
                <div><img src="../static/images/lbt.png"></div>
                <div><img src="../static/images/lbt.png"></div>
            </div>
        </div>
        <!--登录注册模态框-->
    </div>
</div>


</body>


</html>
