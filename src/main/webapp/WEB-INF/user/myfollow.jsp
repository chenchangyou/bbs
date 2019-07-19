<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<html>
<head>
    <title>${loginUser.username}的个人中心</title>
    <meta http-equiv="Access-Control-Allow-Origin" content="*"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
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
<%--引入导航栏--%>
<%@include file="../../common/head.jsp" %>
<div class="layui-container" style="padding:0px 10px;margin: 0 auto">
    <%--引入头部--%>
    <%@include file="user_bg.jsp" %>
    <div style=" width: 100%;margin:10px auto;">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-nav" style="background-color: #FFFFFF;color: black">
                <li class="layui-nav-item "><a href="/user/index?uid=${user.id}"><i class="fa fa-home fa-1x"
                                                                                    style="color: purple"></i>
                    主页 </a></li>
                <li class="layui-nav-item "><a href="/user/post/list?uid=${user.id}"><i
                        class="fa fa-pencil-square-o fa-1x"
                        style="color: #04bdff"></i> 帖子</a>
                </li>
                <li class="layui-nav-item"><a href="/user/album/?uid=${user.id}"><i style="color: rgba(4,150,98,0.98);"
                                                                                    class="layui-icon layui-icon-picture"></i>
                    相册</a></li>
                <li class="layui-nav-item layui-this"><a href="/user/followed?uid=${user.id}"><i
                        class="fa fa-user-plus fa-1x"></i> 关注</a></li>
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

    <div style="width: 100%;">

        <c:if test="${empty followedList}">
            <div class="panel panel-default">
                <div class="panel-body" style="text-align: center">
                  还没有关注呢
                </div>
            </div>
        </c:if>

        <c:if test="${not empty loginUser}">
            <c:if test="${loginUser.id eq user.id}">
                <c:forEach items="${followedList}" var="followed">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <a href="/user/index?uid=${followed.followeId.id}">
                                <img style="width: 60px;height: 60px" src="${followed.followeId.headshot}" alt="..."
                                     class="img-circle">
                            </a>
                            <a href="/user/index?uid=${followed.followeId.id}">
                            <span>
                                    ${followed.followeId.username}
                            </span>
                            </a>
                <span style="margin-left: 1%;color:#c2c2c2;">
                    简介：<c:if test="${empty followed.followeId.synopsis}">
                        这个人很懒，什么都没写
                        </c:if>
                    <c:if test="${not empty followed.followeId.synopsis}">
                        ${followed.followeId.synopsis}
                    </c:if>
                 </span>
                            <span class="layui-form" style="position:absolute;right: 4%">
                                <input type="checkbox" value="${followed.followeId.id}" name="switch" lay-skin="switch" lay-filter="followSwitch" checked
                                       lay-text="关注|已取消">
                            </span>
                        </div>
                    </div>
                </c:forEach>
            </c:if>

            <c:if test="${loginUser.id != user.id}">
                <c:if test="${setting.followed}">
                    <c:forEach items="${followedList}" var="followed">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <a href="/user/index?uid=${followed.followeId.id}">
                                    <img style="width: 60px;height: 60px" src="${followed.userId.headshot}"
                                         alt="..." class="img-circle">
                                </a>
                                <a href="/user/index?uid=${followed.followeId.id}">
                                    <span>
                                            ${followed.followeId.username}
                                    </span>
                                </a>
                                <span style="margin-left: 1%;color:#c2c2c2;">
                                    简介：<c:if test="${empty followed.followeId.synopsis}">
                                                    这个人很懒，什么都没写
                                                </c:if>
                                    <c:if test="${not empty followed.followeId.synopsis}">
                                        ${followed.followeId.synopsis}
                                    </c:if>
                                 </span>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${setting.followed == false}">
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
            <c:if test="${setting.followed}">
                <c:forEach items="${followedList}" var="followed">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <a href="/user/index?uid=${followed.followeId.id}">
                                <img style="width: 60px;height: 60px" src="${followed.followeId.headshot}" alt="..."
                                     class="img-circle">
                            </a>
                            <a href="/user/index?uid=${followed.followeId.id}">
                                    <span>
                                            ${followed.followeId.username}
                                    </span>
                            </a>
                            <span style="margin-left: 1%;color:#c2c2c2;">
                                简介：<c:if test="${empty followed.followeId.synopsis}">
                                            这个人很懒，什么都没写
                                        </c:if>
                                <c:if test="${not empty followed.followeId.synopsis}">
                                    ${followed.followeId.synopsis}
                                </c:if>
                             </span>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${setting.followed == false}">
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


<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>

<script>
    layui.use(['layer', 'form'], function () {
        var $ = layui.jquery
            , upload = layui.upload
            , form = layui.form
            , layer = layui.layer;

        form.on('switch(followSwitch)', function (data) {
            var id = data.value;
            // layer.msg(status_id);
            $.ajax({
                url: "/user/followed",
                type: "post",
                dataType: "JSON",
                data: {fid:id},
                success: function (data) {
                    if (data === 0) {
                      /*  layer.msg(data.msg);
                        location.reload();
                        return false;*/
                    } else if(data===1){
                        /*layer.msg(data.msg);
                        setTimeout(function () {
                            location.reload();
                        }, 1000);
                        return false;*/
                    }
                },error:function () {
                    layer.msg("系统出错");
                }
            });
        });
    });
</script>
<script src="${ctx}/static/js/user_index.js" type="text/javascript"></script>

</body>
</html>
