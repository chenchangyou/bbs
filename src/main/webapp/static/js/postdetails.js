$(function () {
    $(".reply1").on('click', '#tjpublish', function () {
        var data = $(this).parent().parent().serialize();
        var plq = $(this).parent().parent().parent();
        if ($("#user_reply").val().length > 0) {

            $.ajax({
                url: "${ctx}/replyComment/add",// 发送请求的URL字符串。
                // 发送到服务器的数据。
                data: data,
                type: "post", //  请求方式 POST或GET
                dataType: "json", // 预期服务器返回的数据类型。
                async: true, // 默认设置下，所有请求均为异步请求。如果设置为false，则发送同步请求
                // 请求成功后的回调函数。
                success: function (data) {
                    if (data > 0) {
                        /*plq.append("" +
                            "<div class='panel panel-default' style='margin-right: 6px;background:none;border:none'> " +
                            "                            <div class='panel-body'style='padding: 5px;margin-left: 60px'>" +
                            "                               <span style='float: left'><img src='
                        ${comment.user.headshot}' style='width: 35px;height: 35px; border-radius:50%'></span>" +
                        "                               <div style='width: 100%;'> " +
                        <c:if test='${reply.user.id == comment.user.id}'><span style='color:#1E9FFF;font-weight: bolder;float: left'>楼主：</span>

                        </c:if>" +
                        "                                   <span style='float: left'>

                        ${comment.user.username}：&nbsp;</span>" +
                        "                                   <span style='width: 500px;float: left'>

                        ${comment.content}</span>" +
                        "                                   <span style='width: 50px;float: right'><a href='javascript:;'>回复</a></span>" +
                        "                               </div>" +
                        "                            </div>" +
                        "                        </div>");*/
                        layer.msg('发表成功！', {
                            offset: '150',
                            time: 800
                        }, function () {
                            window.location.reload();
                        });
                    } else {
                        layer.msg('发表失败！', {
                            offset: '150',
                            time: 1000
                        });
                    }
                },
                // 请求出错时调用的函数
                error: function () {
                    layer.msg('系统错误，发表失败！');
                }
            });

        } else {
            layer.msg('发表失败！内容为空', {
                offset: '150'
            });
        }

    });

    /*提交发表的评论*/
    var contenttext = $("#publish");
    $("#publishbtn").click(function () {
        var textlength = $.trim($("#editor").text());/*获取富文本框的内容*/
        if (textlength.length > 0) {    /*判断长度*/
            setcontent();/*调用方法*/
        } else {
            layer.msg('请输入内容！', {
                offset: '150'
            });
        }
    });

    function setcontent() {
        $.post('/addReply', contenttext.serialize(), function (data) {
            if (data > 0) {
                layer.msg('发表成功！', {
                    offset: '150',
                    time: 1000
                }, function () {
                    window.location.reload();
                });
            } else {
                layer.msg('发表失败！', {
                    offset: '150'
                });
            }
        });
    }

    $(".delectreply").click(function () {
        var dq = $(this);
        var delDiv = dq.parent().parent().parent().parent().parent();
        var rid = dq.attr("id");
        layer.confirm('确定删除该评论吗？', {
            offset: '150'
            , btn: ['确定', '取消'] //按钮
        }, function () {
            $.post('/deletereply', {replyId: rid}, function (data) {
                if (data > 0) {
                    delDiv.animate({height: "0px"}, function () {
                        delDiv.remove();
                    })
                    layer.msg('删除成功', {
                        offset: '150',
                        icon: 1
                    });
                } else {
                    layer.msg('删除失败', {
                        offset: '150',
                        icon: 2
                    });
                }
            });

        });

    });

    /*点赞功能Ajax写法*/
    var pid = ${post.id};//帖子Id,由于是测试就是先写死，怎么拿到自己想办法
    var uid = <c:if test="${empty loginUser}">null</c:if><c:if test="${not empty loginUser}">${loginUser.id}</c:if>;//当前用户的Id，后台可以通过Session获取
    $('.dianzan').click(function () {//给每个点赞按钮绑定点击事件
        var dz = $(this);//定义当前元素
        var number = dz.find(".number").html();//获取当前的点赞数
        $.ajax({
            url: "/user/fabulous",  // 发送请求的URL字符串。
            data: {pid: pid,uid:uid}, // 发送到服务器的数据。
            type: "post",   //请求方式 POST或GET
            dataType: "json",   // 预期服务器返回的数据类型。
            async: false,   // 默认设置下，所有请求均为异步请求。如果设置为false，则发送同步请求
            success: function (data) {  // 请求成功后的回调函数。
                if (data === 1) {     //判断返回来的值,这个根据自己写的后台返回的json数据进行判断
                    dz.removeClass('dianzan-no').addClass('dianzan-ok');    //替换点击赞后的样式
                    number++; //数量加1
                    dz.find(".number").html(number);    //替换原有的点赞数
                    layer.msg("点赞成功",{
                        offset: '150'
                    });  //layui弹出层提示
                } else if(data === 0){
                    dz.removeClass('dianzan-ok').addClass('dianzan-no');    //替换回没点赞的样式
                    number--;   //数量减1
                    dz.find(".number").html(number);    //替换原有的点赞数
                    layer.msg("已取消点赞",{
                        offset: '150'
                    });   //layui弹出层提示
                }else if(data === 2){
                    layer.msg("请您先登录",{
                        offset: '150',
                        time:800
                    },function () {
                        $('#denglu').trigger("click");
                    });
                }
            },
            // 请求出错时调用的函数
            error: function () {
                layer.msg("点赞失败！系统出错",{
                    offset: '150'
                });
            }
        });
    });

    /*收藏Ajax*/
    $("#collect").click(function () {

        var collectNumber = $("#collectNumber").text();

        $.ajax({
            url: "/user/collect",  // 发送请求的URL字符串。
            data: {pid: pid}, // 发送到服务器的数据。
            type: "post",   //请求方式 POST或GET
            dataType: "json",   // 预期服务器返回的数据类型。
            async: false,
            success:function (data) {
                if(data === 0){

                    collectNumber--;
                    $("#collectsty").css("color","");
                    $("#collectNumber").html(collectNumber);
                    layer.msg("已取消收藏",{ //layui弹出层提示
                        offset: '150'
                    });

                }else if (data === 1){

                    collectNumber++;
                    $("#collectsty").css("color","orange");
                    $("#collectNumber").html(collectNumber);
                    layer.msg("收藏成功",{ //layui弹出层提示
                        offset: '150'
                        ,icon: 1
                    });

                } else if(data === 2){

                    layer.msg("请您先登录",{
                        offset: '150',
                        time:800
                    },function () {
                        $('#denglu').trigger("click");
                    });

                }
            },
            // 请求出错时调用的函数
            error: function () {
                layer.msg("收藏失败！系统出错",{
                    offset: '150'
                    ,icon: 2
                });
            }
        })
    });

    /*关注Ajax*/
    $("#attention").click(function () {

        var fansNumber = $("#fans").text();

        var postUserId = ${user.id};

        $.ajax({
            url: "/user/followed",  // 发送请求的URL字符串。
            data: {fid: postUserId}, // 发送到服务器的数据。
            type: "post",   //请求方式 POST或GET
            dataType: "json",   // 预期服务器返回的数据类型。
            async: false,
            success:function (data) {
                if(data === 0){

                    fansNumber--;

                    $(".attentionfont").removeClass('fa-check').addClass('fa-plus');

                    $("#attention").css("background-color","");
                    $("#attention span").text("关注");
                    $("#fans").html(fansNumber);
                    layer.msg("已取消关注",{ //layui弹出层提示
                        offset: '150'
                    });

                }else if (data === 1){

                    fansNumber++;
                    $(".attentionfont").removeClass('fa-plus').addClass('fa-check');

                    $("#attention").css("background-color","gray");
                    $("#attention span").text("已关注");
                    $("#fans").html(fansNumber);
                    layer.msg("关注成功",{ //layui弹出层提示
                        offset: '150'
                        ,icon: 1
                    });

                } else if(data === 2){

                    layer.msg("请您先登录",{
                        offset: '150',
                        time:800
                    },function () {
                        $('#denglu').trigger("click");
                    });

                }
            },
            // 请求出错时调用的函数
            error: function () {
                layer.msg("关注失败！系统出错",{
                    offset: '150'
                    ,icon: 2
                });
            }
        })
    });
})
