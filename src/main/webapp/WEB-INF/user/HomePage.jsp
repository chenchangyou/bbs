<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/taglib.jsp" %>
<html>
<head>
    <title>${loginUser.username}的个人中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*"/>
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
    <%--引入菜单栏跟头部--%>
    <%--引入头部--%>
    <%@include file="user_bg.jsp" %>
    <div style=" margin:10px auto;">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-nav" style="background-color: #FFFFFF;color: black">

                <li class="layui-nav-item layui-this"><a href="/user/index?uid=${user.id}"><i class="fa fa-home fa-1x"
                                                                                              style="color: purple"></i>
                    主页 </a></li>
                <li class="layui-nav-item <%--layui-this--%>"><a href="/user/post/list?uid=${user.id}"><i
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

    <div class="layui-row layui-col-space8">

        <div class="layui-col-md9 layui-col-sm9 layui-col-xs12" style="float: left;">
            <blockquote class="layui-elem-quote">我的介绍</blockquote>
            <div style="width: 100%;font-size: 16px">
                <div style="width: 100%;height: 30px">
                    <span style="line-height: 30px ;min-width: 100px;float: left">昵称：${user.nickname}</span>

                    <c:if test="${not empty loginUser}">
                        <c:if test="${loginUser.id eq user.id}">
                            <a style="line-height: 30px ;width: 100px;padding: 0 3px;float: right;color: #1E9FFF"
                               href="javascript:;" onclick="updateuser(${user.id});">修改资料>></a>
                        </c:if>
                    </c:if>
                </div>
                <div>性别：${user.sex}</div>
                <div>年龄：${user.age}</div>
                <%--<div>联系电话：${user.tel}</div>--%>
                <div>邮箱：${user.email}</div>
                <div>注册时间：<fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd"/></div>
            </div>
            <h4>简介：</h4>
            <div style="min-height: 120px" class="form-control">${user.synopsis}</div>
        </div>
        <div class="layui-col-md3 layui-col-sm3 layui-col-xs12" style="float: right">
            <div class="panel panel-warning">
                <div class="panel-body">
                    我的公告
                </div>
                <div class="panel-footer">欢迎来到我的主页</div>
            </div>
        </div>

    </div>


</div>
<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>
<script src="${ctx}/static/js/user_index.js" type="text/javascript"></script>

</body>
</html>
