<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@include file="common/taglib.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Monster</title>
    <%@include file="common/style.jsp" %>
    <style>
        #bigbg {
            background: url("static/images/水墨背景1.png") no-repeat;
            height: 1000px;
        }

        ul {
            margin-bottom: 1px;
        }
    </style>
    <script>
        $(function () {
            //由于模块都一次性加载，因此不用执行 layui.use() 来加载对应模块，直接使用即可：
            ;!function () {
                var layer = layui.layer
                    , form = layui.form
                    , carousel = layui.carousel
                    , $ = layui.jquery;

                //建造实例
                carousel.render({
                    elem: '#test1'
                    , width: '100%' //设置容器宽度
                    , arrow: 'hover' //始终显示箭头
                    // ,anim: 'updown' //切换动画方式
                    , height: "330px"
                    , autoplay: "false"
                }),
                    $('#layerDemo .layui-btn').on('click', function () {
                        var othis = $(this), method = othis.data('method');
                        active[method] ? active[method].call(this, othis) : '';
                    });

                layer.msg('欢迎光临！尊敬的 ${loginUser.username} 用户！');
            }();
        })

    </script>
    <style>
        .list-group li {
            border: none;
            padding: 6px 16px;
        }

        .span1 span {
            margin-left: 60px;
            color: #A9A9A9;
        }

        .dianzan-ok {
            color: #2aabd2;
        }

        .dianzan-no {
            color: #A9A9A9;
        }

        .dianzan {
        }

        .dianzan:hover {
            text-decoration: none;
            color: red;
        }

        a:focus {
            text-decoration: none
        }
    </style>
</head>
<body>

<div style="width: 1000px;margin:60px auto">
    <div style="width: 780px;height: 116px;margin: 0 auto;border-bottom: 1px paleturquoise solid;padding: 8px 0px;background-color: #FFFFFF">
        <div style="width: 75%;height: 100%;float: left">
            <ul class="list-group" style="border: none">
                <li class="list-group-item"><h3>嘿嘿嘿嘿嘿嘿嘿！！！！！！！！</h3></li>
                <li class="list-group-item" style="padding-left: 15px;text-overflow:ellipsis;overflow: hidden"><span
                        style="white-space:nowrap;width: 100%; overflow: hidden;text-overflow:ellipsis;color:#A9A9A9;font-size: 12px">显示部分内容111111111111111111111111111111111111111111
                    11111111111111111111111111111111111111111111111111111111111</span>
                </li>
                <li class="list-group-item span1">
                    <span style="margin: 0">
                        <img class="layui-circle" border="1px red" width="22px" height="22xp"
                             src="static/images/user.png">
                        zhutengfei
                    </span>
                    <sapn style="margin-left: 15px">娱乐</sapn>
                    <span><i class="fa fa-eye"></i>  999+</span>
                    <span>
                        <a href="javascript:;" class="dianzan dianzan-no">
                            <i class="fa fa-thumbs-o-up"></i> <b class="number">1</b></a>
                    </span>
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
                <li class="list-group-item" style="padding-left: 15px;text-overflow:ellipsis;overflow: hidden"><span
                        style="white-space:nowrap;width: 100%; overflow: hidden;text-overflow:ellipsis;color:#A9A9A9;font-size: 12px">显示部分内容11111111111111111111111111111111111111111111111111111111
                    111111111111111111111111111111111111111111111</span>
                </li>
                <li class="list-group-item span1">
                    <span style="margin: 0">
                        <img class="layui-circle" border="1px red" width="22px" height="22xp"
                             src="static/images/user.png">
                        zhutengfei
                    </span>
                    <sapn style="margin-left: 15px">娱乐</sapn>
                    <span><i class="fa fa-eye"></i>  999+</span>
                    <span><a href="javascript:;" class="dianzan dianzan-no"><i
                            class="fa fa-thumbs-o-up"></i> <b class="number">1</b></a></span>
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

<script>
    /*点赞功能Ajax写法*/
    var pid = 4;//帖子Id,由于是测试就是先写死，怎么拿到自己想办法
    var uid = 5;//当前用户的Id，后台可以通过Session获取
    $('.dianzan').click(function () {//给每个点赞按钮绑定点击事件
        var dz = $(this);//定义当前元素
        var number = dz.find(".number").html();//获取当前的点赞数
        $.ajax({
            url: "/user/fabulous",  // 发送请求的URL字符串。
            data: {pid: pid, uid: uid}, // 发送到服务器的数据。
            type: "post",   //请求方式 POST或GET
            dataType: "json",   // 预期服务器返回的数据类型。
            async: false,   // 默认设置下，所有请求均为异步请求。如果设置为false，则发送同步请求
            success: function (data) {  // 请求成功后的回调函数。
                if (data > 0) {     //判断返回来的值,这个根据自己写的后台返回的json数据进行判断
                    dz.removeClass('dianzan-no').addClass('dianzan-ok');    //替换点击赞后的样式
                    number++; //数量加1
                    dz.find(".number").html(number);    //替换原有的点赞数
                    layer.msg("点赞成功");  //layui弹出层提示
                } else {
                    dz.removeClass('dianzan-ok').addClass('dianzan-no');    //替换回没点赞的样式
                    number--;   //数量减1
                    dz.find(".number").html(number);    //替换原有的点赞数
                    layer.msg("取消点赞");   //layui弹出层提示
                }
            },
            // 请求出错时调用的函数
            error: function () {
                layer.msg("点赞失败！系统出错");
            }
        });
    })
</script>

</body>


</html>
