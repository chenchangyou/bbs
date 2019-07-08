<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<html>
<head>
    <title>${loginUser.username}的个人中心</title>
    <meta http-equiv="Access-Control-Allow-Origin" content="*"/>
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${ctx}/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/layui/layui.js" type="text/javascript"></script>
    <%--引入样式--%>
    <%@include file="userstyle.jsp" %>

</head>
<body>
<script>

    function load() {

        layer.load();

        //加载层-默认风格
        //此处演示关闭
        setTimeout(function () {
            layer.closeAll('loading');
        }, 1500);

    }


</script>
<%--引入导航栏--%>
<%@include file="../../common/head.jsp" %>
<div style="width: 1160px;padding:0px 10px;margin: 0 auto">
    <%--引入头部--%>
    <%@include file="user_bg.jsp" %>
    <div style=" width: 100%;margin:10px auto;">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-nav" style="background-color: #FFFFFF;color: black">
                <li class="layui-nav-item <%--layui-this--%>"><a href="/user/index?uid=${user.id}"><i class="fa fa-home fa-1x"
                                                                                       style="color: purple"></i>
                    主页 </a></li>
                <li class="layui-nav-item layui-this"><a href="/user/post/list?uid=${user.id}"><i
                        class="fa fa-pencil-square-o fa-1x"
                        style="color: #04bdff"></i> 帖子</a>
                </li>
                <li class="layui-nav-item"><a href="/user/followed?uid=${user.id}"><i class="fa fa-user-plus fa-1x"></i>
                    关注</a></li>
                <li class="layui-nav-item"><a href="/user/collection?uid=${user.id}"><i class="fa fa-star fa-1x"
                                                                                        style="color: orange"></i>
                    收藏</a>
                </li>
                <li class="layui-nav-item"><a href="/user/fans?uid=${user.id}"><i class="fa fa-heart fa-1x"
                                                                                  style="color: #eeb4c3"></i>
                    粉丝</a></li>
                <c:if test="${not empty loginUser}">
                    <c:if test="${loginUser.id eq user.id}">
                        <li class="layui-nav-item"><a href="/user/setting?uid=${user.id}"><i
                                class="fa fa fa-cog fa-spin fa-1x" style="color: #041527"></i>
                            设置</a></li>
                    </c:if>
                </c:if>

            </ul>
        </div>
    </div>


    <div style="width: 100%;" onload="load();">
        <ul class="list-group">
            <c:if test="${empty postlist}">
                <div class="panel panel-default">
                    <div class="panel-body" style="text-align: center">
                        您还没有发过帖子呢
                    </div>
                </div>
            </c:if>
            <c:forEach items="${postlist}" var="post">
                <li class="list-group-item" style="min-height: 50px">
                    <div class="postmsg">
                        <span style="min-width: 150px"><a
                                href="/postdetails?postlistId=${post.id}">${post.title}</a></span>
                        <span><fmt:formatDate value="${post.createTime}" pattern="yyyy-MM-dd HH:mm"/> 发表</span>
                        <span><i class="fa fa-eye"> ${post.browse}</i></span>
                        <span><i class="fa fa-thumbs-o-up"></i> ${post.collectCount}</span>
                        <span><i class="fa fa-commenting"></i> ${post.replynumber}</span>

                        <c:if test="${not empty loginUser}">
                            <c:if test="${loginUser.id eq user.id}">
                               <span class="post_r">
                                   <a class="btn btn-info layui-anim layui-anim-fadein"
                                      href="/user/post/edit?pid=${post.id}">编辑</a>
                                   <a class="btn btn-danger layui-anim layui-anim-fadein" href="javascript:;">删除</a>
                               </span>
                            </c:if>
                        </c:if>
                        <c:if test="${empty loginUser || loginUser.id != user.id}">
                            <span class="post_r">
                               <a class="btn btn-info layui-anim layui-anim-fadein"
                                  href="/postdetails?postlistId=${post.id}" target="_blank">看看</a>
                            </span>
                        </c:if>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>

</div>

<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>
<script>
    $(function () {
        var upload = layui.upload;
        $(".bg-setting").click(function () {

            layer.open({
                type: 1,
                skin: 'layui-layer-rim', //加上边框
                area: ['420px', '240px'], //宽高
                content: '<div class="layui-upload">' +
                    '  <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>' +
                    '  <button type="button" class="layui-btn" id="test9">开始上传</button>' +
                    '</div>'
            });
            upload.render({
                elem: '#test8'
                , url: '/upload/updatebg/'
                , auto: false
                //,multiple: true
                , bindAction: '#test9'
                , done: function (data) {

                    if (data.state === 1) {
                        $(".bg-top").css("background", "url(" + data.data.src + ") no-repeat 0 0");
                        layer.closeAll('page');
                    } else if (data.state === 0) {
                        layer.msg("系通出错！更换失败", { //layui弹出层提示
                            offset: '150'
                        });
                    } else if (data.state === 2) {
                        layer.msg("请您先登录", {
                            offset: '150',
                            time: 800
                        }, function () {
                            $('#denglu').trigger("click");
                        });
                    }

                }
            });
        });
        $("#replacehead").click(function () {
            layer.open({
                type: 1,
                skin: 'layui-layer-rim', //加上边框
                area: ['420px', '240px'], //宽高
                content: '<div class="layui-upload">' +
                    '  <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>' +
                    '  <button type="button" class="layui-btn" id="test9">开始上传</button>' +
                    '</div>'
            });
            upload.render({
                elem: '#test8'
                , url: '/user/uploadThumbnail/'
                , auto: false
                //,multiple: true
                , bindAction: '#test9'
                , done: function (data) {

                    if (data.state === 1) {
                        $("#replacehead").css({
                            "background": "url(/" + data.data.src + ")",
                            "background-size": "100% 100%"
                        });
                        layer.closeAll('page');
                    } else if (data.state === 0) {
                        layer.msg("系通出错！更换失败", { //layui弹出层提示
                            offset: '150'
                        });
                    } else if (data.state === 2) {
                        layer.msg("请您先登录", {
                            offset: '150',
                            time: 800
                        }, function () {
                            $('#denglu').trigger("click");
                        });
                    }

                }
            });

        })
    });
</script>
</body>
</html>
