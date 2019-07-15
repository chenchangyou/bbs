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
    <%--引入样式--%>
    <%@include file="userstyle.jsp" %>
    <%--<%@include file="common/style.jsp" %>--%>
    <style>

        .panel-body {
            display: none;
            position: relative;
            z-index: 2;
            padding: 8px;
            /*color: #FFFFFF;*/
            /*background-color: rgba(22, 22, 22, 0.75 );*/
        }

        .panel-info{
            margin-bottom: -1px;
            z-index: 1;
            position: relative;
        }
        .panel-info:hover .panel-body {
            display: block;
        }
        .panel-info>.panel-heading{
            padding: 10px;
            background-color:#FFFFFF;
            border: none;
        }
    </style>
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
                <li class="layui-nav-item "><a href="/user/followed?uid=${user.id}"><i
                        class="fa fa-user-plus fa-1x"></i> 关注</a></li>
                <li class="layui-nav-item layui-this"><a href="/user/collection?uid=${user.id}"><i
                        class="fa fa-star fa-1x" style="color: orange"></i> 收藏</a>
                </li>
                <li class="layui-nav-item "><a href="/user/fans?uid=${user.id}"><i class="fa fa-heart fa-1x"
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

    <div class="layui-row" style="">

        <c:if test="${empty collectList}">
            <div class="panel panel-default">
                <div class="panel-body" style="text-align: center">
                    还没有收藏呢
                </div>
            </div>
        </c:if>


        <c:if test="${not empty loginUser}">
            <c:if test="${loginUser.id eq user.id}">
                <c:forEach items="${collectList}" var="collect">

                    <div class="layui-row panel panel-info layui-anim layui-anim-up">
                        <div class="panel-heading layui-col-md12">
                            <h4 class="panel-title">
                                <a href="/postdetails?postlistId=${collect.post.id}">${collect.post.title}</a>
                            </h4>
                        </div>
                        <div class="panel-body layui-anim layui-anim-up layui-col-md12">
                            <span class="layui-col-md11">简介： ${collect.post.synopsis}</span>
                            <span class="layui-col-md1"><a href="javascript:"><i class="layui-icon layui-icon-close"></i></a></span>
                        </div>
                    </div>

                </c:forEach>
            </c:if>

            <c:if test="${loginUser.id != user.id}">
                <c:if test="${setting.collect}">
                    <c:forEach items="${collectList}" var="collect">

                        <div class="layui-row panel panel-info layui-anim layui-anim-up">
                            <div class="panel-heading layui-col-md12">
                                <h4 class="panel-title">
                                    <a href="/postdetails?postlistId=${collect.post.id}">${collect.post.title}</a>
                                </h4>
                            </div>
                            <div class="panel-body layui-anim layui-anim-up layui-col-md12">
                                <span class="layui-col-md11">简介： ${collect.post.synopsis}</span>
                            </div>
                        </div>

                    </c:forEach>
                </c:if>
                <c:if test="${setting.collect == false}">
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
            <c:if test="${setting.collect}">
                <c:forEach items="${collectList}" var="collect">

                    <div class="layui-row panel panel-info layui-anim layui-anim-up">
                        <div class="panel-heading layui-col-md12">
                            <h4 class="panel-title">
                                <a href="/postdetails?postlistId=${collect.post.id}">${collect.post.title}</a>
                            </h4>
                        </div>
                        <div class="panel-body layui-anim layui-anim-up layui-col-md12">
                            <span class="layui-col-md11">简介： ${collect.post.synopsis}</span>
                        </div>
                    </div>

                </c:forEach>
            </c:if>
            <c:if test="${setting.collect == false}">
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
<script src="${ctx}/static/js/user_index.js" type="text/javascript"></script>

</body>
</html>
