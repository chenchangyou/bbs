<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/taglib.jsp" %>
<html>
<head>
    <title>${post.title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <%@include file="../common/style.jsp" %>
    <script type="text/javascript">
        $(function () {
            //页面加载完毕后开始执行的事件
            $(".reply_btn").click(function () {
                $(".reply_textarea").remove();
                $(this).parent().parent().parent().parent().append("" +
                    "<div class='reply_textarea'><textarea id='user_reply' class='form-control' name='content' rows='3'></textarea><br/>" +
                    "<button type='button' class='btn btn-info btn-right' id='tjpublish'>回复</button></div>");
            });
        });

    </script>
    <style>
        .dianzan-ok {
            color: #2aabd2;
        }

        .dianzan-no {
            color: #A9A9A9;
        }

        .dianzan:visited {
        }

        .dianzan:hover {
            text-decoration: none;
            color: red;
        }
        a:hover{
            text-decoration: none;
            color: cornflowerblue;
        }
        a:link{
              text-decoration: none;
            /*color: #000000;*/
          }
        a:visited{
            /*color: #000000;*/
        }
        .w-e-toolbar{
            overflow: auto;
        }
        .w-e-toolbar:hover{
            overflow: inherit;
        }
        .reply_textarea{
            position: relative;
            text-align: right;
        }
    </style>
</head>
<body onload="load()">

<div id="loading" class="loader">
</div>
<!-- 引入头部 --->
<%@include file="../common/head.jsp" %>

<div class="layui-container" style="margin:60px auto 0 auto;">

    <ol class="breadcrumb">
        <li><a href="home">首页</a></li>
        <li class="active">帖子详情</li>
    </ol>
    <div class="layui-row layui-col-space10">
    <div style="padding: 4px;" class="box-left articlelist layui-col-md2">
        <div  style="padding: 10px;background-color: #FFFFFF;border:1px #ddd solid;border-radius: 4px" >
        <p><a href="/user/index?uid=${user.id}"><img src="${user.headshot}" alt="..." class="img-circle" width="70px" height="70px"
                                                     style="text-align: center"></a></p>
        <p><a href="/user/index?uid=${user.id}">${user.username}</a></p>
        <hr>
        <p>个人信息</p>
        <div style="width: 100%; padding: 12px 10px">
            <p><a href="/user/post/list?uid=${user.id}">帖子：${followedmap.postcount}</a> | <a href="user/followed?uid=${user.id}">关注：${followedmap.followedcount}</a></p>
            <p><a href="/user/fans?uid=${user.id}">粉丝：<span id="fans">${followedmap.collectNumber}</span></a> | <a href="/user/collection?uid=${user.id}">收藏：${followedmap.collectcount}</a></p>
        </div>

       <c:if test="${followedmap.state gt 0}">

           <c:if test="${user.id ne loginUser.id}">
               <button type="button" id="attention" style="width: 120px;border:none;text-align: center;margin: 0 auto;background-color: gray" class="btn btn-info btn-right">
                   <i class="fa fa-check attentionfont"></i> <span>已关注</span></button>
           </c:if>
           <c:if test="${user.id eq loginUser.id}">
               <a href="${ctx}/user/index?uid=${loginUser.id}" type="button" style="width: 120px;border:none;text-align: center;margin: 0 auto;" class="btn btn-info btn-right">
                    <span>个人中心</span></a>
           </c:if>

       </c:if>

        <c:if test="${followedmap.state le 0}">
            <c:if test="${user.id ne loginUser.id}">
                <button type="button" id="attention" style="width: 120px;border:none;text-align: center;margin: 0 auto;"class="btn btn-info btn-right">
                    <i class="fa fa-plus attentionfont"></i> <span>关注</span></button>
            </c:if>
            <c:if test="${user.id eq loginUser.id}">
                <a href="${ctx}/user/index?uid=${loginUser.id}" type="button" style="width: 120px;border:none;text-align: center;margin: 0 auto;" class="btn btn-info btn-right">
                    <span>个人中心</span></a>
            </c:if>
        </c:if>

    </div>
    </div>
        <div class="layui-col-md10">

            <div class="box-middle articledetail">
                <div>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h2> ${post.title} </h2>
                        </div>
                        <div style="width: 100%;height: 30px;padding: 0 5px;">
                            <div style="height: 30px;text-align: center;line-height: 30px;float: left">
                                作者：<a href="/user/index?uid=${user.id}">${user.username}</a></div>
                            <div style="width: 100px;font-size: 12px;color: #A9A9A9;float: right;line-height: 30px;">
                                <fmt:formatDate value="${post.createTime}" pattern="yyyy-MM-dd HH:mm"/></div>
                            <div style="width: 60px;font-size: 12px;color: #A9A9A9;float: right;line-height: 30px;">
                                <i class="fa fa-eye"></i> ${post.browse}</div>
                            <div style="width: 60px;font-size: 12px;color: #A9A9A9;float: right;line-height: 30px;">
                                <i  class="fa fa-commenting"></i> ${post.replynumber}</div>
                            <div style="width: 60px;font-size: 12px;color: #A9A9A9;float: right;line-height: 30px;">
                                <i  class="fa fa-thumbs-o-up"></i>
                                <c:if test="${not empty count}">
                                    ${count}
                                </c:if>
                                <c:if test="${empty count}">
                                    0
                                </c:if>
                            </div>
                        </div>
                        <hr style="color: #93D1FF;height: 3px">
                        <div style=" line-height: 35px;min-height:300px;overflow: hidden;word-wrap:break-word;word-break:break-all;padding: 5px 10px">
                            ${post.content}
                        </div>
                    </div>
                </div>
                <%--文章末端--%>
                <div style="width: 100%;height: 120px;padding: 10px 50px;">
                    <div style="margin: 0 auto;text-align: center">

                        <%--点赞按钮--%>
                        <div style="width: 33.3%;float: left;">
                            <a class="dianzan <c:if test="${state le 0}">dianzan-no</c:if>
                                        <c:if test="${state gt 0}">dianzan-ok</c:if>"
                               style="display: block;"href="javascript:;"> <i  class="fa fa-thumbs-o-up fa-3x"></i>
                                <c:if test="${not empty count}">
                                    <p class="number">${count}</p>
                                </c:if>
                                <c:if test="${empty count}">
                                    <p class="number">0</p>
                                </c:if>
                            </a>
                        </div>

                        <%--收藏按钮--%>
                        <div style="float: left;width: 33.3%;">
                            <a href="javascript:;" id="collect"><i id="collectsty" style="
                            <c:if test="${collectMap.state gt 0}">color:orange</c:if>
                                    " class="fa fa-star fa-3x"></i>

                                <c:if test="${not empty collectMap.collectNumber}">
                                    <p id="collectNumber">${collectMap.collectNumber}</p>
                                </c:if>
                                <c:if test="${empty collectMap.collectNumber}">
                                    <p id="collectNumber">0</p>
                                </c:if>
                            </a>
                        </div>

                        <%--举报按钮--%>
                        <div style="float: left;width: 33.3%;">
                            <a href="javascript:;"><i style="color: red" class="fa fa-warning fa-3x"></i>
                                <p>举报</p>
                            </a>
                        </div>

                    </div>

                </div>

                <%--评论区--%>
                <div style="width: 100%;height: 68px;padding: 2px;">
                    <blockquote style="height: 53px;border-bottom:1px  #92bdc1 solid " class="layui-elem-quote">
                        <div style="width: 100px;height: 100%;font-size: 25px;font-weight: bolder;float: left">评论区</div>
                        <div style="width: 58px;float: right;height: 100%"><a class="btn btn-default" href="#replys"
                                                                              role="button">回复</a></div>
                    </blockquote>
                </div>

                <c:forEach items="${replyList}" var="reply" varStatus="number">
                    <div class="panel panel-default" style="padding: 2px; background-color: rgb(255, 255, 255);border: none">
                        <!-- 回复区 -->
                        <form method="post" class="reply1">
                            <input type="hidden" name="postId" value="${post.id}">
                            <div class="panel-body" style="padding: 5px;">
                                <div style="height: 35px;width: 100%">
                                    <div style="width: 50px;float: left"><a href="/user/index?uid=${reply.user.id}"><img src="${reply.user.headshot}" alt="..."
                                                                                                                         class="img-circle" width="35px" height="35px"
                                                                                                                         style="text-align: center;border: 1px #d2d2d2 solid"></a></div>
                                    <div style="float: left;margin-left: 2px;text-align: center">
                                        <c:if test="${reply.user.id == post.user.id}"><span
                                                style="color:#1E9FFF;font-weight: bolder">楼主 </span></c:if>
                                        <a href="/user/index?uid=${reply.user.id}">${reply.user.username}</a>
                                    </div>
                                    <span style="float: right;width: 70px;text-align: center">#${number.count}</span>
                                </div>
                                <div style="padding: 5px 10px 10px 60px;overflow: hidden;min-height:35px">${reply.content}</div>
                                <div style="width: 100%;height: 25px;" class="comment">
                                    <div style="width: 150px;float: left;font-size: 12px;color: #A9A9A9;"><fmt:formatDate
                                            value="${reply.createTime}" pattern="yyyy-MM-dd HH:mm"/>
                                    </div>
                                    <div style="width: 40px;float: right;margin-left: 3px;">
                                        <c:if test="${reply.user.id == loginUser.id}"><a id="${reply.id}"
                                                                                         href="javascript:;"
                                                                                         class="delectreply"
                                                                                         style="color:#1E9FFF;font-weight: bolder">删除</a></c:if>
                                    </div>
                                    <div style="width: 130px;float:right;margin-left: 5px">
                                        <a class="relyLike" href="javascript:" id="${reply.id}"><i class="fa fa-thumbs-o-up"></i>
                                            <span style="margin-left: 3px">${reply.likecont}</span></a>
                                        <%--<a style="margin-left: 5px" href="javascript:"><i class="fa fa-thumbs-o-down"></i>
                                            <span style="margin-left: 3px">250</span></a>--%>
                                    </div>
                                    <div style="float: right;width: 50px">
                                        <input type="hidden" name="replyId" value="${reply.id}">
                                        <c:if test="${not empty loginUser}">
                                            <a href="javascript:" class="reply_btn">回复</a>
                                        </c:if>
                                        <c:if test="${empty loginUser}">
                                            <a href="javascript:" data-toggle="modal" data-target="#myModal">回复</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </form>

                            <%--评论回复区--%>

                        <c:forEach items="${reply.replyCommentList}" var="comment">
                            <div class="panel panel-default" style="margin-right: 6px;border:none">
                                <div class="panel-body" style="padding: 5px;margin-left: 60px;background-color:#f2f2f2;">
                                    <sapn style="float: left"><a href="/user/index?uid=${comment.user.headshot}"><img src="${comment.user.headshot}"
                                                                                                                      style="width: 35px;height: 35px;border: 1px #d2d2d2 solid;border-radius:50%"></a>
                                    </sapn>
                                    <div style="width: 100%;">
                                        <c:if test="${reply.user.id == comment.user.id}"><span
                                                style="color:#1E9FFF;font-weight: bolder;float: left">层主：</span></c:if>
                                        <span style="float: left"><a href="/user/index?uid=${comment.user.id}">${comment.user.username}</a>：&nbsp;</span>
                                        <span style="float: left">${comment.content}</span>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:forEach>

                <c:if test="${empty replyList}">
                    <div class="panel panel-default"
                         style="background-color: rgba(0,255,255,0.02);height: 100px; text-align: center">
                        <p style="line-height: 100px">趁没人赶紧抢沙发吧</p>
                    </div>
                </c:if>
                <hr>
                <h3>发表一下看法吧</h3>
                <c:if test="${not empty loginUser}">
                    <div id="replys" style="width: 100%;height: 310px;margin-top: 50px">
                        <form id="publish">
                            <div id="editor" style="width:100%;"></div>
                            <input type="hidden" name="postId" value="${post.id}">
                            <textarea id="content" name="content" style="display: none;" ></textarea></br>
                            <button class="btn btn-danger" style="width:100px;float: right" type="button" id="publishbtn">
                                发表
                            </button>
                        </form>
                    </div>
                </c:if>

                <c:if test="${empty loginUser}">
                    <div id="replys"
                         style="width: 100%;height: 200px;margin-top: 50px;border: 1px silver solid;margin-bottom: 10px;text-align: center;">
                        <button data-toggle="modal" data-target="#myModal"
                                style="width: 150px;text-align: center;height: 30px;margin:85px auto">登陆后才可发表
                        </button>
                    </div>
                </c:if>

            </div>
        </div>
    </div>

            <div class="layui-col-md10" id="footer" style=" clear:both; width: 100%;height: 150px;background-color: rgba(85,85,85,0.98);margin-top: 10px">
            </div>

    </div>
<script>
    var E = window.wangEditor;
    var editor = new E('#editor');
    var $content = $('#content');
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $content.val(html)
    };
    // 配置服务器端图片上传地址
    editor.customConfig.uploadImgServer = '${ctx}/global/postimage';
    //后台接受的name
    editor.customConfig.uploadFileName = 'file';
    // 将图片大小限制为 3M
    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
    // 限制一次最多上传 5 张图片
    editor.customConfig.uploadImgMaxLength = 3;
    editor.create();
    // 初始化 textarea 的值
    $content.val(editor.txt.html());

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
            // var htmllength = $content.
            // alert($("#content").val().indexOf("img"));
            if (textlength.length > 0 || $("#content").val().indexOf("img") >= 0 ) {    /*判断长度*/
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
                        time: 800
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
                        });
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
        $(".relyLike").click(function () {
            var $this = $(this);
            var num = $this.text();
            var rid = $this.attr("id");
            $.post("/replyLike/add/",{rid:rid},function (state) {
                if(state===0){
                    layer.msg("失败",{
                        icon:2,
                        offset: '150'
                    })
                }else if (state===1){
                    num++;
                    $this.css("color","blue");
                    $this.text(num);
                    layer.msg("成功",{
                        icon:1,
                        offset: '150'
                    })
                } else if (state===2){
                    layer.msg("请您先登录",{
                        offset: '150',
                        time:800
                    },function () {
                        $('#denglu').trigger("click");
                    })
                }
            })
        })
    })
</script>

</body>
</html>
