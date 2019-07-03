<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="../common/taglib.jsp"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Monster</title>
    <%@include file="../common/style.jsp"%>
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

                layer.msg('欢迎光临！尊敬的 ${loginUser.username} 用户！');
            }();
        })

    </script>
    <style>
        .list-group li{
            border: none;
            padding: 6px 16px;
        }
        .span1 span{
            margin-left: 60px;
            color:#A9A9A9;
        }
    </style>
</head>
<body>

<div style="width: 1000px;margin:60px auto">
    <div style="width: 780px;height: 116px;margin: 0 auto;border-bottom: 1px paleturquoise solid;padding: 8px 0px;background-color: #FFFFFF">
        <div style="width: 75%;height: 100%;float: left">
            <ul class="list-group" style="border: none">
                <li class="list-group-item"><h3>嘿嘿嘿嘿嘿嘿嘿！！！！！！！！</h3></li>
                <li class="list-group-item" style="padding-left: 15px;text-overflow:ellipsis;overflow: hidden"><span style="white-space:nowrap;width: 100%; overflow: hidden;text-overflow:ellipsis;color:#A9A9A9;font-size: 12px">显示部分内容11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</span></li>
                <li class="list-group-item span1">
                    <span style="margin: 0">
                        <img class="layui-circle" border="1px red" width="22px" height="22xp" src="../static/images/user.png">
                        zhutengfei
                    </span>
                    <sapn style="margin-left: 15px">娱乐</sapn>
                    <span><i class="fa fa-eye"></i>  999+</span>
                    <span><i class="fa fa-thumbs-o-up"></i>  999+</span>
                    <span><i class="fa fa-commenting"></i>  999+</span>
                </li>
            </ul>
        </div>
        <div style="width:22%;height: 100%;margin-left:15px;float: left;padding: 8px">
            <div>
                    <a href="#" class="thumbnail" style="width: 93%;height: 100%">
                        <img src="" alt="...">
                    </a>
            </div>
        </div>
    </div>

    <div style="width: 780px;height: 116px;margin: 0 auto;border-bottom: 1px paleturquoise solid;padding: 8px 0px;background-color: #FFFFFF">
        <div style="width: 75%;height: 100%;float: left">
            <ul class="list-group" style="border: none">
                <li class="list-group-item"><h3>嘿嘿嘿嘿嘿嘿嘿！！！！！！！！</h3></li>
                <li class="list-group-item" style="padding-left: 15px;text-overflow:ellipsis;overflow: hidden"><span style="white-space:nowrap;width: 100%; overflow: hidden;text-overflow:ellipsis;color:#A9A9A9;font-size: 12px">显示部分内容11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111</span></li>
                <li class="list-group-item span1">
                    <span style="margin: 0">
                        <img class="layui-circle" border="1px red" width="22px" height="22xp" src="../static/images/user.png">
                        zhutengfei
                    </span>
                    <sapn style="margin-left: 15px">娱乐</sapn>
                    <span><i class="fa fa-eye"></i>  999+</span>
                    <span><i class="fa fa-thumbs-o-up"></i>  999+</span>
                    <span><i class="fa fa-commenting"></i>  999+</span>
                </li>
            </ul>
        </div>
        <div style="width:22%;height: 100%;margin-left:15px;float: left;padding: 8px">
            <div>
                <a href="#" class="thumbnail" style="width: 93%;height: 100%">
                    <img src="" alt="...">
                </a>
            </div>
        </div>
    </div>


</div>

</body>


</html>
