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
<div class="layui-container" style="padding:0px 10px;margin: 0 auto">
    <%--引入头部--%>
    <%@include file="user_bg.jsp" %>
    <div style="margin:10px auto;">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-nav" style="background-color: #FFFFFF;color: black">
                <li class="layui-nav-item "><a href="/user/index?uid=${user.id}"><i class="fa fa-home fa-1x"
                                                                                       style="color: purple"></i>
                    主页 </a></li>
                <li class="layui-nav-item layui-this"><a href="/user/post/list?uid=${user.id}"><i
                        class="fa fa-pencil-square-o fa-1x"
                        style="color: #04bdff"></i> 帖子</a>
                </li>
                <li class="layui-nav-item"><a href="/user/album/?uid=${user.id}"><i style="color: rgba(4,150,98,0.98);" class="layui-icon layui-icon-picture"></i>
                    相册</a></li>
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


    <div class="layui-row" style="" onload="load();">
        <ul class="list-group">
            <c:if test="${empty postlist}">
                <div class="panel panel-default">
                    <div class="panel-body" style="text-align: center">
                        您还没有发过帖子呢
                    </div>
                </div>
            </c:if>
            <c:forEach items="${postlist}" var="post">
                <li class="list-group-item" style="min-height: 50px;color: #c2c2c2">
                    <div class="postmsg layui-row">
                        <span class="layui-col-xs12" style="min-width: 150px"><a
                                href="/postdetails?postlistId=${post.id}">${post.title}</a></span>
                        <span class="layui-col-xs12">
                            <div class="layui-row">
                                <div  class="layui-col-xs6">
                                    <span class="layui-hide-xs"><fmt:formatDate value="${post.createTime}" pattern="yyyy-MM-dd HH:mm"/> 发表</span>
                                    <span class="layui-hide-sm layui-hide-md"><fmt:formatDate value="${post.createTime}" pattern="yyyy-MM-dd HH:mm"/></span>
                                </div>
                                <div class="layui-col-xs6 left_boxs" style="text-align: right">
                                    <span><i class="fa fa-eye"> ${post.browse}</i></span>
                                    <span><i class="fa fa-thumbs-o-up"></i> ${post.collectCount}</span>
                                    <span><i class="fa fa-commenting"></i> ${post.replynumber}</span>
                                </div>
                             </div>
                        </span>
                        <c:if test="${not empty loginUser}">
                            <c:if test="${loginUser.id eq user.id}">
                               <span class="post_r">
                                   <a class="btn btn-info layui-anim layui-anim-fadein"
                                      href="/user/post/edit?pid=${post.id}">编辑</a>
                                   <a id="${post.id}" class="btn btn-danger layui-anim layui-anim-fadein deletePost" href="javascript:">删除</a>
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

<script src="${ctx}/static/layui/layui.js" type="text/javascript"></script>
<script src="${ctx}/static/js/user_index.js" type="text/javascript"></script>

<script>
    $(function () {

    $(".deletePost").click(function () {
        layui.use('layer',function () {

            var $this = $(this);
            var id = $this.attr("id");
            var $delete = $this.parent().parent().parent();
            $.post("/user/deletePost",{postId:id},function (data) {
                if(data == 'ok'){
                    layer.msg("删除成功");
                    $delete.animate({height: "0px"}, function () {
                        $delete.remove();
                    });
                }else {
                    layer.msg("删除失败")
                }
            })
        })
      })
    })
</script>
</body>
</html>
