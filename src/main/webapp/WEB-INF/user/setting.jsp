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
    <%--引入背景--%>
    <%@include file="user_bg.jsp"%>
    <div style=" width: 100%;margin:10px auto;">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-nav" style="background-color: #FFFFFF;color: black">
                <li class="layui-nav-item "><a href="/user/index?uid=${user.id}"><i class="fa fa-home fa-1x"
                                                                                       style="color: purple"></i>
                    主页 </a></li>
                <li class="layui-nav-item "><a href="/user/post/list?uid=${loginUser.id}"><i
                        class="fa fa-pencil-square-o fa-1x"
                        style="color: #04bdff"></i> 帖子</a>
                </li>
                <li class="layui-nav-item "><a href="/user/followed?uid=${loginUser.id}"><i
                        class="fa fa-user-plus fa-1x"></i> 关注</a></li>
                <li class="layui-nav-item"><a href="/user/collection?uid=${loginUser.id}"><i class="fa fa-star fa-1x"
                                                                                             style="color: orange"></i>
                    收藏</a>
                </li>
                <li class="layui-nav-item"><a href="/user/fans?uid=${loginUser.id}"><i class="fa fa-heart fa-1x"
                                                                                       style="color: #eeb4c3"></i>
                    粉丝 </a></li>
                <li class="layui-nav-item  layui-this"><a href="/user/setting?uid=${user.id}"><i
                        class="fa fa fa-cog fa-spin fa-1x" style="color: #041527"></i>
                    设置</a></li>

            </ul>
        </div>
    </div>

    <div class="layui-form layui-row layui-col-space20">

        <div  class="layui-col-md4 layui-col-sm5 layui-col-xs12">
        <table style="float: left" class="layui-table" lay-skin="row" lay-size="lg">
            <colgroup>
                <col width="150">
                <col width="120">
                <col>
            </colgroup>
            <h5>隐私设置</h5>

            <tbody class="layui-form">
                <tr>
                    <td>我的收藏</td>
                    <td><input type="checkbox" name="collect" lay-filter="switchTest" lay-skin="switch" lay-text="公开|隐藏" <c:if test="${userSetting.collect}">checked</c:if>></td>
                </tr>
                <tr>
                    <td>我的关注</td>
                    <td><input type="checkbox" name="followed" lay-filter="switchTest" lay-skin="switch" lay-text="公开|隐藏"<c:if test="${userSetting.followed}">checked</c:if>></td>
                </tr>
                <tr>
                    <td>我的粉丝</td>
                    <td><input type="checkbox" name="fans"lay-filter="switchTest" lay-skin="switch" lay-text="公开|隐藏"<c:if test="${userSetting.fans}">checked</c:if>></td>
                </tr>
                <tr>
                    <td>性别</td>
                    <td><input type="checkbox" name="sex" lay-filter="switchTest" lay-skin="switch" lay-text="公开|隐藏"<c:if test="${userSetting.sex}">checked</c:if>></td>
                </tr>
                <tr>
                    <td>个人资料</td>
                    <td><input type="checkbox" name="usetting" lay-filter="switchTest" lay-skin="switch" lay-text="公开|隐藏"<c:if test="${userSetting.usetting}">checked</c:if>></td>
                </tr>
            </tbody>
        </table>
        </div>

        <div class="layui-col-md6 layui-col-sm7 layui-col-xs12" style="margin-top: 5%">
            <blockquote style="padding: 6px;font-size: 16px" class="layui-elem-quote">更改密码</blockquote>
            <form class="layui-form" method="post">
                <input name="uid" id="user_id" value="${user.id}" type="hidden">
                <div class="layui-form-item">
                    <label class="layui-form-label">原密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="password" required lay-verify="required" placeholder="请输入原密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">新密码</label>
                    <div class="layui-input-inline">
                        <input type="password" name="newPassword" required lay-verify="required" placeholder="请输入新密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="updatepassword">确认更改</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
    </div>
</div>

<script src="${ctx}/static/layui/layui.all.js" type="text/javascript"></script>
<script src="${ctx}/static/js/user_index.js" type="text/javascript"></script>
</body>
</html>
