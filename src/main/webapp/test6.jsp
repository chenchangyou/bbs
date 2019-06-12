<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="common/taglib.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Monster</title>
    <%@include file="common/style.jsp"%>
    <style>
        #bigbg{
            background:url("static/images/水墨背景1.png") no-repeat ;
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

<div style="width: 1000px;margin:60px auto">
    <div style="width: 670px;height: 150px;margin: 5px auto;border-top: 1px paleturquoise solid;border-bottom: 1px paleturquoise solid;padding: 15px 0px">
        <div style="width: 70px;height: 150px;text-align: center;float: left;margin-top: 15px">
            <img style="border: 1px darkgray solid" width="40" height="40" class="img-circle" src="static/images/user.png">
        </div>
        <div style="width: 600px;height: 150px ;padding: 3px;float: right">
            <div style="width: 100%;height: 80px">
                <div style="width: 420px;height: 100%;float: left;">
                        <div style="border-radius:5px; width: 100%;line-height: 80px;height:100%;text-align: center;background-color: #E5E9EF;padding: 3px 6px;">请&nbsp;<button style="height: 30px;" type="button" class="btn btn-info"> 登录</button>&nbsp; 后发表评论(・ω・)</div>
                </div>
                <a href="javascript:;" style="border-radius:5px;height:100%;background-color: #E5E9EF;width: 150px;margin-left: 10px;text-align: center;float: left;padding: 22px 6px;">
                        发表</br>评论
                </a>
            </div>
            <div style="width: 100%;height: 70px;clear:both;padding: 5px 0px;">
                <div style="border-radius:5px;width: 100px;height: 40px;line-height:40px; text-align: center;background-color:#E5E9EF;"><a href="javascript:;" style="display: block">表情</a></div>
            </div>
        </div>
    </div>


    <div></div>

</div>

</body>


</html>
