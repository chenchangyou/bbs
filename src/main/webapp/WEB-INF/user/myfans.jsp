<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<html>
<head>
    <title>${loginUser.username}的个人中心</title>
    <meta http-equiv="Access-Control-Allow-Origin" content="*"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link href="${ctx}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${ctx}/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <%--引入样式--%>
    <%@include file="userstyle.jsp" %>
</head>
<body>
<%--引入导航栏--%>
<%@include file="../../common/head.jsp" %>
<div class="layui-container" style="padding:0px 10px;margin: 0 auto">
<div style="margin: 0 auto" class="layui-row">
    <div class="layui-col-xs12 layui-col-sm12 layui-col-md12"
         style="margin: 0 auto;min-height: 100%;background-color: #FFFFFF">
        <%--引入头部--%>
        <%@include file="user_bg.jsp" %>
        <div style=" width: 100%;margin:10px auto;">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-nav" style="background-color: #FFFFFF;color: black">
                    <li class="layui-nav-item <%--layui-this--%>"><a href="/user/index?uid=${user.id}"><i
                            class="fa fa-home fa-1x" style="color: purple"></i>
                        主页 </a></li>
                    <li class="layui-nav-item "><a href="/user/post/list?uid=${user.id}"><i
                            class="fa fa-pencil-square-o fa-1x"
                            style="color: #04bdff"></i> 帖子</a>
                    </li>
                    <li class="layui-nav-item"><a href="/user/album/?uid=${user.id}"><i style="color: rgba(4,150,98,0.98);" class="layui-icon layui-icon-picture"></i>
                        相册</a></li>
                    <li class="layui-nav-item "><a href="/user/followed?uid=${user.id}"><i
                            class="fa fa-user-plus fa-1x"></i> 关注</a></li>
                    <li class="layui-nav-item"><a href="/user/collection?uid=${user.id}"><i class="fa fa-star fa-1x"
                                                                                            style="color: orange"></i>
                        收藏</a>
                    </li>
                    <li class="layui-nav-item layui-this"><a href="/user/fans?uid=${user.id}"><i
                            class="fa fa-heart fa-1x" style="color: #eeb4c3"></i>
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
        <hr>

        <div style="width: 100%;">

            <c:if test="${empty followedList}">
                <div class="panel panel-default">
                    <div class="panel-body" style="text-align: center">
                        赶紧写一篇优质的帖子让更多的人关注你吧
                    </div>
                </div>
            </c:if>

            <c:if test="${not empty loginUser}">
                <c:if test="${loginUser.id eq user.id}">
                    <c:forEach items="${followedList}" var="followed">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <a href="/user/index?uid=${followed.userId.id}">
                                    <img style="width: 60px;height: 60px" src="${followed.userId.headshot}" alt="..."
                                         class="img-circle">
                                </a>
                                <a href="/user/index?uid=${followed.userId.id}">

                                    <span>
                                            ${followed.userId.username}
                                    </span>
                                    <span style="margin-left: 1%;color:#c2c2c2;">简介：<c:if test="${empty followed.userId.synopsis}">
                                        这个人很懒，什么都没写
                                    </c:if>
                                        <c:if test="${not empty followed.userId.synopsis}">
                                            ${followed.userId.synopsis}
                                        </c:if>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>

                <c:if test="${loginUser.id != user.id}">
                    <c:if test="${setting.fans}">
                        <c:forEach items="${followedList}" var="followed">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <a href="/user/index?uid=${followed.userId.id}">
                                        <img style="width: 60px;height: 60px" src="${followed.userId.headshot}"
                                             alt="..." class="img-circle">
                                    </a>
                                    <a href="/user/index?uid=${followed.userId.id}">
                                    <span>
                                            ${followed.userId.username}
                                    </span>
                                    </a>
                                    <span style="margin-left: 1%;color:#c2c2c2;">简介：<c:if test="${empty followed.userId.synopsis}">
                                        这个人很懒，什么都没写
                                    </c:if>
                                        <c:if test="${not empty followed.userId.synopsis}">
                                            ${followed.userId.synopsis}
                                        </c:if>
                                    </span>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${setting.fans == false}">
                        <div class="layui-container" style=" background-color:#ffffff;width: 100%;text-align: center">
                            <div>
                                <img src="/static/images/expression_helpless.gif">
                                <span> 很抱歉该用户设置了内容不对外公开 </span>
                            </div>
                        </div>
                    </c:if>
                </c:if>
            </c:if>

            <c:if test="${empty loginUser}">
                <c:if test="${setting.fans}">
                    <c:forEach items="${followedList}" var="followed">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <a href="/user/index?uid=${followed.userId.id}">
                                    <img style="width: 60px;height: 60px" src="${followed.userId.headshot}" alt="..."
                                         class="img-circle">
                                </a>
                                <a href="/user/index?uid=${followed.userId.id}">
                                    <span>
                                            ${followed.userId.username}
                                    </span>
                                </a>
                                <span style="margin-left: 1%;color:#c2c2c2;">简介：<c:if test="${empty followed.userId.synopsis}">
                                    这个人很懒，什么都没写
                                </c:if>
                                        <c:if test="${not empty followed.userId.synopsis}">
                                            ${followed.userId.synopsis}
                                        </c:if>
                                    </span>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${setting.fans == false}">
                    <div class="layui-container" style=" background-color:#ffffff;width: 100%;text-align: center">
                        <div>
                            <img src="/static/images/expression_helpless.gif">
                            <span> 很抱歉该用户设置了内容不对外公开 </span>
                        </div>
                    </div>
                </c:if>
            </c:if>
        </div>
    </div>
</div>
</div>

<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>
<script>
    layui.use(['layer', 'form'], function () {
        var $ = layui.jquery
            , upload = layui.upload
            , form = layui.form
            , layer = layui.layer;

        form.on('switch(fansSwitch)', function (data) {
            var status_id = data.value;
            var csrfToken = "<?= Yii::$app->request->csrfToken ?>";
            $.ajax({
                url: "/admin/category/ajaxstatus",
                type: "post",
                dataType: "JSON",
                data: {status_id: status_id, _csrf_admin: csrfToken},
                success: function (data) {
                    if (data.success == true) {
                        layer.msg(data.msg);
                        location.reload();
                        return false;
                    } else {
                        layer.msg(data.msg);
                        setTimeout(function () {
                            location.reload();
                        }, 1000);
                        return false;
                    }
                }
            });
        });
    });
</script>
<script src="${ctx}/static/js/user_index.js" type="text/javascript"></script>

</body>
</html>
